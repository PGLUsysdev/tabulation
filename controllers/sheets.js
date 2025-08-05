var app = angular.module('sheets',['account-module','scores-sheets']);

app.controller('sheetsCtrl',function($scope,sheets) {
	
	$scope.formHolder = {};

	$scope.views = {};
	$scope.views.title = 'Scores Worksheets';

	$scope.sheets = sheets;
	$scope.sheets.data($scope);

});