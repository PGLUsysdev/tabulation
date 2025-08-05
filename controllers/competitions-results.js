var app = angular.module('competitionsResults',['account-module','competitions-results']);

app.controller('competitionsResultsCtrl',function($scope,competitionsResults) {

	$scope.formHolder = {};

	$scope.views = {};
	$scope.views.title = 'Competitions';

	$scope.competitionsResults = competitionsResults;
	$scope.competitionsResults.data($scope);

});