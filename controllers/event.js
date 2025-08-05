var app = angular.module('event',['account-module','app-module']);

app.controller('eventCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	
});