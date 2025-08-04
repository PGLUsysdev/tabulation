    <div class="row" ng-show="profile.description == 'Tabulator'">
        <div class="col-md-12">
          <div class="tile">
			<h3 class="tile-title">Portions<i class="fa fa-refresh float-right" data-toggle="tooltip" data-placement="left" title="" data-original-title="Reload Scores" style="cursor: pointer;" ng-click="tabulator.scoresSheets(this)"></i></h3>
			<div class="clearfix"></div>
			<hr>
            <div class="tile-body">
				<ul class="nav nav-tabs">
					<li class="nav-item" ng-repeat="ss in scoresSheets.portions"><a class="nav-link" ng-class="{'active': $index==activeTabs.scoresSheets}" data-toggle="tab" href="#score-sheet{{$index}}" ng-click="activeTabs.scoresSheets=$index">{{ss.description}}</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade" ng-repeat="ss in scoresSheets.portions" ng-class="{'active': $index==activeTabs.scoresSheets, 'show': $index==activeTabs.scoresSheets}" id="score-sheet{{$index}}">
						<div class="row">
							<div class="col-md-12">
								<div class="tile">
									<div class="tile-body">
										  <form class="form-inline float-right">
											<input class="form-control mr-sm-2" type="search" placeholder="Search" ng-model="ss.search" aria-label="Search">
										  </form>
										<div class="clearfix"></div>
										<ul class="nav nav-tabs" role="tablist" style="margin-top: 10px;">
										  <li class="nav-item" ng-repeat="judge in ss.judges">
											<a class="nav-link" ng-class="{'active': $index==0}" data-toggle="tab" href="#judge{{ss.id}}{{$index}}" role="tab" aria-controls="judge{{ss.id}}{{$index}}">{{judge.fullname}}</a>
										  </li>
										  <li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#overall{{ss.id}}" role="tab" aria-controls="overall{{ss.id}}">Overall</a>
										  </li>									  
										</ul>
										<div class="tab-content" style="margin-top: 15px;">									
										  <div ng-repeat="judge in ss.judges" class="tab-pane fade" ng-class="{'show': $index==0, 'active': $index==0}" id="judge{{ss.id}}{{$index}}" role="tabpanel" aria-labelledby="judge{{ss.id}}{{$index}}-tab">
											<div class="float-right">
												<button class="btn btn-success" type="button" ng-click="tabulator.printJudgeScores(this,ss,$index)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print Judge Scores"><i class="fa fa-print"></i></button>
											</div>
											<div class="clearfix"></div>									  
											<table class="table table-striped table-bordered" style="margin-top: 15px;">
												<thead>
													<tr>
														<th ng-repeat="tr in judge.table_header">
															<a ng-show="tr.has_extract_portion" href="javascript:;" class="badge badge-pill badge-danger float-right" style="margin-left: 5px;"><i class="fa fa-check"></i></a>														
															{{tr.th}}
														</th>
													</tr>
												</thead>
												<tbody>
													<tr ng-repeat="jc in judge.contestants | filter:ss.search"><td>{{jc.contestant_no}}</td><td><strong>{{jc.description}}</strong> ({{jc.contestant_name}})</td><td ng-repeat="cs in jc.scores">{{cs.score}}</td></tr>
												</tbody>
											</table>
										  </div>
										  <div class="tab-pane fade" id="overall{{ss.id}}" role="tabpanel" aria-labelledby="overall{{ss.id}}-tab">
											<div class="float-right">
												<button class="btn btn-success" type="button" ng-click="tabulator.validateResults(this,ss,true)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print Winners for Validation"><i class="fa fa-list-ol"></i></button>
												<button class="btn btn-info" type="button" ng-click="tabulator.validateResults(this,ss,false)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print All Contestants for Validation"><i class="fa fa-list-ol"></i></button>
												
												<button class="btn btn-success" type="button" ng-click="tabulator.printResults(this,ss,true)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print Winners"><i class="fa fa-print"></i></button>
												<button class="btn btn-info" type="button" ng-click="tabulator.printResults(this,ss,false)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print All Contestants"><i class="fa fa-print"></i></button>
												
												<button class="btn btn-success" type="button" ng-click="tabulator.advanceContestants(this,ss)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Advance winners to next portion"><i class="fa fa-angle-double-right"></i></button>											
												<button class="btn btn-danger" type="button" ng-click="tabulator.printTies(this,ss)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Print Tied Contestants"><i class="fa fa-print"></i></button>
												<button class="btn btn-danger" type="button" ng-click="tabulator.resolveTies(this,ss)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Resolve Tied Contestants"><i class="fa fa-plus"></i></button>
												<button class="btn btn-danger" type="button" ng-click="tabulator.clearPortionTies(this,ss)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Clear Score Adjustments"><i class="fa fa-minus"></i></button>
												<button class="btn btn-warning" type="button" ng-click="tabulator.portionIndividualResults(this,ss)" data-toggle="tooltip" data-placement="left" title="" data-original-title="Generate Individual Results"><i class="fa fa-certificate"></i></button>
											</div>
											<div class="clearfix"></div>
											<h4>No. of Winner(s): {{ss.winners}} {{(ss.results==null)?'':'(for '+ss.results+')'}}</h4>
											<table class="table table-striped table-bordered">
												<thead>
													<tr><th>Id</th><th>No</th><th>Contestant</th><th ng-repeat="otr in ss.overall.table_header">{{otr.th}}</th><th>Average</th><th>Adj</th><th>Rank</th><th>Remarks</th></tr>
												</thead>
												<tbody>
													<tr ng-repeat="o in ss.overall.contestants | filter:ss.search" ng-class="{'tied': o.tied.isTied}"><td>{{o.id}}</td><td>{{o.contestant_no}}</td><td><strong>{{o.description}}</strong> ({{o.contestant_name}})</td><td ng-repeat="os in o.scores">{{os.score}}</td><td>{{o.average}}</td><td>{{o.adj}}</td><td>{{o.rank}}</td><td>{{o.tied.remarks}}</td></tr>
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