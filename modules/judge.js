angular.module('judge-dashboard', ['bootstrap-modal','form-validator','bootstrap-growl','block-ui','tooltip-module','active-event','monitoring-judge','account-module']).factory('judge', function($http,$window,$location,$timeout,$q,validate,growl,bootstrapModal,bui,tooltip,activeEvent,getAccountProfile) {
	
	function judge() {

		var self = this;				
		
		self.data = function(scope) {

			bui.show();		
			
			scope.views.contestant = "";
			
			scope.portions = [];				
			scope.scores = [];				
			scope.pictures = [];
			
			scope.standing = [];
		
			/* $timeout(function() {
				
				if (scope.profile.description == 'Judge') {
					
					scope.notification = true;
					
					scope.views.title = 'Judge Dashboard';

					portions(scope);
					
					bui.hide();				
					
				};
				
			}, 1000); */
			
			getAccountProfile.go().then(response => {
				
				if (response.data.description == 'Judge') {
					
					scope.notification = false;
					
					scope.views.title = 'Judge Dashboard';

					portions(scope);
					
					bui.hide();				
					
				};	
				
			},response => {
				
				bui.hide();
				growl.show('danger',{from: 'top', amount: 140},'Something went wrong, startup process halted.',60);				
				
			});
			
			activeEvent.get(scope);
			
			scope.alerts.portion = {				
				show: false
			};
			
			scope.being_judge_portion = {};
			
			scope.being_judge = {};
			
		};
		
		self.portions = function(scope) {
			
			if (scope.profile.description=='Tabulator') return;
			
			if (scope.$id>2) scope = scope.$parent;
			
			bui.show();				
			
			$http({
			  method: 'POST',
			  url: 'handlers/dashboard/portions.php',
			  data: {activeButtons: scope.activeButtons}
			}).then(function mySucces(response) {

				scope.portions = angular.copy(response.data);
				
				if (scope.portions.length > 0) {
				
					if (scope.activeButtons[scope.activeTabs.portions]) {
						self.scores(scope,scope.portions[scope.activeTabs.portions],scope.portions[scope.activeTabs.portions].contestants[scope.activeButtons[scope.activeTabs.portions]],false);
					} else {
						self.scores(scope,scope.portions[scope.activeTabs.portions],scope.portions[scope.activeTabs.portions].contestants[0],false);
					};

				};
				
				noActivePortion(scope);
				
				bui.hide();

			}, function myError(response) {
				
				bui.hide();				
				
			});		

		};
		
		function portions(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/dashboard/portions.php'
			}).then(function mySucces(response) {

				scope.portions = angular.copy(response.data);
				
				$timeout(function() {
					if (scope.portions.length > 0) {
						self.scores(scope,scope.portions[0],scope.portions[0].contestants[0],true);
						standing(scope,scope.portions[0]['id']);
					};
				},100);

				noActivePortion(scope);				

			}, function myError(response) {
				
			});				
			
		};
		
		self.startPortions = function(scope) {
			
			bui.show();
			
			$http({
			  method: 'GET',
			  url: 'handlers/dashboard/portions.php'
			}).then(function mySucces(response) {

				bui.hide();

				scope.portions = angular.copy(response.data);
				
				$timeout(function() {
					if (scope.portions.length > 0) {
						self.scores(scope,scope.portions[0],scope.portions[0].contestants[0],true);
						standing(scope,scope.portions[0]['id']);
					};
				},100);

				noActivePortion(scope);				

			}, function myError(response) {
				
				bui.hide();
				
			});				
			
		};		
		
		self.switchTab = function(scope,i) {						
			
			if (scope.$id > 2) scope = scope.$parent;
			
			scope.scores = [];
			scope.pictures = [];			
			
			scope.activeTabs.portions = i;			

			if (scope.activeButtons[i]) {
				self.scores(scope,scope.portions[i],scope.portions[i].contestants[scope.activeButtons[i]],false);
			} else {
				self.scores(scope,scope.portions[i],scope.portions[i].contestants[0],false);
			};

			standing(scope,scope.portions[i]['id']);

		};
		
		self.scores = function(scope,portion,portion_contestant,init) {
			
			scope.being_judge.contestant = portion_contestant;

			bui.show();
			
			buttons();
			
			function buttons() {
			
				var i = scope.portions.indexOf(portion);			
				var ii = scope.portions[i].contestants.indexOf(portion_contestant);
				
				scope.activeButtons[i] = ii;
				
				angular.forEach(scope.portions[i].contestants, function(item,n) {

					item.selected = false;
					
				});
				
				portion_contestant.selected = true;
				
			};
			
			scores(scope,portion,portion_contestant,init);
			pictures(scope,portion_contestant);
			
		};
		
		function scores(scope,portion,portion_contestant,init) {			
			
			if (scope.$id > 2) scope = scope.$parent;

			scope.being_judge_portion = portion;
			
			$http({
			  method: 'POST',
			  url: 'handlers/dashboard/scores.php',
			  data: {portion_id: portion.id, portion_contestant_id: portion_contestant.id}
			}).then(function mySucces(response) {

				bui.hide();
			
				if (typeof response.data === 'object') {
					growl.show('info',{from: 'top', amount: 140},'Please enter scores for '+portion_contestant.description,1);
					scope.scores = angular.copy(response.data);
					contestantTotal(scope);
					scope.views.contestant = portion_contestant.description+' ('+portion_contestant.contestant_name+')';

					verifyScores(scope,portion).then(function success(response) {
						
					}, function error(response) {
						
					});
				} else {
					if (init) growl.show('danger',{from: 'top', amount: 140},'Something went wrong during initialization. Please ask for assistance.',60);
					else growl.show('danger',{from: 'top', amount: 140},'Something went wrong, scores were not submitted. Please ask for assistance.',60);
				};				

			}, function myError(response) {

				bui.hide();				
			
				if (init) growl.show('danger',{from: 'top', amount: 140},'Something went wrong during initialization. Please ask for assistance.',60);
				else growl.show('danger',{from: 'top', amount: 140},'Something went wrong, scores were not submitted. Please ask for assistance.',60);						
			
			});			
			
		};		
		
		function contestantTotal(scope) {

			angular.forEach(scope.scores, function(item,i) {
				
				scope.$watch(function(scope) {

					return item.score;
					
				},function(newValue, oldValue) {
					
					scope.contestantTotal = 0;
					
					angular.forEach(scope.scores, function(iitem,ii) {
						
						scope.contestantTotal+=iitem.score;
						
					});
					
					scope.contestantTotalStr = scope.contestantTotal.toFixed(2);
					
				});

			});
			
		};
		
		self.score = function(scope,scores,portion) {
			
			/*
			** validations for minimum and maximum scores
			*/			
			
			var valid = "true";
			
			angular.forEach(scope.scores,function(score,i) {
				
				scope.scores[i].invalid = false;
				scope.scores[i].error_message = "";
				
				if (score.score < score.minimum) {

					scope.scores[i].invalid = true;
					scope.scores[i].error_message = "Score cannot be below "+score.minimum;
					
					valid+="&&false";
					
				};
				
				if (score.score > score.percentage) {

					scope.scores[i].invalid = true;
					scope.scores[i].error_message = "Score cannot be above "+score.percentage;
					
					valid+="&&false";
					
				};				
				
			});						
			
			if (!eval(valid)) return;
			
			bui.show();			
			
			$http({
			  method: 'POST',
			  url: 'handlers/dashboard/score.php',
			  data: scores
			}).then(function mySucces(response) {

				bui.hide();			
			
				if (typeof response.data === 'object') {

					growl.show('success',{from: 'top', amount: 180},'Scores successfully submitted',1);
					verifyScores(scope,portion).then(function success(response) {
						
					}, function error(response) {
						
					});					

				} else {

					growl.show('danger',{from: 'top', amount: 180},'Something went wrong, scores were not submitted. Please ask for assistance.',60);

				}	
			
			}, function myError(response) {
				
				bui.hide();					
				
				growl.show('danger',{from: 'top', amount: 180},'Something went wrong, scores were not submitted. Please ask for assistance.',60);				
				
			});
			
		};
		
		function pictures(scope,portion_contestant) {
			
			bui.show();
			
			if (scope.$id > 2) scope = scope.$parent;
						
			$http({
			  method: 'POST',
			  url: 'handlers/dashboard/pictures.php',
			  data: {id: portion_contestant.id}
			}).then(function mySucces(response) {

				bui.hide();

				scope.pictures = angular.copy(response.data);
			
			}, function myError(response) {
				
				bui.hide();				
				
			});
			
		};
		
		function standing(scope,portion_id) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/dashboard/standing.php',
			  data: {portion_id: portion_id}
			}).then(function mySucces(response) {

				scope.standing = angular.copy(response.data);

			}, function myError(response) {

			});				
			
		};
		
		self.standing = function(scope,portion_id) {
			
			bui.show();
			
			$http({
			  method: 'POST',
			  url: 'handlers/dashboard/standing.php',
			  data: {portion_id: portion_id}
			}).then(function mySucces(response) {

				scope.standing = angular.copy(response.data);
				bui.hide();

			}, function myError(response) {

				bui.hide();			
			
			});				
			
		};

		self.done = function(scope,portion) {
		
			var onOk = function() {
				
				done(scope).then((response) => {
					
					$http({
						method: 'POST',
						url: 'handlers/dashboard/notify-tabulator.php',
						data: {portion_id: portion.id, portion_description: portion.description}
					}).then(function mySuccess(response) {
						
						growl.show('success',{from: 'top', amount: 180},'Tabulator has been notified that you have finished scoring for '+portion.description+' Portion',5);				
				
					}, function myError(response) {

						growl.show('danger',{from: 'top', amount: 140},'Something went wrong during initialization. Please ask for assistance.',60);
				
					});					
					
				}, (response) => {

					growl.show('danger',{from: 'top', amount: 140},'Something went wrong during initialization. Please ask for assistance.',60);
					
				});

			};
			
			var onCancel = function() {
				
			};
			
			/*
			** Verify if candidates have been given scores
			*/
			verifyScores(scope,portion).then(function success(response) {
				
				if (response) {
					
					bootstrapModal.confirm(scope,'Confirmation','Press Ok to confirm that you have finished scoring for all contestants under '+portion.description+' Portion',onOk,onCancel);
				
				} else {
					
					growl.show('danger',{from: 'top', amount: 120},'The yellow exclamation badge besides a contestant name signifies an unsubmitted scores. Please make sure all contestants scores have been submitted.',8);					
					
				};
				
			}, function error(response) {
				
			});
			
			function done(scope) {
				
				return $http({
					method: 'POST',
					url: 'handlers/dashboard/judge-confirmation.php',
					data: {portion_id: portion.id}
				});
				
			};
			
		};
		
		function verifyScores(scope,portion) {

			return $q(function(resolve, reject) {
			
				$http({
					method: 'POST',
					url: 'handlers/dashboard/verify-scores.php',
					data: {portion_id: portion.id, contestants: portion.contestants}
				}).then(function success(response) {
					
					var index = scope.portions.indexOf(portion);
					
					resolve(response.data.result);
					
					angular.forEach(response.data.tables, function(cws,i) {
						
						angular.forEach(scope.portions[index].contestants,function(contestant,key) {
							
							if (contestant.id == cws.id) {
								scope.portions[index].contestants[key].score_ok = cws.score_ok;
								scope.portions[index].contestants[key].completed = cws.completed;
							};
							
						});
						
					});				

				}, function error(response) {
				
					reject(false);
					
				});

			});

		};
		
		function noActivePortion(scope) {
			
			scope.alerts.portion.show = (scope.portions.length==0);
			
		};
		
		function isInt(n) {
			return Number(n) === n && n % 1 === 0;
		}

		function isFloat(n) {
			return Number(n) === n && n % 1 !== 0;
		}		

	};

	return new judge();

}).directive('numericPad',function($http,$q,$timeout,bui,growl) {
	
	function scoreCritertion(scope,score) {
	
		bui.show();
	
		$http({
		  method: 'POST',
		  url: 'handlers/dashboard/score-criterion.php',
		  data: score
		}).then(function mySucces(response) {

			bui.hide();			
		
			if (typeof response.data === 'object') {

				growl.show('success',{from: 'top', amount: 180},'Score successfully submitted',1);
				verifyScores(scope,scope.being_judge_portion).then(function success(response) {
					
				}, function error(response) {
					
				});				

			} else {

				growl.show('danger',{from: 'top', amount: 180},'Something went wrong, scores were not submitted. Please ask for assistance.',60);

			}	
		
		}, function myError(response) {
			
			bui.hide();					
			
			growl.show('danger',{from: 'top', amount: 180},'Something went wrong, scores were not submitted. Please ask for assistance.',60);				
			
		});
		
	};
	
	function verifyScores(scope,portion) {

		return $q(function(resolve, reject) {
		
			$http({
				method: 'POST',
				url: 'handlers/dashboard/verify-scores.php',
				data: {portion_id: portion.id, contestants: portion.contestants}
			}).then(function success(response) {
				
				var index = scope.portions.indexOf(portion);
				
				resolve(response.data.result);
				
				angular.forEach(response.data.tables, function(cws,i) {
					
					angular.forEach(scope.portions[index].contestants,function(contestant,key) {
						
						if (contestant.id == cws.id) {
							scope.portions[index].contestants[key].score_ok = cws.score_ok;
							scope.portions[index].contestants[key].completed = cws.completed;							
						};
						
					});
					
				});				

			}, function error(response) {
			
				reject(false);
				
			});

		});

	};	
	
	return {
		restrict: 'A',
		link: function(scope, element, attrs) {
			
			// let score = JSON.parse(attrs.numericPad);
			let index = attrs.numericPad;
			let score = scope.scores[index];
			
			if (score.has_extract_portion) {
				
				// element.bind('click', function() {

				// });		
				
				return;
				
			};
			
			let updated_score = score.score;
			
		    let np = $(element).numpad({
				hidePlusMinusButton: true,
				hideDecimalButton: false,
				onChange: function(e,value) {

					updated_score = value;

				},
				onKeypadOpen: function(e) {
					let id = $(this).attr('id');
					$('#score-candidate-'+id).html(scope.being_judge.contestant.description+' ('+scope.being_judge.contestant.contestant_name+')');
					$('#score-criterion-'+id).html(score.description);
					$('#score-min-'+id).html(score.minimum);
					$('#score-max-'+id).html(score.percentage);
					
					// for Mutia 2021
					// for asynchronous disable, if criterion is lock by tabulator from monitoring
					/* $('#'+id+' .done').attr('disabled',true);				
					$('#'+id+' .numero').attr('disabled',true);			
					$('#'+id+' .del').attr('disabled',true);				
					$('#'+id+' .clear').attr('disabled',true);
					$('#'+id+' input').attr('disabled',true); */
					// 
				},
				onKeypadClose: function(e) {

				}
			});
			
			let num_el = $($(np)[0]).data('numpad')[0];
			let id = $(num_el).attr('id');

			let button = num_el.querySelector('#'+id+' .done');
			
			button.addEventListener("click", function() {
				
				// minimum
				if (updated_score<score.minimum) {

					scope.scores[index].error_message = "Score cannot be below "+score.minimum;					
					scope.scores[index].invalid = true;
					return;
					
				};
				
				// maximum
				if (updated_score>score.percentage) {
					
					scope.scores[index].error_message = "Score cannot be above "+score.percentage;					
					scope.scores[index].invalid = true;					
					return;
					
				};
				
				score.score = updated_score;
				scoreCritertion(scope,score);

				scope.scores[index].valid = true;
				scope.scores[index].error_message = '';
				scope.scores[index].invalid = false;			
				
			});		
			
		}
		
	};	
	
});