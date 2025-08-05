var app = angular.module('events',['account-module','app-module']);

app.controller('eventsCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	
	$scope.app.list($scope);
	
});