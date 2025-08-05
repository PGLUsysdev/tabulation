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
			
			}, 1000);
			
			scope.portion_judges = [];
			
			scope.progress = {};

		};
		
		self.reload = function(scope) {

			portions(scope);
			
		};
		
		function portions(scope) {
			
			if (scope.$id>2) scope = scope.$parent;
			
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
				
				tooltip.init();	
				
				bui.hide();
		
			}, function myError(response) {

				bui.hide();
		
			});			
			
		};
		
		self.activate = function(scope,p) {
			
			bui.show();
			
			$http({
				method: 'POST',
				url: 'handlers/monitoring/activate.php',
				data: p
			}).then(function mySuccess(response) {
				
				bui.hide();
				
			}, function myError(response) {

				bui.hide();
		
			});	
			
		};		
		
		self.toggle = function(scope,p) {
			
			bui.show();
			
			$http({
				method: 'POST',
				url: 'handlers/monitoring/toggle.php',
				data: p
			}).then(function mySuccess(response) {
				
				bui.hide();
				
			}, function myError(response) {

				bui.hide();
		
			});	
			
		};
		
		function judges(scope) {
			
			$http({
				method: 'POST',
				url: 'handlers/monitoring/judges.php',
				data: scope.monitor.portion
			}).then(function mySuccess(response) {

				scope.progress = response.data;

			}, function myError(response) {

			});				
			
		};
		
		self.selectPortion = function(scope) {
			
			judges(scope);
			
		};
		
		self.undone = function(scope,j) {
			
			let onOk = function() {
				
				bui.show();				
				
				$http({
					method: 'POST',
					url: 'handlers/monitoring/undone.php',
					data: {judge_id: j.judge_id, portion_id: scope.monitor.portion.id}
				}).then((response) => {
					
					bui.hide();
					
				},(response) => {
					
					bui.hide();
					
				});
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to set status to undone?',onOk,() => {});			
			
		};
		
		self.clearNotifications = function(scope) {
			
			let onOk = function() {
				
				bui.show();
				
				$http({
					method: 'POST',
					url: 'handlers/monitoring/notifications-delete.php'
				}).then((response) => {
					
					bui.hide();
					
				},(response) => {
					
					bui.hide();
					
				});				
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete all notifications?',onOk,() => {});
			
		};
		
		self.clearToggles = function(scope) {
			
			let onOk = function() {
				
				bui.show();
				
				$http({
					method: 'POST',
					url: 'handlers/monitoring/toggles-delete.php'
				}).then((response) => {
					
					bui.hide();
					
				},(response) => {
					
					bui.hide();					
					
				});				
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to clear toggles cache?',onOk,() => {});
			
		};		
		
		self.judges = function(scope,p) {
			
			portion_judges(scope,p);
			
			let onOk = function() {
				
				bui.show();
				
				$http({
				  method: 'POST',
				  url: 'handlers/monitoring/manage-judges.php',
				  data: {id: p.id, judges: scope.portion_judges}
				}).then(function mySucces(response) {

					bui.hide();
					portions(scope);

				}, function myError(response) {
					
					bui.hide();

				});	
				
			};
			
			bootstrapModal.box(scope,'Judges for '+p.description+' portion','dialogs/manage-judges.html',onOk,'Ok','Close');
			
		};

		function portion_judges(scope,portion) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/portions/judges.php',
			  data: {event_id: scope.activeEvent.id, portion_id: portion.id}
			}).then(function mySucces(response) {

				scope.portion_judges = response.data;

			}, function myError(response) {

			});				
			
		};
		
		self.sortByRank = function(scope,p) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/monitoring/contestants-order-ranks.php',
			  data: {event_id: scope.activeEvent.id, portion_id: p.id}
			}).then(function mySucces(response) {

				scope.portion_contestants = response.data;

			}, function myError(response) {

			});			
			
			let onOk = function() {
				
				bui.show();
				
				$http({
				  method: 'POST',
				  url: 'handlers/monitoring/contestants-custom-order.php',
				  data: scope.portion_contestants
				}).then(function mySucces(response) {

					scope.portion_contestants = response.data;
					bui.hide();

				}, function myError(response) {
					
					bui.hide();					

				});				
				
			};
			
			bootstrapModal.box(scope,'Custom ordering for '+p.description+' portion','dialogs/contestants-order-ranks.html',onOk,'Ok','Close');			
			
		};
		
	};

	return new monitoring();

});