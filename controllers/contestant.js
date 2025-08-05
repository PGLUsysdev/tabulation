var app = angular.module('contestant',['account-module','app-module']);

app.controller('contestantCtrl',function($scope,app) {
	
	$scope.app = app;
	
	$scope.app.data($scope);
	
});