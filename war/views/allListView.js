var app = app || {};

app.TodoModel = Backbone.Model.extend({
	
	idAttribute : '_key',
    defaults: {
        title : "No title",
        completed: false,
        key: ""
    },
    urlRoot:'/save', 
    toggle: function(attr, silent) {
        var setter = {};
        setter[attr] = !this.get(attr);
        this.set(setter, silent? {silent: true} : {});
    },
    
});


var TodoCollection = Backbone.Collection.extend({
    model: app.TodoModel,
    url:'/fetch',
    completed: function () {
		return this.where({completed: true});
	},

	remaining: function () {
		return this.where({completed: false});
	},

	nextOrder: function () {
		return this.length ? this.last().get('order') + 1 : 1;
	},

	comparator: 'order'
});
 
var todoCollection = new TodoCollection();

	app.AllView = Backbone.View.extend({
		el: ".all",
		collection : todoCollection,
		initialize: function () {
			this.updateFireObj();
			this.removeListen();
			this.listenTo(this.model, "change", this.render);
			this.listenTo(this.model, "add", this.render);

		},
		
		events:{
			'click .toggle': 'toggleCompletedCheck',
			'click .destroy': 'clear',
			'dblclick label': 'edit',
			'keypress .edit': 'updateOnEnter',
			'keydown .edit': 'revertOnEscape',
			'blur .edit': 'editBlur',
		},
		render: function(option)
		{
			this.option = option ? option : {};
			var template = _.template($('#all-list-view').html(), {todoCollection: this.option.collection ? this.option.collection.models : {}});
	        this.$el.html(template);
		},
		toggleCompletedCheck: function (e) {
			e.stopPropagation();
		    e.stopImmediatePropagation();
			var key = $(e.currentTarget).attr("id");
			this.model = todoCollection.findWhere({ key: key });
			this.model.toggle("completed", true);
			this.option.collection = todoCollection.add(this.model);
			var email= this.model.get("email");
			var title= this.model.get("title");
			var key= this.model.get("key");
			var completed = this.model.get("completed");
			this.updateUserData(email,key,title,completed);
			this.model.save();
		},
		editBlur: function (e) {
		    var key = $(e.currentTarget).attr("id");
			var value = $(e.target).val();
			this.close(value,key);
		},
		edit: function (e) {
			e.stopPropagation();
		    e.stopImmediatePropagation();
			var key = $(e.currentTarget).attr("id");
			$('#'+key).parent().addClass('editing');
			$('.'+key).focus();
		},
		updateFireObj : function(){
			var fireObj = firebase.database().ref("Todo/").on("child_changed", function(snapshot) {
				 var fireData = snapshot.val();
				 var newKey = fireData.key;
				 var completed = fireData.completed;
				 var title = fireData.title;
				 this.model = todoCollection.findWhere({key : newKey});
				 this.model.set("completed",completed);
				 this.model.set("title",title);
				 todoCollection.add(this.model);
				 var appView = new app.AllView();
				 appView.render();
			  }, function (error) {
			     console.log("Error: " + error.code);
			  });
		},
		updatedTemplate:function(option){
			 var template = _.template($('#all-list-view').html(), {todoCollection: this.option.todoCollection ? this.option.todoCollection.models : {}});
		     this.$el.html(template);
		},
		updateOnEnter: function (e) {
			if (e.which === 13) {
				var key = $(e.currentTarget).attr("id");
				var value = $(e.target).val();
				this.close(value,key);
		}
		},
		close: function (value,key) {
			var trimmedValue = value.trim();
			if (!$('#'+key).parent().hasClass('editing')) {
				return;
			}

			if (trimmedValue) {
				this.model = todoCollection.findWhere({ key: key });
				this.model.set({ title: trimmedValue });
			} else {
				this.clear();
			}
			var email= this.model.get("email");
			var title= this.model.get("title");
			var key= this.model.get("key");
			var completed = this.model.get("completed");
			$('#'+key).parent().removeClass('editing');
			this.render(this.model);
			this.updateUserData(email,key,title,completed);
			this.model.save();
		},
		updateUserData : function(email,key,title,completed) {
			var postData = {
				    completed: completed,
				    email: email,
				    key: key,
				    title: title
				  };

			const childRef = firebase.database().ref('Todo/'+key);
			let updateObj = {};
			updateObj = postData;
		    childRef.update(updateObj);
		},
		revertOnEscape: function (e) {
			if (e.which === 27) {
				this.$el.removeClass('editing');
				this.render();
			}
		},
		removeListen : function(){
			firebase.database().ref("Todo/").on("child_removed", function(snapshot) {
				var firedata = snapshot.val();
				var newKey = firedata.key;
				var completed = firedata.completed;
				this.model = todoCollection.findWhere({key : newKey});
				todoCollection.remove(this.model);
				var appView = new app.AllView();
				appView.render();
		});
		},
		clear: function (e) {
			var key = $(e.currentTarget).attr("id");
			var model = todoCollection.findWhere({ key: key });
			
			if( typeof model == "undefined")
			{
				return;
			}
			model.set({_key:key});
			model.destroy();
			todoCollection.remove();
			firebase.database().ref("Todo/"+key).remove();
			this.render();
		},
	});
	
