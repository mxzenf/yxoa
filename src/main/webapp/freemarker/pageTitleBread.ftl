<div id="page-title">
	<h1 class="page-header text-overflow">${Request.pageTitleBread.pageTitle!""}</h1>
</div>
<ol class="breadcrumb">
	<li><a href="javascript:void(0);">首页</a></li>
	<li><a href="javascript:void(0);" onclick="doPjax('${Request.ctx}${Request.pageTitleBread.url!""}')">${Request.pageTitleBread.pageTitle!""}</a></li>
	<li class="active">${Request.pageTitleBread.nowBread!""}</li>
</ol>