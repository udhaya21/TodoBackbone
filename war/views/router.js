/*global Backbone */
var app = app || {};

(function() {
	'use strict';

	// Todo Router
	// ----------
	var TodoRouter = Backbone.Router.extend({
		routes : {
			'' : 'noHashTagURL'
		},
		noHashTagURL : function() {
			var mainView = new app.MainView();
		}
	});

	app.TodoRouter = new TodoRouter();
	Backbone.history.start();
})();
