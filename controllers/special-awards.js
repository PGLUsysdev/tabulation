var app = angular.module('specialAwards',['account-module','special-awards']);

app.controller('specialAwardsCtrl',function($scope,specialAwards) {
	
	$scope.formHolder = {};

	$scope.views = {};
	$scope.views.title = 'Special Awards';

	$scope.specialAwards = specialAwards;
	$scope.specialAwards.data($scope);

});