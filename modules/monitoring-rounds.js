angular.module('monitoring-module', ['ngSanitize','bootstrap-modal','form-validator','bootstrap-growl','block-ui','tooltip-module','active-event']).factory('monitoring', function($http,$window,$location,$timeout,$interval,$q,validate,growl,bootstrapModal,bui,tooltip,activeEvent) {
	
	function monitoring() {

		var self = this;				
		
		self.data = function(scope) {
			
			scope.rounds = [];
			
			activeEvent.get(scope);

			rounds(scope);
			
			$timeout(function() {
			
				tooltip.init();			
			
			}, 1000);

		};

		function rounds(scope) {
			
			bui.show();
			
			$http({
				method: 'POST',
				url: 'handlers/monitoring/rounds.php'
			}).then(function mySuccess(response) {
				
				scope.rounds = response.data;
				
				bui.hide();
		
			}, function myError(response) {

				bui.hide();
		
			});			
			
		};
		
		self.activate = function(scope,r) {
			
			bui.show();
			
			$http({
				method: 'POST',
				url: 'handlers/monitoring/activate-round.php',
				data: r
			}).then(function mySuccess(response) {
				
				bui.hide();
				
			}, function myError(response) {

				bui.hide();
		
			});	
			
		};
		
	};

	return new monitoring();

});