angular.module('app-module', ['bootstrap-modal','form-validator','bootstrap-growl','ngRoute','active-event']).config(function($routeProvider) {
    $routeProvider
        .when('/:option/:id', {
            templateUrl: 'contestant.html'
        });
}).factory('app', function($http,$window,$routeParams,$location,$timeout,validate,growl,bootstrapModal,activeEvent) {

	function app() {

		var self = this;

		self.data = function(scope) {
			
			scope.views = {};
			scope.form = {};
			
			scope.views.option = 'Add Contestant';
			
			scope.controls = {
				btns: {
					add: true,
					edit: false,					
					ok: true,
					cancel: true
				}
			};
			
			scope.contestant = {};
			scope.contestant.id = 0;
			scope.contestant.pictures = [{src: 'pictures/contestant.jpg'}];

			scope.contestants = [];		

			scope.events = [];		
			events(scope);	

			scope.$on('$routeChangeSuccess', function() {

				switch ($routeParams.option) {			
					
					case 'view':

						if ($routeParams.id != undefined) {				
							self.load(scope,$routeParams.id);
							scope.controls.btns.add = true;
							scope.controls.btns.edit = true;
							scope.views.option = 'Modify Contestant';
						};				

					break;				

				};

			});
			
			activeEvent.get(scope);
			
			let dz = document.querySelector('#dz');
			
			if (dz!=null) {
			
				scope.profile_pictures = new Dropzone("div#dz", {
					url: "handlers/contestants/upload.php",
					addRemoveLinks: true,
					autoProcessQueue: false,
					parallelUploads: 5,
					contestant_id: 0,
					acceptedFiles: "image/*",
					init: function() {
						
						let thisDropzone = this;
						this.on('sending', function(file, xhr, formData) {
							formData.append('contestant_id', thisDropzone.contestant_id);
						});

						this.on('queuecomplete', function(file) {
							
							this.removeAllFiles(true);

							self.load(scope,thisDropzone.contestant_id);							
							
						});
						
					}
				});
				
			};
			
			scope.pictures = [];
			scope.delPictures = [];

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
		
		self.add = function(scope) {
			
			scope.contestant = {};
			scope.contestant.id = 0;
			scope.contestant.pictures = [{src: 'pictures/contestant.jpg'}];			
			scope.contestant.event_id = scope.activeEvent;
			
			scope.contestant.is_active = true;
			
			scope.controls.btns.ok = false;
			scope.controls.btns.cancel = false;	
			scope.controls.btns.edit = false;
			
			delete $routeParams.option;			

		};

		self.cancel = function(scope) {
			
			scope.controls.btns.ok = true;
			scope.controls.btns.cancel = true;

			if ($routeParams.option==undefined) {
				scope.contestant = {};
				scope.contestant.id = 0;
				scope.contestant.pictures = [{src: 'pictures/contestant.jpg'}];
				validate.cancel(scope,'contestant');
			};

		};

		self.close = function() {

			$window.location.href = 'contestants.html';
		
		};
		
		self.save = function(scope) {

			if (validate.form(scope,'contestant')) return;
			
			$http({
			  method: 'POST',
			  url: 'handlers/contestants/save.php',
			  data: scope.contestant
			}).then(function mySucces(response) {
				
				scope.controls.btns.ok = true;
				scope.controls.btns.cancel = true;

				if ($routeParams.option==undefined) growl.show('success',{from: 'top', amount: 55},'New contestant successfully added.');
				else growl.show('success',{from: 'top', amount: 55},'Contestant info successfully updated.');
				
				scope.profile_pictures.contestant_id = response.data;
				scope.profile_pictures.processQueue();	
				
			}, function myError(response) {
				
			});
			
		};
		
		self.list = function(scope) {
			
			if (scope.$id > 2) scope = scope.$parent;
			
			$http({
			  method: 'GET',
			  url: 'handlers/contestants/contestants.php'
			}).then(function mySucces(response) {

				scope.contestants = angular.copy(response.data);

			}, function myError(response) {

			});

		};

		self.view = function(scope,row) {

			$window.location.href = "contestant.html#!/view/"+row.id;

		};
		
		self.edit = function(scope) {
			
			scope.controls.btns.ok = false;
			scope.controls.btns.cancel = false;
			
		};
		
		self.load = function(scope,id) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/contestants/view.php',
			  data: {id: id}
			}).then(function mySucces(response) {
				
				scope.contestant = angular.copy(response.data);
				scope.contestant.is_active = eval(scope.contestant.is_active);
				
			}, function myError(response) {
				
			});			
			
		};
		
		self.delete = function(scope,row) {
			
			var onOk = function() {
				
				$http({
					method: 'POST',
					url: 'handlers/contestants/delete.php',
					data: {id: row.id}
				}).then(function mySuccess(response) {
					
					self.list(scope);
			
				}, function myError(response) {

			
				});

			};
			
			var onCancel = function() {
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this contestant?',onOk,onCancel);			
			
		};
		
		self.pictures = function(scope) {
			
			// if (scope.$id>2) scope = scope.$parent;
			
			scope.delPictures = [];
			
			const title = 'Contestant Pictures';
			
			const content = 'dialogs/pictures.html';
			
			const onOk = () => {
				
				$http({
					url: 'handlers/contestants/delete-pictures.php',
					method: 'POST',
					data: {id: scope.contestant.id, dels: scope.delPictures}
				}).then((response)=>{
					
					self.load(scope,scope.contestant.id);
					
				},(response)=>{
					
				});
				
			};
			
			const onCancel = () => {
				
			};
			
			$http({
				url: 'handlers/contestants/pictures.php',
				method: 'POST',
				data: {id: scope.contestant.id}
			}).then((response)=>{
				
				scope.pictures = response.data;
				
			},(response)=>{
				
			});
			
			bootstrapModal.box(scope,title,content,onOk,'Update');
			
		};
		
		self.removePicture = function(scope,picture) {
			
			scope.delPictures.push(picture.filename);
			
			const index = scope.pictures.indexOf(picture);
			
			scope.pictures.splice(index,1);
			
		};

	};
	
	return new app();
	
});