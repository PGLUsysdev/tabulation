      <div class="row" ng-show="profile.description == 'Tabulator'">
        <div class="col-md-12">
          <div class="tile">
			<h3 class="tile-title">Contestants</h3>
			<hr>
            <div class="tile-body">
				  <form class="form-inline float-right">
					<input class="form-control mr-sm-2" type="search" placeholder="Search" ng-model="searchPortionContestant" aria-label="Search">
				  </form>
				<div class="clearfix"></div>			
				<ul class="nav nav-tabs">
					<li class="nav-item" ng-repeat="pc in portions_contestants"><a class="nav-link" ng-class="{'active': $index==activeTabs.portions_contestants}" data-toggle="tab" href="#portion-contestant{{$index}}" ng-click="activeTabs.portions_contestants=$index">{{pc.description}}</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade" ng-repeat="pc in portions_contestants" ng-class="{'active': $index==activeTabs.portions_contestants, 'show': $index==activeTabs.portions_contestants}" id="portion-contestant{{$index}}">
						<div class="row">
							<div class="col-md-6">
								<div class="container" style="margin-top: 25px;">
									<h5>Contestants under {{pc.description}} portion<i class="fa fa-users float-right" data-toggle="tooltip" data-placement="right" title="" data-original-title="Manage candidates for {{pc.description}} portion" style="cursor: pointer;" ng-click="tabulator.contestants(this,pc)"></i></h5>
									<table class="table table-striped" style="margin-top: 25px;">
										<thead>
											<tr><th>No</th><th>PID</th><th>Name</th><th>Description</th></tr>
										</thead>
										<tbody>
											<tr ng-repeat="c in pc.contestants | filter:searchPortionContestant"><td>{{c.contestant_no}}</td><td>{{c.id}}</td><td>{{c.contestant_name}}</td><td>{{c.description}}</td></tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>				
				</div>
			</div>
		  </div>
		</div>
	  </div>