var app = angular.module('specialAwardsResults',['account-module','special-awards-results']);

app.controller('specialAwardsResultsCtrl',function($scope,specialAwardsResults) {
	
	$scope.formHolder = {};

	$scope.views = {};
	$scope.views.title = 'Special Awards';

	$scope.specialAwardsResults = specialAwardsResults;
	$scope.specialAwardsResults.data($scope);

});