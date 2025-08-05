var app = angular.module('rounds',['account-module','app-module']);

app.controller('roundsCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	
	$scope.app.list($scope);
	
});