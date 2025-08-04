      <div class="row" ng-show="profile.description == 'Judge'" monitoring-judge-portion>
        <div class="col-md-12">
          <h5 style="text-align: right; margin-bottom: 15px; color: #5b6671;">Welcome, {{profile.user}}</h5>
			<div ng-show="alerts.portion.show" class="alert alert-dismissible alert-danger">
                <button class="close" type="button" data-dismiss="alert">×</button>No portion is currently active, please stand by. <strong>Thank you!</strong>
            </div>
          <div class="tile">	  
			<h3 class="tile-title">Portions<i class="fa fa-refresh float-right" data-toggle="tooltip" data-placement="left" title="" data-original-title="Reload Portions" style="cursor: pointer;" ng-click="judge.portions(this)"></i></h3>			
			<div class="clearfix"></div>
			<hr>
            <div class="tile-body">
				<div class="row">			
					<div class="col-md-12">
					  <ul class="nav nav-tabs">
						<li class="nav-item" ng-repeat="p in portions"><a class="nav-link" ng-class="{'active': $index==activeTabs.portions}" data-toggle="tab" href="#portion{{$index}}" aria-expanded="true" ng-click="judge.switchTab(this,$index)">{{p.description}}</a></li>
					  </ul>
					  <div class="tab-content">
						<div ng-repeat="p in portions" class="tab-pane fade" ng-class="{'active': $index==activeTabs.portions, 'show': $index==activeTabs.portions}" id="portion{{$index}}" aria-expanded="true">
							<div class="row">
								<div class="col-md-12">
									<div style="margin-top: 15px;"><button class="btn btn-warning float-right" data-toggle="tooltip" data-placement="top" title="" data-original-title="Click this if you have already finished scoring all the contestants for {{p.description}} Portion" ng-click="judge.done(this,p)">Done</button></div>
									<div class="clearfix"></div>
									<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
								  <div class="btn-group-vertical" data-toggle="buttons">
									<div class="row no-gutters">
										<div ng-class="{'col-md-6': p.contestants.length > 10, 'col-md-12': p.contestants.length <= 10}">
											<button ng-show="$index < 10" ng-repeat="c in p.contestants" class="btn" ng-class="{'btn-default': !c.selected, 'btn-danger': c.selected}" type="button" style="margin-bottom: 5px; text-align: left; font-size: .8em;" ng-click="judge.scores(this,p,c,false)">
												{{c.contestant_no}}. {{c.description}}
												<a ng-show="!c.score_ok" href="javascript:;" class="badge badge-pill badge-warning" style="margin-left: 5px; font-size: 1em;">{{c.completed}}</a>
											</button>
										</div>
										<div ng-class="{'col-md-6': p.contestants.length > 10, 'col-md-12': p.contestants.length <= 10}">
											<button ng-show="$index > 9" ng-repeat="c in p.contestants" class="btn" ng-class="{'btn-default': !c.selected, 'btn-danger': c.selected}" type="button" style="margin-left: 5px; margin-bottom: 5px; text-align: left; font-size: .8em;" ng-click="judge.scores(this,p,c,false)">
												{{c.contestant_no}}. {{c.description}}
												<a ng-show="!c.score_ok" href="javascript:;" class="badge badge-pill badge-warning" style="margin-left: 5px; font-size: 1em;">{{c.completed}}</a>
											</button>
										</div>										
									</div>
								  </div>
								</div>
								<div class="col-md-5">
									<div class="container" style="margin-top: 10px;">
										<h4>{{views.contestant}}</h4>
										<table class="table table-bordered" style="margin-top: 15px;">
											<thead>
												<tr><th>Description</th><th>Percentage</th><th style="width: 30%;">Score</th></tr>
											</thead>
											<tbody>
												<tr ng-repeat="score in scores">
													<td>
														<a ng-show="score.has_extract_portion" href="javascript:;" class="badge badge-pill badge-danger float-right" style="margin-left: 5px;"><i class="fa fa-check"></i></a>
														<p style="margin: 0!important; padding: 0!important">{{score.description}}</p>
													</td>
													<td>{{score.percentage}}%</td>
													<td>
														<input type="number" id="numpadButton{{$index}}" class="form-control score-numpad" ng-class="{'is-invalid': score.invalid || !score.valid}" ng-model="score.score" numeric-pad="{{$index}}" ng-disabled="score.has_extract_portion">
														<div class="form-control-feedback" ng-show="score.invalid" style="margin-top: 5px; font-size: .8em;">{{score.error_message}}</div>
													</td>
												</tr>
												<tr><td>Total</td><td>100%</td><td>{{contestantTotalStr}}%</td></tr>
											</tbody>
										</table>
										<!--<button class="btn btn-primary float-right" type="button" ng-click="judge.score(this,scores,p)">Submit</button>
										<div class="clearfix"></div>-->
									</div>
								</div>
								<div class="col-md-3">
									<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
									  <ol class="carousel-indicators">
										<li ng-repeat="picture in pictures" data-target="#carouselExampleIndicators" data-slide-to="{{$index}}" ng-class="{'active': $index==0}"></li>
									  </ol>
									  <div class="carousel-inner">
										<div ng-repeat="picture in pictures" class="carousel-item" ng-class="{'active': $index==0}">
										  <img class="d-block w-100" src="{{picture.src}}">
										</div>
									  </div>
									</div>
								</div>							
							</div><!-- row -->

							<?php
							
								// require_once 'standing.php';
							
							?>
							
						</div>
					  </div>
					</div>
				</div>
			</div>
          </div>
        </div>
      </div><!-- Judge -->