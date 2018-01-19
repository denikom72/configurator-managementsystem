
$(document).ready(function () {
    



	$.ajax({
                //asynch: false,
                type: "GET",
                //url: "json.cgi",
        	url: 'http://localhost/configur-cms/json.cgi',
                dataType: "json",
                //contentType: "application/json; charset=utf-8",
                //data: "name=John&location=Boston",
                success: function(msg){
                        alert( "  Data Saved: " + msg );
                        console.log();
                        //document.location.reload();
                                
                },
                error: function(error){
                        alert( 'msg ' + "error: " + error);
                }
        }); 



/*
$.ajax({ 
        type: 'GET', 
        url: 'http://localhost/configur-cms/json.cgi',
	dataType:'json', 
        success: function (data) { 

        //alert(data); 

	$(data).each(function(i,v){
		console.log( i + " : " + v);
	});
 
	$("#cand").append(JSON.stringify(data));	

	},
	error:function(err){ alert(err);}
    });
});

*/
//alert('test');

function sendData( id, uri, params ){
	var ajaxUrl = "";
	ajaxUrl += uri + "?";

	params.forEach(function(v,i){
		ajaxUrl += v[0] + "=" + v[1] + "&";
			
	});

	//console.log( "\n" + ajaxUrl );
	//alert(ajaxUrl);	
	
}

//$("#send").click(function(e){
//	e.preventDefault;
//	var user = document.getElementById("user").value;
//	var pw = document.getElementById("password").value;

	// CALL CGI-LOGIN-SERVICE
	//sendData( "#send", "http://localhost/configur-cms/login.cgi", [["user", user],["pw", pw]] );
//});

});
