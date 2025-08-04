<div class="row">
	<div class="col-md-12">
		<div id="accordion{{$index}}" style="margin-top: 15px; margin-bottom: 15px;">							
		  <div class="card">
			<div class="card-header" id="heading{{$index}}">
			  <h5 class="mb-0">
				<button class="btn btn-link" data-toggle="collapse" data-target="#collapse{{$index}}" aria-expanded="true" aria-controls="collapse{{$index}}">
				  Standing
				</button>
				<i class="fa fa-refresh float-right" data-toggle="tooltip" data-placement="left" title="" data-original-title="Refresh Standing" style="cursor: pointer;" ng-click="judge.standing(this,p.id)"></i>											
			  </h5>
			</div>
			<div id="collapse{{$index}}" class="collapse" aria-labelledby="heading{{$index}}" data-parent="#accordion{{$index}}">
			  <div class="card-body">
			  <form class="form-inline float-right" style="margin-bottom: 15px;">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" ng-model="standing.search" aria-label="Search">
			  </form>										  
				<table class="table table-striped table-bordered">
					<thead>
						<tr><th ng-repeat="str in standing.table_header">{{str.th}}</th></tr>
					</thead>
					<tbody>
						<tr ng-repeat="sc in standing.contestants | filter:standing.search"><td>{{sc.contestant_no}}</td><td><strong>{{sc.description}}</strong> ({{sc.contestant_name}})</td><td ng-repeat="scs in sc.scores">{{scs.score}}</td></tr>
					</tbody>
				</table>
			  </div>
			</div>
		  </div>							
		</div><!-- accordion -->
	</div>
</div>