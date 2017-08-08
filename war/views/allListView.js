var app = app || {};
var loginDetails = function(){
	var loginEmail = email;
	console.log(loginEmail);
};
app.TodoModel = Backbone.Model.extend({

	idAttribute : '_key',
	defaults : {
		title : "No title",
		completed : false,
		key : "",
	// order: app.TodoCollection.nextOrder()
	},
	urlRoot : '/save',
	
	toggle : function(attr, silent) {
		var setter = {};
		setter[attr] = !this.get(attr);
		this.set(setter, silent ? {
			silent : true
		} : {});
	},
	

});

var TodoCollection = Backbone.Collection.extend({
	model : app.TodoModel,
	url : '/fetch',
	comparator : 'order'
});

var todoCollection = new TodoCollection();
var todoCollectionCursor = new TodoCollection();

app.AllView = Backbone.View.extend({
			el : ".todoList",
			collection : todoCollection,
			initialize : function() {
				this.updateFireObj();
				this.removeListen();
				this.listenTo(this.model, "change", this.render);
				this.listenTo(this.model, "add", this.render);

			},
			events : {
				'click .toggle' : 'toggleCompletedCheck',
				'click .destroy' : 'clear',
				'dblclick label' : 'edit',
				'keypress .edit' : 'updateOnEnter',
				'keydown .edit' : 'revertOnEscape',
				'blur .edit' : 'editBlur',
			},
			render : function(option) {
				this.option = option ? option : {};
				var template = _.template(
								$('#all-list-view').html(),
								{
									todoCollection : this.option.collection ? this.option.collection.models
											: {}
								});
				this.$el.html(template);
			},
			toggleCompletedCheck : function(e) {
				e.stopPropagation();
				e.stopImmediatePropagation();
				var key = $(e.currentTarget).attr("id");
				this.model = todoCollection.findWhere({
					key : key
				});
				this.model.toggle("completed", true);
				this.option.collection = todoCollection.add(this.model);
				var email = this.model.get("email");
				var title = this.model.get("title");
				var key = this.model.get("key");
				var status = this.model.get("status");
				var completed = this.model.get("completed");
				this.updateUserData(email, key, title, completed, status);
				this.model.save();
			},
			editBlur : function(e) {
				var key = $(e.currentTarget).attr("id");
				var value = $(e.target).val();
				this.close(value, key);
			},
			edit : function(e) {
				e.stopPropagation();
				e.stopImmediatePropagation();
				var key = $(e.currentTarget).attr("id");
				$('#' + key).addClass('editing');
				$('.' + key).focus();
			},
			updateFireObj : function() {
				var fireObj = firebase.database().ref("Todo/").on(
						"child_changed", function(snapshot) {
							var fireData = snapshot.val();
							var newKey = fireData.key;
							var completed = fireData.completed;
							var title = fireData.title;
							var status = fireData.status;
							this.model = todoCollection.findWhere({
								key : newKey
							});
							this.model.set("completed", completed);
							this.model.set("title", title);
							this.model.set("status", status);
							todoCollection.add(this.model);
							var appView = new app.AllView();
							appView.render();
						}, function(error) {
							console.log("Error: " + error.code);
						});
			},
			updatedTemplate : function(option) {
				var template = _
						.template(
								$('#all-list-view').html(),
								{
									todoCollection : this.option.todoCollection ? this.option.todoCollection.models
											: {}
								});
				this.$el.html(template);
			},
			updateOnEnter : function(e) {
				if (e.which === 13) {
					var key = $(e.currentTarget).attr("id");
					var value = $(e.target).val();
					this.close(value, key);
				}
			},
			close : function(value, key) {
				var trimmedValue = value.trim();
				if (!$('#' + key).hasClass('editing')) {
					return;
				}

				if (trimmedValue) {
					this.model = todoCollection.findWhere({
						key : key
					});
					this.model.set({
						title : trimmedValue
					});
				} else {
					this.clear();
				}
				var email = this.model.get("email");
				var title = this.model.get("title");
				var key = this.model.get("key");
				var status = this.model.get("status");
				var completed = this.model.get("completed");
				$('#' + key).removeClass('editing');
				this.render(this.model);
				this.updateUserData(email, key, title, completed, status);
				this.model.save();
			},
			updateUserData : function(email, key, title, completed, status) {
				var postData = {
					completed : completed,
					email : email,
					key : key,
					title : title,
					status : status
				};

				const childRef = firebase.database().ref('Todo/' + key);
				let updateObj = {};
				updateObj = postData;
				childRef.update(updateObj);
			},
			revertOnEscape : function(e) {
				if (e.which === 27) {
					this.$el.removeClass('editing');
					this.render();
				}
			},
			removeListen : function() {
				firebase.database().ref("Todo/").on("child_removed",
						function(snapshot) {
							var firedata = snapshot.val();
							var newKey = firedata.key;
							var completed = firedata.completed;
							this.model = todoCollection.findWhere({
								key : newKey
							});
							todoCollection.remove(this.model);
							var appView = new app.AllView();
							appView.render();
						});
			},
			clear : function(e) {
				e.stopPropagation();
				e.stopImmediatePropagation();
				var key = $(e.currentTarget).attr("id");
				this.model = todoCollection.findWhere({
					key : key
				});
				var status = "inactive";
				this.model.set('status', status);
				var email = this.model.get("email");
				var title = this.model.get("title");
				var completed = this.model.get("completed");
				this.option.collection = todoCollection.add(this.model);
				this.render();
				this.updateUserData(email, key, title, completed, status);
				this.model.save();
				if (typeof model == "undefined") {
					return;
				}
				// model.destroy();
				// todoCollection.remove();
				// firebase.database().ref("Todo/"+key).remove();
			},
		});

