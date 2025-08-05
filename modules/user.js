angular.module('app-module', ['bootstrap-modal','form-validator','bootstrap-growl','ngRoute','active-event']).config(function($routeProvider) {
    $routeProvider
        .when('/:option/:id', {
            templateUrl: 'user.html'
        });
}).factory('app', function($http,$window,$routeParams,$location,$timeout,validate,growl,bootstrapModal,activeEvent) {

	function app() {

		var self = this;

		self.data = function(scope) {
			
			scope.views = {};
			scope.form = {};
			
			scope.views.option = 'Add User';
			
			scope.controls = {
				btns: {
					add: true,
					edit: false,					
					ok: true,
					cancel: true
				}
			};
			
			scope.user = {};
			scope.user.id = 0;

			scope.events = [];			
			events(scope);			
			
			scope.groups = [];			
			groups(scope);

			scope.users = [];						
			
			scope.$on('$routeChangeSuccess', function() {
					
				switch ($routeParams.option) {			
					
					case 'view':

						if ($routeParams.id != undefined) {				
							self.load(scope,$routeParams.id);
							scope.controls.btns.add = true;
							scope.controls.btns.edit = true;
							scope.views.option = 'Modify User';
						};				

					break;					

				};

			});

			activeEvent.get(scope);
			
		};

		function events(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/events/events.php'
			}).then(function mySucces(response) {

				scope.events = angular.copy(response.data);

			}, function myError(response) {

			});			
			
		};		
		
		function groups(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/groups.php'
			}).then(function mySucces(response) {

				scope.groups = angular.copy(response.data);

			}, function myError(response) {

			});			
			
		};

		self.add = function(scope) {
			
			scope.user = {};
			scope.user.id = 0;
			scope.user.tabulation_event = scope.activeEvent;

			scope.controls.btns.ok = false;
			scope.controls.btns.cancel = false;	
			scope.controls.btns.edit = false;
			
			delete $routeParams.option;			

		};

		self.cancel = function(scope) {
			
			scope.controls.btns.ok = true;
			scope.controls.btns.cancel = true;
			
			if ($routeParams.option==undefined) {
				scope.user = {};
				scope.user.id = 0;
				validate.cancel(scope,'user');
			};

		};

		self.close = function() {

			$window.location.href = 'users.html';
		
		};
		
		self.save = function(scope) {

			if (validate.form(scope,'user')) return;
			
			$http({
			  method: 'POST',
			  url: 'handlers/users/save.php',
			  data: scope.user
			}).then(function mySucces(response) {
				
				scope.controls.btns.ok = true;
				scope.controls.btns.cancel = true;

				if ($routeParams.option==undefined) growl.show('success',{from: 'top', amount: 55},'New user successfully added.');
				else growl.show('success',{from: 'top', amount: 55},'User info successfully updated.');
				
			}, function myError(response) {
				
			});	
			
		};
		
		self.list = function(scope) {
			
			if (scope.$id > 2) scope = scope.$parent;
			
			$http({
			  method: 'GET',
			  url: 'handlers/users/users.php'
			}).then(function mySucces(response) {

				scope.users = angular.copy(response.data);

			}, function myError(response) {

			});

		};

		self.view = function(scope,row) {

			$window.location.href = "user.html#!/view/"+row.id;

		};
		
		self.edit = function(scope) {
			
			scope.controls.btns.ok = false;
			scope.controls.btns.cancel = false;
			
		};
		
		self.load = function(scope,id) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/users/view.php',
			  data: {id: id}
			}).then(function mySucces(response) {
				
				scope.user = angular.copy(response.data);
				
			}, function myError(response) {
				
			});			
			
		};
		
		self.delete = function(scope,row) {
			
			var onOk = function() {
				
				$http({
					method: 'POST',
					url: 'handlers/users/delete.php',
					data: {id: row.id}
				}).then(function mySuccess(response) {
					
					self.list(scope);
			
				}, function myError(response) {

			
				});

			};
			
			var onCancel = function() {
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this user?',onOk,onCancel);			
			
		};

	};
	
	return new app();
	
});