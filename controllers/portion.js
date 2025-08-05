var app = angular.module('portion',['account-module','app-module']);

app.controller('portionCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	
});