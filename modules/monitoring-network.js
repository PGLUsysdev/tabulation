angular.module('monitoring-module', ['ngSanitize','bootstrap-modal','form-validator','bootstrap-growl','block-ui','tooltip-module','active-event']).factory('monitoring', function($http,$window,$location,$timeout,$interval,$q,validate,growl,bootstrapModal,bui,tooltip,activeEvent) {
	
	function monitoring() {

		var self = this;				
		
		self.data = function(scope) {
			
			scope.portions = [];
			
			activeEvent.get(scope);

			portions(scope);

			scope.monitor = {};
			
			scope.monitor.portion = {};
			
			$timeout(function() {
					
				$interval(function() {
					
					judges(scope);
					
				},2000);
			
				tooltip.init();			
			
			}, 1000);

		};

		function portions(scope) {
			
			bui.show();
			
			$http({
				method: 'POST',
				url: 'handlers/monitoring/portions.php'
			}).then(function mySuccess(response) {
				
				scope.portions = response.data;
				
				let portions = response.data.filter((p,i) => {
					
					return (p.toggle);
					
				});
				
				if (portions.length>0) {
					scope.monitor.portion = portions[0];
					judges(scope);
				};
				
				bui.hide();
		
			}, function myError(response) {

				bui.hide();
		
			});			
			
		};
		
		function judges(scope) {
			
			$http({
				method: 'POST',
				url: 'handlers/monitoring/judges-connections.php',
				data: scope.monitor.portion
			}).then(function mySuccess(response) {

				scope.judges = response.data;

			}, function myError(response) {



			});				
			
		};
		
		self.selectPortion = function(scope) {
			
			judges(scope);
			
		};
		
		self.update = function(scope,j) {
			
			if (scope.$id>2) scope = scope.$parent;

			scope.monitor.ip_address = j.ip_address;			
			
			let title = 'IP Address';
			
			let content = 'dialogs/ip-address.html';
			
			let onOk = function() {

				if (validate.dialog(scope,'network')) return false;				
				
				$http({
					url: 'handlers/monitoring/update-ip.php',
					method: 'POST',
					data: {id: j.judge_id, ip_address: scope.monitor.ip_address}
				}).then((response) => {
					
					growl.show('success',{from: 'top', amount: 55},'IP Address updated');					
					
				}, (response) => {
					
					growl.show('danger',{from: 'top', amount: 55},'Something went wrong, please try again');										
					
				});
				
				return true;
				
			};
			
			bootstrapModal.box(scope,title,content,onOk)			
			
		};
		
	};

	return new monitoring();

});