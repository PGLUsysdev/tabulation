var app = angular.module('users',['account-module','app-module']);

app.controller('usersCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	$scope.app.list($scope);
	
});