app.allCollection = Backbone.Collection.extend({
	model : new app.TodoModel()
});

app.MainView = Backbone.View
		.extend({
			el : ".todoBody",
			collection : todoCollection,
			initialize : function() {
				todoCollectionCursor.fetch({
					success : function(collection, response, options) {
						var myCollections = collection.models;
						_.each(myCollections, function(model) {
							todoCollection.push(model);
						});
					}
				});

				this.fetchFireObj();
				this.option = {};
				this.allRedCollection = new TodoCollection();
				this.listenTo(this.collection, 'add', this.listViewRender);
				this.render();
			},
			events : {
				"keypress .addItem" : "addOnEnter",
				'click .toggle-all' : 'toggleAllComplete'
			},
			render : function() {
				this.$el.html("");

				var template = _.template($('#mainView').html());
				this.$el.html(template);

			},
			addOnEnter : function(e) {
				if (e.which === 13 && this.$(newItem).val().trim()) {
					var value = $(e.target).val().trim();
					var key = this.guid();
					var order = this.nextOrder();
					var status = "active";
					this.model = new app.TodoModel();
					this.model.set('email', email);
					this.model.set('title', value);
					this.model.set('key', key);
					this.model.set('order', order);
					this.model.set('status', status)
					$(newItem).val("");
					this.collection.add(this.model);
					this.model.save();
					var newModel = this.model.attributes;
					this.writeUserData(newModel, key);
					app.SingleTodoView = new app.singleTodoView();
					app.SingleTodoView.render(this.model);
				}
			},
			nextOrder : function() {
				return todoCollection.length ? todoCollection.last().get(
						'order') + 1 : 1;
			},
			fetchFireObj : function() {
				var fireObj = firebase.database().ref("Todo/").orderByChild("order").limitToFirst(5).on("child_added",function(snapshot) {
							var fireData = snapshot.val();
							var newKey = fireData.key;
							var newUser = fireData.email;
							var getStatus = fireData.status;
							if(getStatus == "active"){
							var existing = todoCollection.findWhere({
								key : newKey
							});
							var firbaseModel = new app.TodoModel(fireData);
							if (existing == undefined && newUser == email) {
								todoCollection.add(firbaseModel);
								// app.SingleTodoView = new
								// app.singleTodoView();
								// app.SingleTodoView.render(firbaseModel);
							} else {

								existing.toJSON();
								if (todoCollection.contains(existing)) {
									return;
								}
							}
						}else{
							return;
						}
				}, function(error) {
							console.log("Error: " + error.code);
						});
				todoCollection.fetch();
			},
			writeUserData : function(newModel, key) {
				firebase.database().ref('Todo/' + key).set(newModel);
			},

			guid : function() {
				return this.s4() + this.s4() + '-' + this.s4() + '-'
						+ this.s4() + '-' + this.s4() + '-' + this.s4()
						+ this.s4() + this.s4();
			},
			s4 : function() {
				return Math.floor((1 + Math.random()) * 0x10000).toString(16)
						.substring(1);
			},
			listViewRender : function() {
				if (typeof app.AllView == "function") {
					var listItemView = new app.AllView();
				}

				this.option.collection = this.collection;
				listItemView.render(this.option);
			},
			toggleAllModelStatus : function(status, todoCollection) {
				var self = this;
				_.each(todoCollection.models, function(todoItem) {
					todoItem.set("completed", status);
					todoItem.save();
					self.allRedCollection.add(todoItem);
				});
			},

			toggleAllComplete : function(e) {
				var completedStatus = 0;
				var notCompltedStatus = 0;
				var completed = true;
				e.stopPropagation();
				e.stopImmediatePropagation();
				_.each(todoCollection.models, function(todoItem) {
					if (todoItem.get("completed")) {
						completedStatus += 1;
					} else {
						notCompltedStatus += 1;
					}
				});

				if (notCompltedStatus == todoCollection.length) {
					this.toggleAllModelStatus(true, todoCollection);
				} else if (completedStatus == todoCollection.length) {
					this.toggleAllModelStatus(false, todoCollection);
				} else if (completedStatus > 0) {
					this.toggleAllModelStatus(true, todoCollection);
				}

				this.option.collection = this.allRedCollection;
				var template = _
						.template(
								$('#all-list-view').html(),
								{
									todoCollection : this.option.collection ? this.option.collection.models
											: {}
								});
				$('#all').html(template);

			},

		});

