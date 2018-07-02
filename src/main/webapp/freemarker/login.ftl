
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>


    <!--STYLESHEET-->
    <!--=================================================-->
	<#include "include.ftl">
    
    <!--=================================================

    REQUIRED
    You must include this in your project.


    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.


    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.


    Detailed information and more samples can be found in the document.

    =================================================-->
        



    <!-- Create your own class to load custum image [ SAMPLE ]-->
    <style>
        .demo-my-bg{
            background-image : url("${Request.ctx}/common/img/balloon.jpg");
        }
    </style>


    
</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->

<body>
    <div id="container" class="cls-container">
        
		<!-- BACKGROUND IMAGE -->
		<!--===================================================-->
		<div id="bg-overlay" class="bg-img" style="background-image: url(${Request.ctx}/common/img/bg-img/bg-img-3.jpg)"></div>
		
		
		<!-- LOGIN FORM -->
		<!--===================================================-->
		<div class="cls-content">
		    <div class="cls-content-sm panel">
			${error!""}
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h3 class="h4 mar-no">登录</h3>
		                <p class="text-muted">使用您的帐号密码进行登录</p>
		            </div>
		            <form action="${Request.ctx}/u/doLogin.shtml" method="post">
		                <div class="form-group">
		                    <input type="text" name="username" class="form-control" placeholder="用户名" autofocus>
		                </div>
		                <div class="form-group">
		                    <input type="password" name="password" class="form-control" placeholder="密码">
		                </div>
		                <input class="btn btn-primary btn-lg btn-block" id="login" type="submit">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</input>
		            </form>
		        </div>
		
		        <div class="pad-all">
		            <a href="#" class="btn-link mar-rgt">忘记密码 ?</a>
		            <a href="#" class="btn-link mar-lft">注册新账号</a>
		
		            <div class="media pad-top bord-top">
		                <div class="pull-right">
		                    <a href="#" class="pad-rgt"><i class="ti-facebook icon-lg text-primary"></i></a>
		                    <a href="#" class="pad-rgt"><i class="ti-twitter-alt icon-lg text-info"></i></a>
		                    <a href="#" class="pad-rgt"><i class="ti-google icon-lg text-danger"></i></a>
		                </div>
		                <div class="media-body text-left">
		                    	其他方式登陆
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--===================================================-->
		
		
		
    </div>
    <!--===================================================-->
    <!-- END OF CONTAINER -->
		<script>
		$.niftyNoty({
            type: 'primary',
            message : '用户名:admin<br/>,密码:1',
            container : 'floating',
            timer : 5000
        });
//			  var err = "#(error??)";
//			  if(err){
//				  $.niftyNoty({
//                      type: 'danger',
//                      message : err,
//                      container : 'floating',
//                      timer : 5000
//                  });
//			  }

        <#--$(document).ready(function(){-->
            <#--$("#login").click(function(){-->
                <#--var username = $('#username').val();-->
                <#--var password = $('#password').val();-->
                <#--$.ajax({-->
                    <#--url: "${Request.ctx}/u/doLogin.shtml",-->
                    <#--type: "post",-->
                    <#--dataType: "html",-->
                    <#--data: {-->
                        <#--"username": username,-->
                        <#--"password": password-->
                    <#--},-->
					<#--success : function(data, textStatus){-->
						<#--alert(data);-->
					<#--},-->
                    <#--error : function(XMLHttpRequest, textStatus, errorThrown){-->
						<#--alert(errorThrown);-->
					<#--}-->
                <#--});-->
            <#--});-->
        <#--});-->
		</script>
    </body>
</html>

