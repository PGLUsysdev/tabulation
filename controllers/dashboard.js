var app = angular.module('dashboard',['account-module','judge-dashboard','tabulator-dashboard','notifications-module']);

app.controller('dashboardCtrl',function($scope,judge,tabulator) {

	$scope.views = {};
	$scope.views.title = '';
	
	$scope.alerts = {};
	
	$scope.monitor = {};
	
	$scope.activeTabs = {};
	$scope.activeTabs.portions_contestants = 0;  // Portion Contestants Tab Index
	$scope.activeTabs.portions = 0; // Portion Tab Index
	$scope.activeButtons = []; // Structure [index = Portion Tab Index | value = Contestant Menu Index
	
	$scope.activeTabs.scoresSheets = 0; // Score Tab Index
	$scope.activeTabs.scoresSheetsRounds = 0; // Score Tab Index

	$scope.judge = judge;	
	$scope.judge.data($scope);

	$scope.tabulator = tabulator;
	$scope.tabulator.data($scope);
	
	$scope.network = {};
	$scope.network.online = navigator.onLine;
	
	window.addEventListener('online',  function(e) {
		$scope.network.online = true;
	});
    window.addEventListener('offline', function(e) {
		$scope.network.online = false;
	});	

});