var app = angular.module('results',['account-module','individual-results']);

app.controller('resultsCtrl',function($scope,individual) {
	
	$scope.formHolder = {};

	$scope.views = {};
	$scope.views.title = 'Individual Result';

	$scope.individual = individual;
	$scope.individual.data($scope);

});