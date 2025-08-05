angular.module('competitions-module', ['ngSanitize','bootstrap-modal','form-validator','bootstrap-growl','block-ui','tooltip-module','active-event']).factory('competitions', function($http,$window,$location,$timeout,$q,validate,growl,bootstrapModal,bui,tooltip,activeEvent) {
	
	function competitions() {

		var self = this;				
		
		self.data = function(scope) {
			
			scope.contestants = [];
			
			scope.addAllContestants = false;			

			scope.controls = {
				btns: {
					edit: false
				}
			};

			events(scope);
			
			activeEvent.get(scope);
			
			scope.competition = {};
			scope.competition.id = 0;
			scope.competition.criteria = [];
			scope.competition.places = [];
			
			competitions_list(scope);
			rounds(scope);			

		};	
		
		self.reload = function(scope) {
			
			competitions_list(scope);
			
		};
		
		function contestants(scope,id) {
			
			return $http({
			  method: 'POST',
			  url: 'handlers/competitions/contestants.php',
			  data: {id: id}
			});			
			
		};
		
		function competitions_list(scope) {	
			
			if (scope.$id>2) scope = scope.$parent;
			
			scope.competitions = [];
			
			bui.show();
			
			$http({
			  method: 'POST',
			  url: 'handlers/competitions/list.php'
			}).then(function mySucces(response) {

				scope.competitions = response.data;
				bui.hide();

			}, function myError(response) {

				bui.hide();

			});				
			
		};
		
		self.competition = function(scope,row) {
			
			scope.addAllContestants = false;			
			
			let title = 'Competition';
			
			let content = 'dialogs/competition.html';
			
			if (row==null) {		
			
				scope.views.new = true;
				scope.controls.btns.edit = false;
			
				scope.competition = {};
				scope.competition.id = 0;
				scope.competition.rounds = [];
				scope.competition.roundsDels = [];
				scope.competition.places = [];
				scope.competition.placesDels = [];

				scope.competition.is_shown = true;
				
				scope.competition.event_id = scope.activeEvent;
				
				contestants(scope,0).then(function mySucces(response) {

					scope.contestants = angular.copy(response.data);

				}, function myError(response) {

				});
			
			} else {
				
				scope.views.new = false;
				scope.controls.btns.edit = true;
				
				competition(scope,row.id).then((response) => {
					
					scope.competition = response.data;
					
					contestants(scope,response.data.id).then(function mySucces(response) {

						scope.contestants = angular.copy(response.data);					
						
						self.addAllContestantsToggler(scope,false);						

					}, function myError(response) {

					});									
					
				}, (response) => {
					
				});
				
			}
			
			let onOk = function() {

			};
			
			let onClose = function() {
				
				competitions_list(scope);				
				
			};
			
			bootstrapModal.box4(scope,title,content,onOk,onClose);
			
		};
		
		function competition(scope,id) {
			
			return $http({
				method: 'POST',
				url: 'handlers/competitions/view.php',
				data: {id: id}		
			});
			
		};
		
		self.edit = function(scope) {
			
			scope.controls.btns.edit = !scope.controls.btns.edit;
			
		};
		
		self.save = function(scope) {
			
			if (validate.form(scope,'competition')) return;

			scope.competition.contestants = scope.contestants;

			$http({
			  method: 'POST',
			  url: 'handlers/competitions/save.php',
			  data: scope.competition
			}).then(function mySucces(response) {
				
				scope.views.new = false;
				scope.controls.btns.edit = true;
				
				angular.forEach(scope.competition.rounds, function(item,i) {
					
					item.disabled = true;
					
				});
				
				angular.forEach(scope.competition.places, function(item,i) {
					
					item.disabled = true;
					
				});				

				if (scope.competition.id==0) {
					growl.show('success',{from: 'top', amount: 55},'Competition successfully added.');
					competition(scope,response.data).then((response) => {
						
						scope.competition = response.data;
						
					}, (response) => {
						
					});				
				} else {
					growl.show('success',{from: 'top', amount: 55},'Competition info successfully updated.');
				};
				
			}, function myError(response) {
				
			});
			
		};
		
		self.rounds = {
			
			add: function(scope) {				
				
				scope.competition.rounds.push({
					id: 0,
					// round_id: {id: 0, description: ""},
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
					scope.competition.roundsDels.push(row.id);
				};
				
				var rounds = scope.competition.rounds;
				var index = scope.competition.rounds.indexOf(row);
				scope.competition.rounds = [];			
				
				angular.forEach(rounds, function(d,i) {
					
					if (index != i) {
						
						delete d['$$hashKey'];
						scope.competition.rounds.push(d);
						
					};
					
				});

			}	
			
		};
		
		self.places = {
			
			add: function(scope) {

				if (scope.competition.winners == undefined) {
					growl.show('danger',{from: 'top', amount: 55},'Please enter no of winners');
					return;
				};

				if ((scope.competition.winners != undefined) && (scope.competition.winners == 0)) {
					growl.show('danger',{from: 'top', amount: 55},'No of winners cannot be zero');
					return;
				};

				scope.competition.places.push({
					id: 0,
					rank: 0,
					// description: '',
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
					scope.competition.placesDels.push(row.id);
				};
				
				var places = scope.competition.places;
				var index = scope.competition.places.indexOf(row);
				scope.competition.places = [];	
				
				angular.forEach(places, function(d,i) {
					
					if (index != i) {
						
						delete d['$$hashKey'];
						scope.competition.places.push(d);
						
					};
					
				});

			}			
			
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
		
		function rounds(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/rounds/rounds.php'
			}).then(function mySucces(response) {

				scope.rounds = angular.copy(response.data);

			}, function myError(response) {

			});			
			
		};		
		
		self.toggleAddAllContestants = function(scope) {
			
			angular.forEach(scope.contestants,function(contestant,i) {
				
				contestant.participant = scope.addAllContestants;
				
			});			
			
		};		
		
		self.addAllContestantsToggler = function(scope,dialog) {

			// console.log(scope);		
			
			var all = 'true';

			angular.forEach(scope.contestants,function(contestant,i) {

				all += '&&'+contestant.participant.toString();

			});
			
			if (dialog) if (scope.$id>2) scope = scope.$parent;
			
			scope.addAllContestants = eval(all);

		};		
		
		self.delete = function(scope,row) {
			
			var onOk = function() {
				
				$http({
					method: 'POST',
					url: 'handlers/competitions/delete.php',
					data: {id: row.id}
				}).then(function mySuccess(response) {
					
					competitions_list(scope);
			
				}, function myError(response) {

			
				});

			};
			
			var onCancel = function() {
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this competition?',onOk,onCancel);			
			
		};		
		
	};

	return new competitions();

});