app.allCollection = Backbone.Collection.extend({
	model: new app.TodoModel()
});

app.MainView = Backbone.View.extend({
	el: ".todoBody",
	collection: todoCollection,
	initialize: function () {
		var fetchResult = todoCollection.fetch();
		this.fetchFireObj();
		this.option = {};
		this.allRedCollection = new TodoCollection();
		this.listenTo(this.collection, 'add', this.listViewRender);
		this.render();
	},
	events:{
		"keypress .addItem" : "addOnEnter",
		'click .toggle-all': 'toggleAllComplete'
	},
	render: function()
	{
		var template = _.template($('#mainView').html());
        this.$el.html(template);

	},
	addOnEnter	:	function(e)
	{
		if (e.which === 13  && this.$(newItem).val().trim()) 
		{
			var value = $(e.target).val().trim();
			var key = this.guid();
			this.model = new app.TodoModel();
			this.model.set('email',email);
			this.model.set('title',value);
			this.model.set('key',key);
			$(newItem).val("");
			this.collection.add(this.model);
			this.model.save();
			var newModel = this.model.attributes;
			this.writeUserData(newModel,key);
		}
	},
	fetchFireObj : function(){
		var fireObj = firebase.database().ref("Todo/").on("child_added", function(snapshot) {
			 var fireData = snapshot.val();
			 var newKey =  fireData.key;
			 var newUser = fireData.email;
			 var existing = todoCollection.findWhere({key : newKey});
			 var firbaseModel = new app.TodoModel(fireData);
			 if(existing == undefined && newUser == email){
				 todoCollection.add(firbaseModel);
			 }
			 else {
				 existing.toJSON();
				 if(todoCollection.contains(existing)){
				 return;
				 }
			 }
		  }, function (error) {
		     console.log("Error: " + error.code);
		  });
	},
	writeUserData : function(newModel,key) {
		  firebase.database().ref('Todo/'+key).set(newModel);
	},
		  
	guid : function(){
       	  return this.s4() + this.s4() + '-' + this.s4() + '-' + this.s4() + '-' +
       	this.s4() + '-' + this.s4() + this.s4() + this.s4();
    },
    s4 : function(){
       	    return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);   	
	},
	listViewRender : function()
	{
		var listItemView = new app.AllView();
		this.option.collection = this.collection;
		listItemView.render( this.option );
	},
    toggleAllModelStatus: function(status, todoCollection){
    	var self = this;
    	_.each(todoCollection.models, function(todoItem) {
    		todoItem.set("completed",status);
	    	todoItem.save();
	    	self.allRedCollection.add(todoItem);
	    	});
    },
    
	toggleAllComplete: function (e) 
						{
							var completedStatus = 0;
							var notCompltedStatus	= 0;
							var completed = true;
							e.stopPropagation();
						    e.stopImmediatePropagation();
						    _.each(todoCollection.models, function(todoItem) {
						    	if(todoItem.get("completed")) {
						    		completedStatus += 1;
						    	} else 
						    	{
						    		notCompltedStatus += 1;
						    	}
						    });
						    
						    if( notCompltedStatus == todoCollection.length )
						    {
						    	this.toggleAllModelStatus(true,todoCollection);
						    }
						    else if( completedStatus == todoCollection.length )
						    {
						    	this.toggleAllModelStatus(false,todoCollection);
						    } else if( completedStatus > 0 )
						    {
						    	this.toggleAllModelStatus(true, todoCollection);
						    } 
						    
						    this.option.collection = this.allRedCollection;
							var template = _.template($('#all-list-view').html(), {todoCollection: this.option.collection ? this.option.collection.models : {}});
							$('#all').html(template);
							
						},
});







