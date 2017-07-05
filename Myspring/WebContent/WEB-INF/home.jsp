<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="JS/jquery.autocomplete.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link  rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script>
	
$( function() {
   
	//call ajax function
	 $( "#searchbox" ).autocomplete({
     // source: availableTags{
    	 source:function(request,response)
	//  var availableTags = [];
	 {
	                   $.ajax({
		                        url : "/Myspring/search",
		                        type : "GET",
		                        data : {
		                        	searchbox : request.term
		                        },
		                        dataType : "json",
		                        success : function(data) {
	                                response(data);
	                        }

		                        });
                             }
                        });
});

</script>
</head>


<body>



<header style="background-color:#3b5998;">

<div class="container">
	<div class="row">
	<%
	System.out.println(session.getAttribute("firstname"));
	System.out.println(session.getAttribute("lastname"));
	System.out.println(session.getAttribute("file"));
	System.out.println(session.getAttribute("userid"));
	%>
	  <div class="col-md-6">
	  <img height="40" width="40"src="<c:url value="/images/fblogo.png" />"/>  
		<input type="text" placeholder="search facebook" name="searchbox" id="searchbox" style="width:55%; margin-top:8px;">
		<span class="glyphicon glyphicon-search" style="position: absolute;left:330px;top:14px; "></span></div>
	
		  <div class="col-md-1"style="margin-top:12px;color:black;"><a href="seemore">See More</a></div> 
		   
	  <div class="col-md-4">
    <h5><font color="#fff"><img height="40" width="40"src="<c:url value="/images/${file}" />"/></font>${ID}${firstname} ${lastname}</h5></div>
    <div class="col-md-1" class="btn btn-primary;"style="margin-top:12px;"><a href="logout">Logout</a></div>
		</div>
			</div>
			
</header>

    
   
<div class="container-fluid"style="background-color:#f7f7f7; height:600px;">
	<div class="row" >
    
	<div class="col-md-2"style="margin-top: 10px;"><img height="40" width="40"src="<c:url value="/images/${file}" />"/>${firstname} ${lastname} <br>
	<span class="glyphicon glyphicon-edit"style="color:blue;"></span> Edit profile<br>
	<span class="glyphicon glyphicon-edit"style="color:blue;"></span><a href="friendrequest">Approve Friend</a><br>
	<span class="glyphicon glyphicon-edit"style="color:blue;"></span><a href="searchfriend">Search Friend</a></div>
	
	<div class="col-md-6"style="margin-top: 10px;background-color:white;">
	<div class="row"style="height:30px;">
	<div class="col-md-4" style="display:inline-block;border-right-style:solid;border-right-width:2px;border-color:lightgrey;">
	<span class="glyphicon glyphicon-edit"style="color:blue;"></span>Update status</div>
	<div class="col-md-4" style="display:inline-block;border-right-style:solid;border-right-width:2px;border-color:lightgrey;"><span class="glyphicon glyphicon-picture"style="color:blue;"></span>Add photos/videos</div>
	<div class="col-md-4" style="display:inline-block;">
	<span class="glyphicon glyphicon-pencil"style="color:blue;"></span>Write notes</div>
	
	</div>
	<div class="row">
	<div class="col-md-1">
	<img height="40" width="40"src="<c:url value="/images/${file}" />"/>
	</div>
	<div class="col-md-8">
	<textarea placeholder="What's on your mind?"style="margin: 0px; width:350px; height: 100px;"></textarea>
	</div>
	<div class="col-md-3"style="margin-top:60px;">
	
	<input type="submit" value="POST" id="post" class="btn btn-success">
	</div>
	
	</div>
	</div>
	<div class="col-md-3">Your Adds
	<div class="row">
	<div class="col-md-9" style="background-color:#3b5998; height:150px; margin-left: 15px;"></div>
	</div>
	</div>
	</div>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-6" style="margin-top: 5px;background-color:white; height:150px;"></div>
	
	</div>
    </div>
      	
       
        
</body>
</html>
