var app = angular.module('monitoring',['account-module','monitoring-module']);

app.controller('monitoringCtrl',function($scope,monitoring) {
	
	$scope.formHolder = {};

	$scope.views = {};
	$scope.views.title = 'Monitor Portions, Judges';

	$scope.monitoring = monitoring;
	$scope.monitoring.data($scope);
	
	$scope.network = {};
	$scope.network.online = navigator.onLine;
	
	window.addEventListener('online',  function(e) {
		$scope.network.online = true;
	});
    window.addEventListener('offline', function(e) {
		$scope.network.online = false;
	});		

});