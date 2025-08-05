angular.module('monitoring-judge',['judge-dashboard','account-module']).directive('monitoringJudgePortion',function($interval,$timeout,$http,judge,getAccountProfile) {
	
	function monitorActivePortions(scope) {
		
		$http({
			url: 'handlers/monitoring/judge-portion.php',
			method: 'POST'
		}).then((response) => {
			
			scope.monitor.judge.current_count = response.data.length;
			
			if (scope.monitor.judge.current_count > scope.monitor.judge.start_count) {
				
				judge.startPortions(scope);
				scope.monitor.judge.start_count = scope.monitor.judge.current_count;
				
			};
			
		},(response) => {
			
		});
		
	};
	
	return {
		restrict: 'A',
		link: function(scope, element, attrs) {
			
			getAccountProfile.go().then(response => {
				
				if (response.data.description == 'Judge') {
					
					scope.monitor.judge = {};
					
					$http({
						url: 'handlers/monitoring/judge-portion.php',
						method: 'POST'
					}).then((response) => {
						
						scope.monitor.judge.start_count = response.data.length;
						
						$timeout(function() {
									
							$interval(function() {
								
								monitorActivePortions(scope);
								
							},2000);
						
						}, 1000);				
						
					},(response) => {
						
					});
				
				}
				
			},response => {
				
			});	

		}
	};
	
});