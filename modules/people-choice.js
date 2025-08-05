angular.module('app-module', ['bootstrap-modal','bootstrap-growl','form-validator','block-ui','active-event']).factory('app', function($http,$timeout,growl,bootstrapModal,validate,bui,activeEvent) {

	function app() {

		var self = this;

		self.data = function(scope) {
			
			scope.views = {};
			scope.form = {};
			
			scope.views.title = "People's Choice Award";
			
			scope.contestants = [];
			
			scope.controls = {};
			scope.controls.token = true;
			
			token(scope);
			contestants(scope);
			
			activeEvent.get(scope);

		};
		
		self.token = function(scope) {
			
			if (!scope.controls.token) {
				
				if (validate.form(scope,'token')) return;
				
				$http({
				  method: 'POST',
				  url: 'handlers/awards/token.php',
				  data: {token: scope.token}
				}).then(function mySucces(response) {
				
					scope.token = response.data;
				
				}, function myError(response) {

				});		
				
			};			
			
			scope.controls.token = !scope.controls.token;
			
		};
		
		function token(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/awards/get-token.php'
			}).then(function mySucces(response) {

				scope.token = response.data;

			}, function myError(response) {

			});	
			
		};
		
		self.contestants = function(scope) {
			
			contestants(scope);
			
		};
		
		function contestants(scope) {
			
			bui.show();
			
			$http({
			  method: 'GET',
			  url: 'handlers/awards/contestants.php'
			}).then(function mySucces(response) {

				scope.contestants = angular.copy(response.data);
				$timeout(function() {
					bui.hide();					
					hearts(scope);
				},1000);
				
			}, function myError(response) {

				bui.hide();
			
			});			
			
		};
		
		function hearts(scope) {			
			
			angular.forEach(scope.contestants, function(c,key) {
				
				$http({
				  method: 'GET',
				  url: 'https://graph.facebook.com/v2.12/'+c.fb_photo_id+'/reactions',
				  params: {access_token: scope.token, summary: 1, limit: 10000}
				}).then(function mySucces(response) {

					/* angular.forEach(response.data.data, function(reaction,i) {
						if (reaction.type == 'LOVE') scope.contestants[key]['hearts']++;
					}); */
					
					scope.contestants[key]['hearts'] += response.data.summary.total_count;

				}, function myError(response) {
					
					//
					
				});	
				
			});
			
		};

	};
	
	return new app();
	
});