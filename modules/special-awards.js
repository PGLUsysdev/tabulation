angular.module('special-awards', ['ngSanitize','bootstrap-modal','form-validator','bootstrap-growl','block-ui','tooltip-module','active-event']).factory('specialAwards', function($http,$window,$location,$timeout,$q,validate,growl,bootstrapModal,bui,tooltip,activeEvent) {
	
	function specialAwards() {

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
			
			scope.special_award = {};
			scope.special_award.id = 0;
			scope.special_award.criteria = [];
			scope.special_award.places = [];
			
			awards(scope);
			portions(scope);

		};	
		
		self.reload = function(scope) {
			
			awards(scope);
			
		};
		
		function contestants(scope,id) {
			
			return $http({
			  method: 'POST',
			  url: 'handlers/special-awards/contestants.php',
			  data: {id: id}
			});			
			
		};		
		
		function awards(scope) {	
			
			if (scope.$id>2) scope = scope.$parent;
			
			scope.awards = [];
			
			bui.show();
			
			$http({
			  method: 'POST',
			  url: 'handlers/special-awards/list.php'
			}).then(function mySucces(response) {

				scope.awards = angular.copy(response.data);
				bui.hide();

			}, function myError(response) {

			});				
			
		};
		
		self.special_award = function(scope,row) {
			
			scope.addAllContestants = false;			
			
			let title = 'Special Award';
			
			let content = 'dialogs/special-award.html';
			
			if (row==null) {
			
				scope.views.new = true;
				scope.controls.btns.edit = false;
			
				scope.special_award = {};
				scope.special_award.id = 0;
				scope.special_award.criteria = [];
				scope.special_award.criteriaDels = [];
				scope.special_award.places = [];
				scope.special_award.placesDels = [];

				scope.special_award.is_shown = true;
				
				scope.special_award.event_id = scope.activeEvent;
				
				contestants(scope,0).then(function mySucces(response) {

					scope.contestants = angular.copy(response.data);

				}, function myError(response) {

				});				
			
			} else {
				
				scope.views.new = false;
				scope.controls.btns.edit = true;
				
				special_award(scope,row.id).then((response) => {
					
					scope.special_award = response.data;
					
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
				
				awards(scope);				
				
			};
			
			bootstrapModal.box4(scope,title,content,onOk,onClose);
			
		};
		
		function special_award(scope,id) {
			
			return $http({
				method: 'POST',
				url: 'handlers/special-awards/view.php',
				data: {id: id}		
			});
			
		};
		
		self.edit = function(scope) {
			
			scope.controls.btns.edit = !scope.controls.btns.edit;
			
		};
		
		self.save = function(scope) {
			
			if (validate.form(scope,'special_award')) return;
			
			scope.special_award.contestants = scope.contestants;			

			$http({
			  method: 'POST',
			  url: 'handlers/special-awards/save.php',
			  data: scope.special_award
			}).then(function mySucces(response) {
				
				scope.views.new = false;
				scope.controls.btns.edit = true;
				
				angular.forEach(scope.special_award.criteria, function(item,i) {
					
					item.disabled = true;
					
				});
				
				angular.forEach(scope.special_award.places, function(item,i) {
					
					item.disabled = true;
					
				});				

				if (scope.special_award.id==0) {
					growl.show('success',{from: 'top', amount: 55},'New special award successfully added.');
					special_award(scope,response.data).then((response) => {
						
						scope.special_award = response.data;
						
					}, (response) => {
						
					});				
				} else {
					growl.show('success',{from: 'top', amount: 55},'Special award info successfully updated.');
				};
				
			}, function myError(response) {
				
			});
			
		};
		
		self.criteria = {
			
			add: function(scope) {				
				
				scope.special_award.criteria.push({
					id: 0,
					// portion_id: {id: 0, description: ""},
					// criteria_id: {id: 0, description: ""},
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
					scope.special_award.criteriaDels.push(row.id);
				};
				
				var criteria = scope.special_award.criteria;
				var index = scope.special_award.criteria.indexOf(row);
				scope.special_award.criteria = [];			
				
				angular.forEach(criteria, function(d,i) {
					
					if (index != i) {
						
						delete d['$$hashKey'];
						scope.special_award.criteria.push(d);
						
					};
					
				});

			}	
			
		};
		
		self.places = {
			
			add: function(scope) {

				if (scope.special_award.winners == undefined) {
					growl.show('danger',{from: 'top', amount: 55},'Please enter no of winners');
					return;
				};

				if ((scope.special_award.winners != undefined) && (scope.special_award.winners == 0)) {
					growl.show('danger',{from: 'top', amount: 55},'No of winners cannot be zero');
					return;
				};

				scope.special_award.places.push({
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
					scope.special_award.placesDels.push(row.id);
				};
				
				var places = scope.special_award.places;
				var index = scope.special_award.places.indexOf(row);
				scope.special_award.places = [];	
				
				angular.forEach(places, function(d,i) {
					
					if (index != i) {
						
						delete d['$$hashKey'];
						scope.special_award.places.push(d);
						
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
		
		function portions(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/portions/portions-criteria.php'
			}).then(function mySucces(response) {

				scope.portions = angular.copy(response.data);

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
					url: 'handlers/special-awards/delete.php',
					data: {id: row.id}
				}).then(function mySuccess(response) {
					
					awards(scope);
			
				}, function myError(response) {

			
				});

			};
			
			var onCancel = function() {
				
			};
			
			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this special award?',onOk,onCancel);			
			
		};		
		
	};

	return new specialAwards();

});