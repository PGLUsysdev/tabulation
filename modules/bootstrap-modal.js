angular.module('bootstrap-modal',[]).service('bootstrapModal', function($compile,$timeout) {

	this.confirm = function(scope,title,content,onOk,onCancel) {
		
		var dialog = bootbox.confirm({
			title: title,
			message: content,
			callback: function (result) {
				if (result) {
					onOk(scope);
				} else {
					onCancel();
				}
			}
		});
		
		/* dialog.init(function() {
			$timeout(function() { $compile($('.bootbox-body')[0])(scope); }, 500);
		});	 */
		
	};
	
	this.notify = function(scope,content,onOk) {

		var dialog = bootbox.alert({
			title: 'Notification',
			message: content,
			callback: function () {
				onOk();
			}
		});
		
		dialog.init(function() {
			$timeout(function() { $compile($('.bootbox-body')[0])(scope); }, 500);
		});
	
	};
	
	this.box = function(scope,title,content,onOk,save=null,cancel=null) {

		var dialog = bootbox.confirm({
			title: title,
			message: 'Loading content...',
			buttons: {
				confirm: {
					label: (save==null)?'Save':save,
					className: 'btn-success'
				},				
				cancel: {
					label: (cancel==null)?'Cancel':cancel,
					className: 'btn-danger'
				}
			},			
			callback: function (result) {
				if (result) {
					return onOk(scope);
				}
			}
		});
		
		dialog.init(function() {

			// $timeout(function() {
				
				dialog.find('.bootbox-body').load(content, function() {
					
					$timeout(function() {

						$compile($('.bootbox-body')[0])(scope);			

					}, 100);			
					
				});

			// }, 200);

		});
	
	};
	
	this.box2 = function(scope,title,content) {

		var dialog = bootbox.alert({
			title: title,
			message: 'Loading...',
			callback: function () {

			}
		});
		
		dialog.init(function() {
			$timeout(function() {
				dialog.find('.bootbox-body').load(content, function() {
					$compile($('.bootbox-body')[0])(scope);
				});
			}, 500);
		});
	
	};
	
	this.box3 = function(scope,title,content,onOk,w='220') {
	
		var dialog = bootbox.alert({
			title: title,
			message: 'Loading...',
			buttons: {
				ok: {
					label: 'Close',
					className: 'btn-danger'
				}				
			},			
			callback: function (result) {
				if (result) {
					return onOk(scope);
				}
			}
		});

		dialog.init(function() {
			dialog.find('.bootbox-body').load(content,function() {
				var lp = parseFloat(w)/2-50;
				$('.modal-content').css({"width": w+"%","left": "-"+lp+"%"});				
				$compile($('.bootbox-body')[0])(scope);				
			});
		});

	};
	
	this.box4 = function(scope,title,content,onOk,onClose,w='220') {
	
		var dialog = bootbox.alert({
			title: title,
			message: 'Loading...',
			buttons: {
				ok: {
					label: 'Close',
					className: 'btn-danger'
				}				
			},			
			callback: function (result) {
				if (result) {
					return onOk(scope);
				} else {
					onClose();
				};
			}
		});

		dialog.init(function() {
			dialog.find('.bootbox-body').load(content,function() {
				var lp = parseFloat(w)/2-50;
				$('.modal-content').css({"width": w+"%","left": "-"+lp+"%"});				
				$compile($('.bootbox-body')[0])(scope);				
			});
		});

	};
	
	this.box5 = function(scope,title,content,onOk,onClose,onLoad,w='220') {
	
		var dialog = bootbox.alert({
			title: title,
			message: 'Loading...',
			buttons: {
				ok: {
					label: 'Close',
					className: 'btn-danger'
				}				
			},			
			callback: function (result) {
				if (result) {
					return onOk(scope);
				} else {
					onClose();
				};
			}
		});

		dialog.init(function() {
			dialog.find('.bootbox-body').load(content,function() {
				var lp = parseFloat(w)/2-50;
				$('.modal-content').css({"width": w+"%","left": "-"+lp+"%"});
				$('.modal-body').css({"overflow":"auto"});				
				$compile($('.bootbox-body')[0])(scope);
				onLoad();
			});
		});

	};	

});