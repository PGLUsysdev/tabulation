angular.module('app-module', ['bootstrap-modal','form-validator','bootstrap-growl','ngRoute','active-event']).config(function($routeProvider) {
    $routeProvider
        .when('/:option/:id', {
            templateUrl: 'event.html'
        });
}).factory('app', function($http,$window,$routeParams,$location,$timeout,validate,growl,bootstrapModal,activeEvent) {

	function app() {

		var self = this;

		self.data = function(scope) {
			
			scope.views = {};
			scope.form = {};
			
			scope.views.option = 'Add Event';
			
			scope.controls = {
				btns: {
					add: true,
					edit: false,					
					ok: true,
					cancel: true
				}
			};
			
			scope.event = {};
			scope.event.id = 0;

			scope.events = [];			
			
			scope.users = [];
			users(scope);
			
			scope.$on('$routeChangeSuccess', function() {

				switch ($routeParams.option) {

					case 'view':

						if ($routeParams.id != undefined) {				
							self.load(scope,$routeParams.id);
							scope.controls.btns.add = true;
							scope.controls.btns.edit = true;
							scope.views.option = 'Modify Event';
						};				

					break;					

				};

			});
			
			activeEvent.get(scope);
			
			let dz = document.querySelector('#dz');
			
			if (dz!=null) {
			
				scope.event_logo = new Dropzone("div#dz", {
					url: "handlers/events/upload.php",
					addRemoveLinks: true,
					autoProcessQueue: false,
					parallelUploads: 1,
					event_id: 0,
					acceptedFiles: "image/*",
					init: function() {
						
						let thisDropzone = this;
						this.on('sending', function(file, xhr, formData) {
							formData.append('event_id', thisDropzone.event_id);
						});
						
						this.on('queuecomplete', function(file) {
							
							this.removeAllFiles(true);

							self.load(scope,thisDropzone.event_id);						
							
						});
						
					}
				});
				
			};			

		};
		
		function users(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/events/users.php'
			}).then(function mySucces(response) {

				scope.users = angular.copy(response.data);

			}, function myError(response) {

			});				
			
		};

		self.add = function(scope) {
			
			scope.event = {};
			scope.event.id = 0;
			scope.event.is_active = true;			

			scope.controls.btns.ok = false;
			scope.controls.btns.cancel = false;
			scope.controls.btns.edit = false;
			
			delete $routeParams.option;

		};

		self.cancel = function(scope) {
			
			scope.controls.btns.ok = true;
			scope.controls.btns.cancel = true;
			
			if ($routeParams.option==undefined) {
				scope.event = {};
				scope.event.id = 0;
				validate.cancel(scope,'event');
			};

		};

		self.close = function() {

			$window.location.href = 'events.html';
		
		};
		
		self.save = function(scope) {

			if (validate.form(scope,'event')) return;
			
			$http({
			  method: 'POST',
			  url: 'handlers/events/save.php',
			  data: scope.event
			}).then(function mySucces(response) {
				
				scope.controls.btns.ok = true;
				scope.controls.btns.cancel = true;

				if ($routeParams.option==undefined) growl.show('success',{from: 'top', amount: 55},'New event successfully added.');
				else growl.show('success',{from: 'top', amount: 55},'Event info successfully updated.');
				
				scope.event_logo.event_id = response.data;
				scope.event_logo.processQueue();				
				
			}, function myError(response) {
				
			});	
			
		};
		
		self.list = function(scope) {
			
			if (scope.$id > 2) scope = scope.$parent;
			
			$http({
			  method: 'GET',
			  url: 'handlers/events/events.php'
			}).then(function mySucces(response) {

				scope.events = angular.copy(response.data);

			}, function myError(response) {

			});

		};

		self.view = function(scope,row) {

			$window.location.href = "event.html#!/view/"+row.id;

		};
		
		self.edit = function(scope) {
			
			scope.controls.btns.ok = false;
			scope.controls.btns.cancel = false;
			
		};
		
		self.load = function(scope,id) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/events/view.php',
			  data: {id: id}
			}).then(function mySucces(response) {
				
				scope.event = angular.copy(response.data);
				scope.event.event_date = new Date(scope.event.event_date);
				scope.event.is_active = eval(scope.event.is_active);
				
			}, function myError(response) {
				
			});			
			
		};
		
		self.delete = function(scope,row) {
			
			var onOk = function() {
				
				$http({
					method: 'POST',
					url: 'handlers/events/delete.php',
					data: {id: row.id}
				}).then(function mySuccess(response) {
					
					self.list(scope);
			
				}, function myError(response) {

			
				});

			};
			
			var onCancel = function() {
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this event?',onOk,onCancel);			
			
		};

	};
	
	return new app();
	
});