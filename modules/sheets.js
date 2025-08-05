angular.module('scores-sheets', ['bootstrap-modal','form-validator','bootstrap-growl','block-ui','tooltip-module','active-event']).factory('sheets', function($http,$window,$location,$timeout,$q,validate,growl,bootstrapModal,bui,tooltip,activeEvent) {
	
	function sheets() {

		var self = this;				
		
		self.data = function(scope) {			
			
			activeEvent.get(scope);

			scope.activeTabs = {};
			scope.activeTabs.portion = 0;
			
			sheets(scope);
			
			scope.views.edit = false;

		};			
		
		self.reload = function(scope) {
			
			sheets(scope);
			
		};
		
		function sheets(scope) {
			
			scope.portions = [];
			
			bui.show();
			
			$http({
			  method: 'POST',
			  url: 'handlers/sheets/sheets.php'
			}).then(function mySucces(response) {

				scope.portions = angular.copy(response.data);
				bui.hide();

			}, function myError(response) {

			});				
			
		};
		
		self.update = function(scope,portion) {			
			
			if (scope.views.edit) {
			
				var form = scope.formHolder['sheet'+portion.id];

				function control(form,score_id,value) {
					
					var controls = form.$$controls;
					
					form.$invalid = value;				
					
					angular.forEach(controls,function(elem,i) {
						
						if (elem.$$attr.name == 'score'+score_id) {
							
							if (elem.$$attr.$attr.required) {
									
								elem.$invalid = value;
							
							};
							
						};					
											
					});				
					
				};
				
				var valid = "true";
				
				angular.forEach(portion.judges, function(judge,i) {
					
					angular.forEach(judge.contestants, function(contestant,ii) {
						
						angular.forEach(contestant.scores, function(score,iii) {						
							
							control(form,score.score_id,false);
							
							if (score.score < score.minimum) {

								score.invalid = true;
								score.error_message = "Score cannot be below "+score.minimum;
								control(form,score.score_id,true);
								valid+="&&false";
								
							};

							if (score.score > score.percentage) {

								score.invalid = true;
								score.error_message = "Score cannot be above "+score.percentage;
								control(form,score.score_id,true);
								valid+="&&false";
								
							};						
							
						});
						
					});
					
				});

				if (!eval(valid)) {
					
					growl.show('danger',{from: 'top', amount: 140},'Some values need corrections',5);
					return;
					
				};
				
				bui.show();
				
				$http({
				  method: 'POST',
				  url: 'handlers/sheets/scores.php',
				  data: portion
				}).then(function mySucces(response) {

					growl.show('success',{from: 'top', amount: 140},'Scores successfully updated',5);
					bui.hide();

				}, function myError(response) {

					bui.hide();			
				
				});

			};
			
			scope.views.edit = !scope.views.edit;			
			
		};
		
	};

	return new sheets();

});