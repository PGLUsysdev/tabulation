var app = angular.module('competitions',['account-module','competitions-module']);

app.controller('competitionsCtrl',function($scope,competitions) {
	
	$scope.formHolder = {};

	$scope.views = {};
	$scope.views.title = 'Competitions';

	$scope.competitionsM = competitions;
	$scope.competitionsM.data($scope);

});