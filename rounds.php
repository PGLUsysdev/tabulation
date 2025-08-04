    <div class="row" ng-show="profile.description == 'Tabulator'">
        <div class="col-md-12">
          <div class="tile">				
			<h3 class="tile-title">Rounds<i class="fa fa-refresh float-right" data-toggle="tooltip" data-placement="left" title="" data-original-title="Reload Scores" style="cursor: pointer;" ng-click="tabulator.scoresSheets(this)"></i></h3>
			<div class="clearfix"></div>			
			<hr>
			<div class="tile-body">
				<ul class="nav nav-tabs">
					<li class="nav-item" ng-repeat="ssr in scoresSheets.rounds"><a class="nav-link" ng-class="{'active': $index==activeTabs.scoresSheetsRounds}" data-toggle="tab" href="#score-sheet-round{{$index}}" ng-click="activeTabs.scoresSheetsRounds=$index">{{ssr.description}}</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade" ng-repeat="ssr in scoresSheets.rounds" ng-class="{'active': $index==activeTabs.scoresSheetsRounds, 'show': $index==activeTabs.scoresSheetsRounds}" id="score-sheet{{$index}}">
						<div class="row">
							<div class="col-md-12">
							<div class="tile">
								<div class="tile-body">
									  <form class="form-inline float-right">
										<input class="form-control mr-sm-2" type="search" placeholder="Search" ng-model="ssr.search" aria-label="Search">
									  </form>
									<div class="clearfix"></div>
									<ul class="nav nav-tabs" role="tablist">
									  <li class="nav-item" ng-repeat="rp in ssr.portions">
										<a class="nav-link" ng-class="{'active': $index==0}" data-toggle="tab" href="#round-portion{{ssr.id}}{{$index}}" role="tab" aria-controls="round-portion{{ssr.id}}{{$index}}">{{rp.portion_description}} {{ssr.method=='Percentage'?'('+rp.percentage+'%)':''}}</a>
									  </li>
									  <li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#overall-rounds{{ssr.id}}" role="tab" aria-controls="overall-rounds{{ssr.id}}">Overall</a>
									  </li>
									</ul>
									<div class="tab-content" style="margin-top: 15px;">	
									  <div ng-repeat="rp in ssr.portions" class="tab-pane fade" ng-class="{'show': $index==0, 'active': $index==0}" id="round-portion{{ssr.id}}{{$index}}" role="tabpanel" aria-labelledby="round-portion{{ssr.id}}{{$index}}-tab">
										<table class="table table-striped table-bordered">
											<thead>
												<tr><th>No</th><th>Contestant</th><th>Average</th><th>Rank</th></tr>
											</thead>
											<tbody>
												<tr ng-repeat="rpc in rp.contestants.ranked | filter:ssr.search" ng-class="{'tied': rpc.tied.isTied}"><td>{{rpc.contestant_no}}</td><td><strong>{{rpc.description}}</strong> ({{rpc.contestant_name}})</td><td>{{rpc.average}}</td><td>{{$index+1}}</td></tr>
											</tbody>
										</table>
									  </div>
									  <div class="tab-pane fade" id="overall-rounds{{ssr.id}}" role="tabpanel" aria-labelledby="overall-rounds{{ssr.id}}-tab">
										<div class="float-right">
											<button class="btn btn-success" type="button" ng-click="tabulator.validateResultsRounds(this,ssr,true)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print Winners for Validation"><i class="fa fa-list-ol"></i></button>
											<button class="btn btn-info" type="button" ng-click="tabulator.validateResultsRounds(this,ssr,false)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print All Contestants for Validation"><i class="fa fa-list-ol"></i></button>										
											
											<button class="btn btn-success" type="button" ng-click="tabulator.printResultsRounds(this,ssr,true)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print Winners"><i class="fa fa-print"></i></button>
											<button class="btn btn-info" type="button" ng-click="tabulator.printResultsRounds(this,ssr,false)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print All Contestants"><i class="fa fa-print"></i></button>
											<button class="btn btn-success" type="button" ng-click="tabulator.advanceContestantsRounds(this,ssr)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Advance winners to next portion"><i class="fa fa-angle-double-right"></i></button>											
											<button class="btn btn-danger" type="button" ng-click="tabulator.printTiesRounds(this,ssr)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print Tied Contestants"><i class="fa fa-print"></i></button>
											<button class="btn btn-danger" type="button" ng-click="tabulator.resolveTiesRounds(this,ssr)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Resolve Tied Contestants"><i class="fa fa-plus"></i></button>
											<button class="btn btn-danger" type="button" ng-click="tabulator.clearRoundTies(this,ssr)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Clear Score Adjustments"><i class="fa fa-minus"></i></button>
											<button class="btn btn-warning" type="button" ng-click="tabulator.roundIndividualResults(this,ssr)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Generate Individual Results"><i class="fa fa-certificate"></i></button>											
										</div>
										<div class="clearfix"></div>
										<h4>No. of Winner(s): {{ssr.winners}} {{(ssr.results==null)?'':'(for '+ssr.results+')'}}</h4>
										<table class="table table-striped table-bordered">
											<thead>
												<tr><th>No</th><th>Contestant</th><th ng-repeat="rho in ssr.overall.table_header">{{rho.description}}</th><th>Total</th><th>Adj</th><th>Rank</th><th>Remarks</th></tr>
											</thead>
											<tbody>
												<tr ng-repeat="rpo in ssr.overall.contestants | filter:ssr.search" ng-class="{'tied': rpo.tied.isTied}">
													<td>{{rpo.contestant_no}}</td>
													<td><strong>{{rpo.description}}</strong> ({{rpo.contestant_name}})</td>
													<td ng-repeat="rps in rpo.scores">{{rps.score}}</td>
													<td>{{rpo.round_total}}</td>
													<td>{{rpo.adj}}</td>
													<td>{{rpo.rank}}</td><td>{{rpo.tied.remarks}}</td></tr>
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
		  </div>
		</div>
	</div>