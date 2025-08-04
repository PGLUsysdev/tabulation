      <ul class="app-menu">
        <li><a class="app-menu__item<?=($page=="dashboard")?" active":"";?>" href="index.html"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span></a></li>
        <li class="treeview<?=(($page=="monitoring_portions")||($page=="monitoring_network"))?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">Monitoring</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="monitoring_portions")?" active":"";?>" href="monitoring-portions.html"> Portions</a></li>		  
            <li><a class="treeview-item<?=($page=="monitoring_rounds")?" active":"";?>" href="monitoring-rounds.html"> Rounds</a></li>		  
            <li><a class="treeview-item<?=($page=="monitoring_network")?" active":"";?>" href="monitoring-network.html"> Network</a></li>
          </ul>
        </li>
		<li ng-show="profile.description=='Tabulator'"><a class="app-menu__item<?=($page=="sheets")?" active":"";?>" href="sheets.html"><i class="app-menu__icon fa fa-calculator"></i><span class="app-menu__label">Sheets</span></a></li>
        <li class="treeview<?=($page=="results_list")?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-certificate"></i><span class="app-menu__label">Results</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="results_list")?" active":"";?>" href="results-list.html"> Individual</a></li>
          </ul>
        </li>
        <li class="treeview<?=($page=="special_awards")||($page=="special_awards_results")?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-trophy"></i><span class="app-menu__label">Special Awards</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="special_awards")?" active":"";?>" href="special-awards.html"> Manage Awards</a></li>
            <li><a class="treeview-item<?=($page=="special_awards_results")?" active":"";?>" href="special-awards-results.html"> Results</a></li>
          </ul>
        </li>
        <li class="treeview<?=($page=="competitions")||($page=="competitions_results")?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-list-ul"></i><span class="app-menu__label">Competitions</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="competitions")?" active":"";?>" href="competitions.html"> Manage Competitions</a></li>
            <li><a class="treeview-item<?=($page=="competitions_results")?" active":"";?>" href="competitions-results.html"> Results</a></li>
          </ul>
        </li>		
        <li class="treeview<?=($page=="contestant")||($page=="contestants")?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-user-circle"></i><span class="app-menu__label">Contestants</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="contestant")?" active":"";?>" href="contestant.html"> Contestant</a></li>
            <li><a class="treeview-item<?=($page=="contestants")?" active":"";?>" href="contestants.html"> Contestants List</a></li>
          </ul>
        </li>
        <li class="treeview<?=($page=="round")||($page=="rounds")?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-list-ul"></i><span class="app-menu__label">Rounds</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="round")?" active":"";?>" href="round.html"> Round</a></li>
            <li><a class="treeview-item<?=($page=="rounds")?" active":"";?>" href="rounds.html"> Rounds List</a></li>
          </ul>
        </li>		
        <li class="treeview<?=($page=="portion")||($page=="portions")?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-list-ul"></i><span class="app-menu__label">Portions</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="portion")?" active":"";?>" href="portion.html"> Portion</a></li>
            <li><a class="treeview-item<?=($page=="portions")?" active":"";?>" href="portions.html"> Portions List</a></li>
          </ul>
        </li>		
        <li class="treeview<?=($page=="user")||($page=="users")?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">Users</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="user")?" active":"";?>" href="user.html"> User</a></li>
            <li><a class="treeview-item<?=($page=="users")?" active":"";?>" href="users.html"> Users List</a></li>
          </ul>
        </li>
        <li class="treeview<?=($page=="event")||($page=="events")?" is-expanded":"";?>" ng-show="profile.description=='Tabulator'"><a class="app-menu__item" href="javascript:;" data-toggle="treeview"><i class="app-menu__icon fa fa-calendar-o"></i><span class="app-menu__label">Events</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item<?=($page=="event")?" active":"";?>" href="event.html"> Event</a></li>
            <li><a class="treeview-item<?=($page=="events")?" active":"";?>" href="events.html"> Events List</a></li>
          </ul>
        </li>		
      </ul>