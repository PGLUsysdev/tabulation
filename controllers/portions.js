var app = angular.module('portions',['account-module','app-module']);

app.controller('portionsCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	
	$scope.app.list($scope);
	
});