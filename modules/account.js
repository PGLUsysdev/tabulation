angular.module('account-module', ['bootstrap-modal']).factory('getAccountProfile',function($http) {

	function getAccountProfile() {

		var self = this;
		
		self.go = function() {

			return $http({
			  method: 'POST',
			  url: 'handlers/account-profile.php'
			});
		
		};
	
	};
	
	return new getAccountProfile();
	
}).directive('dropDown', function() {
	return {
		restrict: 'A',
		template: '<li><a class="dropdown-item" href="javascript:;" logout-account><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>'
	};
	
}).directive('accountProfile',function($http) {
	
	return {
		restrict: 'A',
		link: function(scope, element, attrs) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/account-profile.php'
			}).then(function mySucces(response) {
				
				scope.profile = response.data;
				
			},
			function myError(response) {

			});			
			
		}
	};
		
}).directive('logoutAccount', function($http,$window,bootstrapModal) {
	
	return {
		restrict: 'A',
		link: function(scope, element, attrs) {
			
			var onOk = function() {
				
				$window.location.href = 'handlers/logout.php';
				
			};
			
			element.bind('click', function() {
					
				bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to logout?',onOk,function() {});

			});
			
		}
		
	};

});