#!/usr/bin/perl -w

print "Content-type: text/html\n\n";

#print "Content-type: text/json\n\n";

#print '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">', "\n";
#print "<html><head><title>Hallo Welt</title><base href='http://localhost/' />";
#print "<b>CONFIGURATORCMS</b>\n\n";


print <<HTML;

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery-ui.min.js"></script>
<script type="text/javascript" src="jquery.cookie.min.js"></script>
<script type="text/javascript" src="angular.min.js"></script>

<link rel="stylesheet" type="text/css" href="style.css">

</head>


<body>

<div ng-app="myApp">

<div ng-controller="myCtrl">
 
<!-- TODO: RESOLVE FILTER BUGS -->
<!--  input value="find " type="text" ng-model="filtStr" / --><br>
<ul id="image-list1" class="sortable-list">
	<li ng-repeat="y in cont | filter:filtStr | orderBy:y" id="{{ y }}">{{ y }}</li>
</ul>

<ul id="image-list2" class="sortable-list">
	<li ng-repeat="x in cont2 | orderBy:x" id="{{ x }}">{{ x }}</li>
</ul>
</div>
</div>
<!--  TEST PART -->
<br><br>

<pre id="testpart">

</pre>

<script type="text/javascript">
//_______ANGULAR PART____________
var jsonSer;
var cont = ["test1", "test2", "test3", "test4444"];
if( !localStorage.getItem("nextCall")){
	localStorage.setItem("cont2", JSON.stringify([]));
}

localStorage.setItem("nextCall", "done");


//_________END_ANGUALR__________



// CONFIG VALUES
var listSize = 4;

//functions
function srtbl_right( listClass, listId1, listId2, listSize, scope ){
	var dict = {};
	var cnt = 0;
	var outp;
	//alert("ok");
	$(listClass).sortable({
		  connectWith: listClass,
		  update: function(event, ui) {
		    
			var changedList = this.id;
		    var order = $(this).sortable('toArray');
			
		    if( cnt === 1 ){
		    	localStorage.setItem("cont2", JSON.stringify(order)); 
		    	
		    }
			cnt++;
			
			//alert(order.length + " --- " + list.length);
			var positions = scope.cont2.join("________\n");
		    //positions += "\n + ID:" + $(this).attr('id') + " \n";
		    
		    $("#testpart").append("##### " + positions + " ###\n\n").css("color", "red");

		    console.log({
		      id: changedList,
		      positions: positions
		    });
		  },
		  stop: function() {
			  
			cnt = 0;
			  
	    	if ( $( listId2 + ' li').length > listSize ) {
		        //alert('max reached');
		        //$('p#notice').show().html( 'Max reached, drag right only');
		        //$('p.l').hide();
		        //$('#list2 li').addClass('dis');
		        $(listId1).sortable({
		            cancel: 'li'
	        	});   
	   		} else {
		        //$('p#notice').hide().html('');
		        /* $('p.l').show();
		        $('#list2 li').removeClass('dis'); */
				//cont.splice(cont.indexOf(this.id),1);
		        $(listId1).sortable({
		            cancel: ''
		        });   
	    	} 
		}
	});
}


//______MAIN___________

var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope,$http){
	$http({
        method : "GET",
        url : "http://localhost/cgi-bin/"
    }).then(function mySuccess(response) {
        $scope.cont = response.data;
    }, function myError(response) {
        $scope.cont = response.statusText;
    });
        
        //$scope.cont = cont;
	$scope.cont2 = JSON.parse(localStorage.getItem('cont2'));
	console.log($scope.cont2);
	srtbl_right(".sortable-list", "#image-list1", "#image-list2", 2, $scope);
});




</script>
</body>
</html>

HTML