app.singleTodoView = Backbone.View
		.extend({
			el : ".todoList",
			collection : todoCollection,
			initialize : function() {

				this.updateFireObj();
				this.removeListen();
				this.listenTo(this.model, "change", this.render);
				this.listenTo(this.model, "add", this.render);

			},
			render : function(todoItem) {
				var data = todoItem.toJSON();
				var modelKey = data.key;
				$(".todoList").find($("li#" + modelKey)).remove();
				var tmpl = _.template($('#singleTodoView').html());
				$('.todoList').prepend(tmpl(data));
			},
			events : {
				'click .toggle' : 'toggleCompletedCheck',
				'click .destroy' : 'clear',
				'dblclick label' : 'edit',
				'keypress .edit' : 'updateOnEnter',
				'keydown .edit' : 'revertOnEscape',
				'blur .edit' : 'editBlur',
			},
			toggleCompletedCheck : function(e) {
				e.stopPropagation();
				e.stopImmediatePropagation();
				var key = $(e.currentTarget).attr("id");
				this.model = todoCollection.findWhere({
					key : key
				});
				this.model.toggle("completed", true);
				this.option.collection = todoCollection.add(this.model);
				var email = this.model.get("email");
				var title = this.model.get("title");
				var key = this.model.get("key");
				var status = this.model.get("status");
				var completed = this.model.get("completed");
				this.updateUserData(email, key, title, completed, status);
				this.model.save();
			},
			editBlur : function(e) {
				var key = $(e.currentTarget).attr("id");
				var value = $(e.target).val();
				this.close(value, key);
			},
			edit : function(e) {
				e.stopPropagation();
				e.stopImmediatePropagation();
				var key = $(e.currentTarget).attr("id");
				$('#' + key).addClass('editing');
				$('.' + key).focus();
			},
			updateFireObj : function() {
				var fireObj = firebase.database().ref("Todo/").on("child_changed", function(snapshot) {
							var fireData = snapshot.val();
							var newKey = fireData.key;
							var completed = fireData.completed;
							var title = fireData.title;
							var status = fireData.status;
							this.model = todoCollection.findWhere({
								key : newKey
							});
							this.model.set("completed", completed);
							this.model.set("title", title);
							this.model.set("status", status);
							todoCollection.add(this.model);
							var appView = new app.AllView();
							appView.render();
						}, function(error) {
							console.log("Error: " + error.code);
						});
			},
			updatedTemplate : function(option) {
				var template = _
						.template(
								$('#all-list-view').html(),
								{
									todoCollection : this.option.todoCollection ? this.option.todoCollection.models
											: {}
								});
				this.$el.html(template);
			},
			updateOnEnter : function(e) {
				if (e.which === 13) {
					var key = $(e.currentTarget).attr("id");
					var value = $(e.target).val();
					this.close(value, key);
				}
			},
			close : function(value, key) {
				var trimmedValue = value.trim();
				if (!$('#' + key).hasClass('editing')) {
					return;
				}

				if (trimmedValue) {
					this.model = todoCollection.findWhere({
						key : key
					});
					this.model.set({
						title : trimmedValue
					});
				} else {
					this.clear();
				}
				var email = this.model.get("email");
				var title = this.model.get("title");
				var key = this.model.get("key");
				var status = this.model.get("status");
				var completed = this.model.get("completed");
				$('#' + key).removeClass('editing');
				this.render(this.model);
				this.updateUserData(email, key, title, completed, status);
				this.model.save();
			},
			updateUserData : function(email, key, title, completed, status) {
				var postData = {
					completed : completed,
					email : email,
					key : key,
					title : title,
					status : status
				};

				const childRef = firebase.database().ref('Todo/' + key);
				let updateObj = {};
				updateObj = postData;
				childRef.update(updateObj);
			},
			revertOnEscape : function(e) {
				if (e.which === 27) {
					this.$el.removeClass('editing');
					this.render();
				}
			},
			removeListen : function() {
				firebase.database().ref("Todo/").on("child_removed",function(snapshot) {
							var firedata = snapshot.val();
							var newKey = firedata.key;
							var completed = firedata.completed;
							this.model = todoCollection.findWhere({
								key : newKey
							});
							todoCollection.remove(this.model);
							var appView = new app.AllView();
							appView.render();
						});
			},
			clear : function(e) {
				e.stopPropagation();
				e.stopImmediatePropagation();
				var key = $(e.currentTarget).attr("id");
				this.model = todoCollection.findWhere({
					key : key
				});
				var status = "inactive";
				this.model.set('status', status);
				var email = this.model.get("email");
				var title = this.model.get("title");
				var completed = this.model.get("completed");
				this.option.collection = todoCollection.add(this.model);
				this.render();
				this.updateUserData(email, key, title, completed, status);
				this.model.save();
				if (typeof model == "undefined") {
					return;
				}

			},
		});
