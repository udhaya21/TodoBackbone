var todo = todo || {};
(function($) {
	"use strict";
	var todoview = Backbone.View.extend({
		initialize : function() {
			this.render();
		},
		render : function() {
			var template = _.template($("#addTodo").html());
			this.$el.html(template);
		}
	});

	$(document).ready(function() {
		var todo = new todoview({
			el : $("#todoAdd")
		});
	});
})(jQuery);
