  	//window.onload = function()
  	//{	
  	//	var ousername = document.getElementById("username");	
  	//	ousername.focus();		
  	//}
  	
  	function PWEnter()
  	{
    	var keyCode = event.keyCode;    
    	if(keyCode == 13)
    		checkuser();     	
    }
  	
  	function checkuser()
  	{
  		var un_str = username.value;
  		var pw_str = password.value;
  		//alert('ok');
  		var msg_str = "";
  		if(un_str == '' || un_str == null)
  		{
  			msg_str = "请输入用户名！";
			//获取网页滚动的left值
			var srlLeft=getScrollLeft();
			var LeftDiv=$("#username").offset().left;
			var Left=srlLeft+parseInt(LeftDiv);
			$("#hint").css("left",Left+"px");//设置列表框的left值
			
			//获取网页滚动的top值
			var srlTop=getScrollTop();
			var TopDiv=$("#username").offset().top;
			var Top=srlTop+parseInt(TopDiv)+24;
			$("#hint").css("top",Top+"px");//设置列表框的top值
			$("#hint").css("height","20px");
			$("#hint").css("width","120px");
			$("#hint").css("color","red");
			$("#hint").css({"background-color":"yellow"});
			$("#hint").css("position","absolute");
			$("#hint").show();
			$('#hint').html(msg_str);

			username.focus();
  			username.select();
  		}
  		else if(pw_str == '' || pw_str == null)
  		{
  			msg_str = "密码不能为空！";
			//获取网页滚动的left值
			var srlLeft=getScrollLeft();
			var LeftDiv=$("#password").offset().left;
			var Left=srlLeft+parseInt(LeftDiv);
			$("#hint").css("left",Left+"px");//设置列表框的left值
			
			//获取网页滚动的top值
			var srlTop=getScrollTop();
			var TopDiv=$("#password").offset().top;
			var Top=srlTop+parseInt(TopDiv)+24;
			$("#hint").css("top",Top+"px");//设置列表框的top值
			$("#hint").css("height","20px");
			$("#hint").css("width","120px");
			$("#hint").css("color","red");
			$("#hint").css({"background-color":"yellow"});
			$("#hint").css("position","absolute");
			$("#hint").show();
			$('#hint').html(msg_str);

			password.focus();
  			password.select();
  		}
  		else
  		{
			$.ajax({ 
				type: "post", 
				url: "logincheck", 
				data: "username="+$('#username').val()+"&password="+$('#password').val(), 
				success: function(data) {
					if (data == "userwrong") { 
			  			msg_str = "用户名错误！";
						//获取网页滚动的left值
						var srlLeft=getScrollLeft();
						var LeftDiv=$("#username").offset().left;
						var Left=srlLeft+parseInt(LeftDiv);
						$("#hint").css("left",Left+"px");//设置列表框的left值
						
						//获取网页滚动的top值
						var srlTop=getScrollTop();
						var TopDiv=$("#username").offset().top;
						var Top=srlTop+parseInt(TopDiv)+24;
						$("#hint").css("top",Top+"px");//设置列表框的top值
						$("#hint").css("height","20px");
						$("#hint").css("width","120px");
						$("#hint").css("color","red");
						$("#hint").css({"background-color":"yellow"});
						$("#hint").css("position","absolute");
						$("#hint").show();
						$('#hint').html(msg_str);

						username.value='';
						password.value='';
						username.focus();
						username.select();
						//window.location.href="elecmap.html"; 
					} 
					else if (data == "passwordwrong") { 
						msg_str = "密码错误！";
						//获取网页滚动的left值
						var srlLeft=getScrollLeft();
						var LeftDiv=$("#password").offset().left;
						var Left=srlLeft+parseInt(LeftDiv);
						$("#hint").css("left",Left+"px");//设置列表框的left值
						
						//获取网页滚动的top值
						var srlTop=getScrollTop();
						var TopDiv=$("#password").offset().top;
						var Top=srlTop+parseInt(TopDiv)+24;
						$("#hint").css("top",Top+"px");//设置列表框的top值
						$("#hint").css("height","20px");
						$("#hint").css("width","120px");
						$("#hint").css("color","red");
						$("#hint").css({"background-color":"yellow"});
						$("#hint").css("position","absolute");
						$("#hint").show();
						$('#hint').html(msg_str);

						password.value='';
			  			password.focus();
			  			password.select();
					} 
					else
						$("#header").html($.ajax({url:"header_search.jsp",async:false}).responseText);
				} 
			});
		} 
  	}
