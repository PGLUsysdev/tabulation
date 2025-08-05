angular.module('tooltip-module', []).factory('tooltip', function($timeout) {
	
	function tooltip() {
	
		var self = this;
		
		self.init = function() {			
	
			$timeout(function() {
				
				$('[data-toggle="tooltip"]').tooltip();
				
			}, 1000);
			
		};
		
	};
	
	return new tooltip();
	
});