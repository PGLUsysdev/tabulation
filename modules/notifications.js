angular.module('notifications-module', ['ngSanitize']).directive('notifications', function($interval,$timeout,$http) {

	var template = '<a class="app-nav__item" href="javascript:;" data-toggle="dropdown"><i class="fa fa-bell-o fa-lg"></i><span class="badge badge-pill badge-danger" style="position: absolute; top: 10px; left: 30px;">{{(notifications.count)?notifications.count:""}}</span></a>';
        template += '<ul class="app-notification dropdown-menu dropdown-menu-right">';
        template += '<li class="app-notification__title">You have {{(notifications.count)?notifications.count:"no"}} new notifications.</li>';
        template += '<div ng-repeat="notification in notifications.contents" class="app-notification__content">';
        template += '<li>';
		template += '<a class="app-notification__item" href="javascript:;" ng-click="notificationAction(this,notification); judge.portions(this)">';
		template += '<span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa {{notification.icon}} fa-stack-1x fa-inverse"></i></span></span>';
        template += '<div>';
        template += '<p class="app-notification__message" style="line-height: 1.5;" ng-bind-html="notification.message"></p>';
        template += '</div>';
		template += '</a>';
		template += '</li>';
		template += '</div>';
		template += '</ul>';
	
	function notifications(scope) {

		$http({
		  method: 'POST',
		  url: 'handlers/dashboard/notifications.php'		  
		}).then(function mySucces(response) {
			
			scope.notifications = response.data;

		}, function myError(response) {
			
		});

	};
	
	function dismissNotification(scope,notification) {
		
		$http({
		  method: 'POST',
		  url: 'handlers/dashboard/dismiss-notification.php',
		  data: notification
		}).then(function mySucces(response) {
			
			/*
			** load new portion
			*/
			
			

		}, function myError(response) {
			
		});
		
	};
	
	return {
		restrict: 'A',
		template: template,
		link: function(scope, element, attrs) {
			
			$timeout(function() {
			
				if (scope.notification) {			
					var notification = $interval(function() {
						notifications(scope);
					},2000);
				};
			
			}, 1000);

			scope.notificationAction = function(scope,notification) {
				
				dismissNotification(scope,notification);
				
			};
			
			// if (!scope.notification) $interval.cancel(notification);					

		}
	};

});