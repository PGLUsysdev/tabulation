var app = angular.module('contestants',['account-module','app-module']);

app.controller('contestantsCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	
	$scope.app.list($scope);
	
});