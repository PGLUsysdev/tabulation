angular.module('app-module', ['bootstrap-modal','form-validator','bootstrap-growl','ngRoute','active-event']).config(function($routeProvider) {
    $routeProvider
        .when('/:option/:id', {
            templateUrl: 'round.html'
        });
}).factory('app', function($http,$window,$routeParams,$location,$timeout,validate,growl,bootstrapModal,activeEvent) {

	function app() {

		var self = this;

		self.data = function(scope) {
			
			scope.views = {};
			scope.form = {};
			
			scope.views.option = 'Add Round';
			
			scope.controls = {
				btns: {
					add: true,
					edit: false,					
					ok: true,
					cancel: true
				}
			};

			scope.round = {};
			scope.round.id = 0;
			scope.round.portions = [];
			scope.round.portionsDels = [];
			scope.round.places = [];
			scope.round.placesDels = [];

			scope.rounds = [];	

			scope.events = [];			
			events(scope);

			scope.portions = [];
			portions(scope);
			
			scope.$on('$routeChangeSuccess', function() {

				switch ($routeParams.option) {					
					
					case 'view':

						if ($routeParams.id != undefined) {				
							self.load(scope,$routeParams.id);
							scope.controls.btns.add = true;
							scope.controls.btns.edit = true;
							scope.views.option = 'Modify Round';
						};				

					break;					

				};

			});

			activeEvent.get(scope);
			
			scope.users = [];
			users(scope);			
			
		};
		
		function users(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/events/users-wu.php'
			}).then(function mySucces(response) {

				scope.users = angular.copy(response.data);

			}, function myError(response) {

			});				
			
		};		
		
		function tabulator_chairman() {
			
			return $http({
			  method: 'POST',
			  url: 'handlers/tabulator-chairman.php'
			});

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

		function portions(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/portions/portions.php'
			}).then(function mySucces(response) {

				scope.portions = angular.copy(response.data);

			}, function myError(response) {

			});			
			
		};		
		
		self.add = function(scope) {
			
			scope.round = {};
			scope.round.id = 0;
			scope.round.portions = [];
			scope.round.portionsDels = [];
			scope.round.places = [];
			scope.round.placesDels = [];			
			scope.round.event_id = scope.activeEvent;
			
			scope.round.is_shown = true;
			
			scope.round.rank_order = false;
			
			scope.controls.btns.ok = false;
			scope.controls.btns.cancel = false;	
			scope.controls.btns.edit = false;
			
			tabulator_chairman().then(response => {
				
				scope.round.event_tabulator = response.data.tabulator;
				scope.round.event_chairman = response.data.chairman;
				
			},response => {
				
			});			
			
			delete $routeParams.option;			

		};

		self.cancel = function(scope) {

			scope.controls.btns.ok = true;
			scope.controls.btns.cancel = true;

			angular.forEach(scope.round.portions, function(item,i) {
				
				item.disabled = true;
				
			});

			angular.forEach(scope.round.places, function(item,i) {
				
				item.disabled = true;
				
			});			

			if ($routeParams.option==undefined) {
				scope.round = {};
				scope.round.id = 0;
				scope.round.portions = [];
				scope.round.portionsDels = [];
				scope.round.places = [];
				scope.round.placesDels = [];				
				validate.cancel(scope,'round');
			};

		};

		self.close = function() {

			$window.location.href = 'rounds.html';
		
		};
		
		self.save = function(scope) {

			if (validate.form(scope,'round')) return;		

			$http({
			  method: 'POST',
			  url: 'handlers/rounds/save.php',
			  data: scope.round
			}).then(function mySucces(response) {
				
				scope.controls.btns.ok = true;
				scope.controls.btns.cancel = true;
				
				angular.forEach(scope.round.portions, function(item,i) {
					
					item.disabled = true;
					
				});

				angular.forEach(scope.round.places, function(item,i) {
					
					item.disabled = true;
					
				});			

				if ($routeParams.option==undefined) growl.show('success',{from: 'top', amount: 55},'New round successfully added.');
				else growl.show('success',{from: 'top', amount: 55},'Round info successfully updated.');
				
			}, function myError(response) {
				
			});	
			
		};
		
		self.list = function(scope) {
			
			if (scope.$id > 2) scope = scope.$parent;
			
			$http({
			  method: 'GET',
			  url: 'handlers/rounds/rounds.php'
			}).then(function mySucces(response) {

				scope.rounds = angular.copy(response.data);

			}, function myError(response) {

			});

		};

		self.view = function(scope,row) {

			$window.location.href = "round.html#!/view/"+row.id;

		};
		
		self.edit = function(scope) {
			
			scope.controls.btns.ok = false;
			scope.controls.btns.cancel = false;

			let wu = {id:0,full_name:""};

			if (scope.round.event_tabulator==undefined) scope.round.event_tabulator = wu;
			if (scope.round.event_chairman==undefined) scope.round.event_chairman = wu;			
			
		};
		
		self.load = function(scope,id) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/rounds/view.php',
			  data: {id: id}
			}).then(function mySucces(response) {
				
				scope.round = angular.copy(response.data);
				scope.round.is_shown = eval(scope.round.is_shown);
				scope.round.rank_order = eval(scope.round.rank_order);
				
			}, function myError(response) {
				
			});			
			
		};
		
		self.delete = function(scope,row) {
			
			var onOk = function() {
				
				$http({
					method: 'POST',
					url: 'handlers/rounds/delete.php',
					data: {id: row.id}
				}).then(function mySuccess(response) {
					
					self.list(scope);
			
				}, function myError(response) {

			
				});

			};
			
			var onCancel = function() {
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this round?',onOk,onCancel);			
			
		};
		
		self.portions = {
			
			add: function(scope) {				
				
				scope.round.portions.push({
					id: 0,
					portion_id: {id: 0, event_id:0, description: "", winners: 0, is_shown: 0},
					percentage: 0,
					date_created: 'CURRENT_TIMESTAMP',
					last_modified: 'CURRENT_TIMESTAMP',
					disabled: false
				});

			},
			
			edit: function(scope,row) {
				
				row.disabled = !row.disabled;				
				
			},			

			delete: function(scope,row) {
				
				if (row.id > 0) {
					scope.round.portionsDels.push(row.id);
				};
				
				var portions = scope.round.portions;
				var index = scope.round.portions.indexOf(row);
				scope.round.portions = [];			
				
				angular.forEach(portions, function(d,i) {
					
					if (index != i) {
						
						delete d['$$hashKey'];
						scope.round.portions.push(d);
						
					};
					
				});

			}	
			
		};
		
		self.places = {
			
			add: function(scope) {

				if (scope.round.winners == undefined) {
					growl.show('danger',{from: 'top', amount: 55},'Please enter no of winners');
					return;
				};

				if ((scope.round.winners != undefined) && (scope.round.winners == 0)) {
					growl.show('danger',{from: 'top', amount: 55},'No of winners cannot be zero');
					return;
				};

				if ((scope.round.places.length+1)>scope.round.winners) {
					growl.show('danger',{from: 'top', amount: 55},'Places cannot be greater than no of winners');
					return;
				};

				scope.round.places.push({
					id: 0,
					rank: 0,
					description: '',
					date_created: 'CURRENT_TIMESTAMP',
					last_modified: 'CURRENT_TIMESTAMP',
					disabled: false
				});

			},			
			
			edit: function(scope,row) {
				
				row.disabled = !row.disabled;				
				
			},			
			
			delete: function(scope,row) {
				
				if (row.id > 0) {
					scope.round.placesDels.push(row.id);
				};
				
				var places = scope.round.places;
				var index = scope.round.places.indexOf(row);
				scope.round.places = [];	
				
				angular.forEach(places, function(d,i) {
					
					if (index != i) {
						
						delete d['$$hashKey'];
						scope.round.places.push(d);
						
					};
					
				});

			}			
			
		};		

	};
	
	return new app();
	
});