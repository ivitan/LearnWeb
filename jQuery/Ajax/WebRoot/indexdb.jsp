<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js/jquery-2.1.0.js" ></script>
        <script>
        	$(document).ready(function () {
        		$("#searchname").keyup(function () {
        			var searcon=$("#searchname").val();
        			$.ajax({ 
					type: "post",
					url: "JQuerySearch1",
					data:"searchname="+searcon,
					success: function(data){
						$("#helper").html(data);
					} 
				});
        		});
        	});
        	function getlist (id) {
        		$("#searchname").val($("#res_"+id).text());
        		$("#reslist").hide();
        	}
        </script>
        
    </head>
    <body>
    	<form method="get">
    		<input class="four" type="text" id="searchname" name="searchname" autocomplete="off" />
    		<input class="buttontype" type="submit" value="搜索" />
    		<div id="helper" class="hint"></div>
    	</form>
 	</body>
</html>