var app = angular.module('peopleChoice',['account-module','app-module','notifications-module']);

app.controller('peopleChoiceCtrl',function($scope,app) {

	$scope.views = {};
	$scope.views.title = '';
	
	$scope.app = app;
	$scope.app.data($scope);
	
});