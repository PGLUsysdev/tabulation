angular.module('active-event', []).factory('activeEvent', function($http) {
	
	function activeEvent() {

		var self = this;

		self.get = function(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/get-active-event.php'
			}).then(function mySucces(response) {

				scope.activeEvent = response.data;

			}, function myError(response) {

			});			
			
		};
		
	};
	
	return new activeEvent();
	
});