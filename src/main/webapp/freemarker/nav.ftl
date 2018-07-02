<nav id="mainnav-container">
                <div id="mainnav">

                    <!--Menu-->
                    <!--================================-->
                    <div id="mainnav-menu-wrap">
                        <div class="nano" id="pjax-nav-div">
                            <div class="nano-content">

                                <!--Profile Widget-->
                                <!--================================-->
                                <div id="mainnav-profile" class="mainnav-profile #if(setting.show_user_img=='0') hidden #end">
                                    <div class="profile-wrap">
                                        <div class="pad-btm">
                                            <span class="label label-success pull-right">管理员</span>
                                            <img class="img-circle img-sm img-border" src="${Request.ctx}/common/img/profile-photos/1.png" alt="Profile Picture">
                                        </div>
                                        <a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                                            <span class="pull-right dropdown-toggle">
                                                <i class="dropdown-caret"></i>
                                            </span>
                                            <p class="mnp-name">${username!""}</p>
                                            <#--<span class="mnp-desc">#(userEmail)</span>-->
                                        </a>
                                    </div>
                                    <div id="profile-nav" class="collapse list-group bg-trans">
                                        <a onclick="" href="javascript:void(0);" class="list-group-item">
                                            <i class="demo-pli-male icon-lg icon-fw"></i> 我的主页
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="demo-pli-gear icon-lg icon-fw"></i> 设置
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="demo-pli-information icon-lg icon-fw"></i> 帮助
                                        </a>
                                        <a href="${Request.ctx}/admin/login/logout" class="list-group-item">
                                            <i class="demo-pli-unlock icon-lg icon-fw"></i> 登出
                                        </a>
                                    </div>
                                </div>




                                <ul id="mainnav-menu" class="list-group">
						            <li class="active-link">
						                <a onclick="doPjax('${Request.ctx}/admin/home.shtml')" href="javascript:void(0);">
						                    <i class="demo-psi-home"></i>
						                    <span class="menu-title">
												<strong>首页</strong>
											</span>
						                </a>
						            </li>
						            
						
									<!-- ！！！动态菜单！！！开始！！！下面受到权限控制，使用sql查询出来的 -->
									<#list menus as menu>
                                        <li class="list-header">${menu.node.name}</li>
                                        <#list menu.children as c>
                                            <li>
                                                <a href="#">
                                                    <i class='${c.node.icon!"demo-psi-repair"}'></i>
                                                    <span class="menu-title">${c.node.name}</span>
                                                    <i class="arrow"></i>
                                                </a>
                                                <#if c.children?? >
                                                    <ul class="collapse">
                                                        <#list c.children as cc>
                                                            <li><a onclick="doPjax('${Request.ctx}${cc.node.url}')" href="javascript:void(0);">${cc.node.name}</a></li>
                                                        </#list>
                                                    </ul>
                                                </#if>
                                                <#--#if(b.children)-->
                                                <#--<ul class="collapse">-->
                                                    <#--#for(c:b.children)-->
                                                    <#--<li><a onclick="doPjax('${Request.ctx}#(c.url)')" href="javascript:void(0);">#(c.name)</a></li>-->
                                                    <#--#end-->
                                                <#--</ul>-->
                                                <#--#end-->
                                            </li>
                                        </#list>
									</#list>
											<li class="list-header"></li><!-- 占位 -->
									<!-- ！！！动态菜单！！！结束！！！ -->
						        </ul>
                            </div>
                        </div>
                    </div>
                    <!--================================-->
                    <!--End menu-->

                </div>
            </nav>
            
            
            
            
            
            
            
            
            
            
            
            
            
            <!-- 之前的代码备份 -->
            			<!-- 
            			
						            <li class="list-header">系统管理</li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-repair"></i>
						                    <span class="menu-title">系统设置</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                    <li><a onclick="doPjax('${Request.ctx}/admin/menu/getListPage')" href="javascript:void(0);">菜单管理</a></li>
						                    <li><a onclick="doPjax('${Request.ctx}/admin/user/getListPage')" href="javascript:void(0);">用户管理</a></li>
						                    <li><a onclick="doPjax('${Request.ctx}/admin/org/getListPage')" href="javascript:void(0);">组织结构</a></li>
						                    <li><a href="#">岗位管理</a></li>
						                </ul>
						            </li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-mail"></i>
						                    <span class="menu-title">权限管理</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                    <li><a onclick="doPjax('${Request.ctx}/admin/role/getListPage')" href="javascript:void(0);">角色管理</a></li>
						                </ul>
						            </li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-file-html"></i>
						                    <span class="menu-title">流程管理</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                    <li><a href="#">正在运行的流程</a></li>
						                    <li><a href="#">流程模型管理</a></li>
						                </ul>
						            </li>
									<li class="list-divider"></li>
									
									
						            <li class="list-header">我的工作</li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-pen-5"></i>
						                    <span class="menu-title">公文管理</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                    <li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
						                </ul>
						            </li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-boot-2"></i>
						                    <span class="menu-title">请假销假</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                    <li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
						                </ul>
						            </li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-receipt-4"></i>
						                    <span class="menu-title">车辆管理</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                    <li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
						                </ul>
						            </li>
									<li>
						                <a href="#">
						                    <i class="demo-psi-receipt-4"></i>
						                    <span class="menu-title">会议管理</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                    <li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
											<li><a href="#">这是菜单</a></li>
						                </ul>
						            </li>
						            <li>
						                <a href="charts.html">
						                    <i class="demo-psi-bar-chart"></i>
						                    <span class="menu-title">统计汇总</span>
						                </a>
						            </li>
						
						            <li class="list-divider"></li>
									
									
						            <li class="list-header">我的空间</li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-home"></i>
						                    <span class="menu-title">
												<strong>空间主页</strong>
											</span>
						                </a>
						            </li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-split-vertical-2"></i>
						                    <span class="menu-title">
												<strong>日志</strong>
											</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                	<li><a href="#">全部</a></li>
						                	<li class="list-divider"></li>
						                    <li><a href="#">日记</a></li>
						                    <li><a href="#">旅游</a></li>
						                    <li><a href="#">生活</a></li>
						                    <li><a href="#">家庭</a></li>
											<li class="list-divider"></li>
											<li><a href="#">java</a></li>
											<li><a href="#">activiti</a></li>
											<li><a href="#">sql</a></li>
											<li><a href="#">html</a></li>
											<li class="list-divider"></li>
											<li><a href="layouts-fixed-navbar.html">分组</a></li>
											<li><a href="layouts-fixed-footer.html">设置</a></li>
						                </ul>
						            </li>
									<li>
						                <a href="#">
						                    <i class="ti-gallery"></i>
						                    <span class="menu-title">
												<strong>相册</strong>
											</span>
						                </a>
						            </li>
									<li>
						                <a href="#">
						                    <i class="demo-psi-pen-5"></i>
						                    <span class="menu-title">
												<strong>动态</strong>
											</span>
						                </a>
						            </li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-receipt-4"></i>
						                    <span class="menu-title">
												<strong>留言板</strong>
											</span>
						                </a>
						            </li>						
						
						            <li class="list-divider"></li>
						
						           
						            <li class="list-header">系统图标</li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-happy"></i>
						                    <span class="menu-title">Packs图标</span>
											<i class="arrow"></i>
						                </a>
						                <ul class="collapse">
						                    <li><a href="icons-ionicons.html">Ion 图标</a></li>
											<li><a href="icons-themify.html">Themify图标</a></li>
											<li><a href="icons-font-awesome.html">Font Awesome图标</a></li>
											
						                </ul>
						            </li>
						            <li>
						                <a href="#">
						                    <i class="demo-psi-medal-2"></i>
						                    <span class="menu-title">
												PREMIUM 图标
											</span>
						                </a>
						                <ul class="collapse">
						                    <li><a href="premium-line-icons.html">线性图标</a></li>
											<li><a href="premium-solid-icons.html">平滑图标</a></li>
											
						                </ul>
						            </li>
						            <li>
						                <a href="helper-classes.html">
						                    <i class="demo-psi-inbox-full"></i>
						                    <span class="menu-title">系统帮助样式</span>
						                </a>
						            </li>    
						            
						            
						  -->   
            
            
            
            
            
            
            
            
            
            
            
           					    <!--菜单底部状态栏-->
                                 <!-- <div class="mainnav-widget">

                                    <div class="show-small">
                                        <a href="#" data-toggle="menu-widget" data-target="#demo-wg-server">
                                            <i class="demo-pli-monitor-2"></i>
                                        </a>
                                    </div>

                                    <div id="demo-wg-server" class="hide-small mainnav-widget-content">
                                        <ul class="list-group">
                                            <li class="list-header pad-no pad-ver">系统状态</li>
                                            <li class="mar-btm">
                                                <span class="label label-primary pull-right">15%</span>
                                                <p>本周工作情况</p>
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar progress-bar-primary" style="width: 15%;">
                                                        <span class="sr-only">15%</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="mar-btm">
                                                <span class="label label-purple pull-right">75%</span>
                                                <p>本月工作情况</p>
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar progress-bar-purple" style="width: 75%;">
                                                        <span class="sr-only">75%</span>
                                                    </div>
                                                </div>
                                            </li> 
                                            <li class="list-divider"></li>
                                            <li class="pad-ver"></li>
                                            <li class="pad-ver"><a href="#" class="btn btn-success btn-bock">查看详情</a></li> 
                                        </ul>
                                    </div>
                                </div> -->
