var app = angular.module('round',['account-module','app-module']);

app.controller('roundCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	
});