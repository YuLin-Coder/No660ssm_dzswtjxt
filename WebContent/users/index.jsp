<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<link href="themes/ecmoban_dangdang/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="themes/ecmoban_dangdang/js/index.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.min.js"></script>
<style type="text/css">
/* css 重置 */
* {
	margin: 0;
	padding: 0;
	list-style: none
}

body {
	background: #fff;
	font: normal 12px/22px 宋体
}

img {
	border: 0
}

a {
	text-decoration: none;
	color: #333
}
/* 本例子css */
.picScroll-left {
	overflow: hidden;
	position: relative;
	border: 1px solid #ccc
}

.picScroll-left .hd {
	overflow: hidden;
	height: 30px;
	background: #f4f4f4;
	padding: 0 10px
}

.picScroll-left .hd .prev, .picScroll-left .hd .next {
	display: block;
	width: 5px;
	height: 9px;
	float: right;
	margin-right: 5px;
	margin-top: 10px;
	overflow: hidden;
	cursor: pointer;
	background: url("themes/ecmoban_dangdang/images/arrow.png") 0 0
		no-repeat
}

.picScroll-left .hd .next {
	background-position: 0 -50px
}

.picScroll-left .hd .prevStop {
	background-position: -60px 0
}

.picScroll-left .hd .nextStop {
	background-position: -60px -50px
}

.picScroll-left .hd ul {
	float: right;
	overflow: hidden;
	zoom: 1;
	margin-top: 10px;
	zoom: 1
}

.picScroll-left .hd ul li {
	float: left;
	width: 9px;
	height: 9px;
	overflow: hidden;
	margin-right: 5px;
	text-indent: -999px;
	cursor: pointer;
	background: url("themes/ecmoban_dangdang/images/icoCircle.gif") 0 -9px
		no-repeat
}

.picScroll-left .hd ul li.on {
	background-position: 0 0
}

.picScroll-left .bd {
	padding: 10px
}

.picScroll-left .bd ul {
	overflow: hidden;
	zoom: 1
}

.picScroll-left .bd ul li {
	margin: 0 8px;
	float: left;
	_display: inline;
	overflow: hidden;
	text-align: center
}

.picScroll-left .bd ul li .pic {
	text-align: center
}

.picScroll-left .bd ul li .pic img {
	width: 220px;
	height: 299px;
	display: block;
	padding: 2px;
	border: 1px solid #ccc
}

.picScroll-left .bd ul li .pic a:hover img {
	border-color: #999
}

.picScroll-left .bd ul li .title {
	line-height: 24px
}
</style>
</head>

<body class="index_page" style="min-width: 1200px;">
	<jsp:include page="header.jsp"></jsp:include>

	<div class="block clearfix">
		<div class="f_l" style="width: 1200px;">

			<div class="container" id="idTransformView">
				<ul class="slider" id="idSlider">
					<li><img src="pic/001.jpg" /></li>
					<li><img src="pic/002.jpg" /></li>
					<li><img src="pic/003.jpg" /></li>
					<li><img src="pic/004.jpg" /></li>
				</ul>
				<ul class="num" id="idNum">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
		<div class="blank"></div>
		<div class="box">
			<div class="box_1">
				<h3>
					<span class="text">猜你喜欢</span>
				</h3>
				<div class="picScroll-left">
					<div class="bd">
						<ul class="picList">
							<c:forEach items="${hotList}" var="goods">
								<li>
									<div class="pic">
										<a href="index/detail.action?id=${goods.goodsid }"><img src="${goods.image }" /></a>
									</div>
									<div class="title">
										<a href="index/detail.action?id=${goods.goodsid }">${fn:substring(goods.goodsname, 0, 8)}</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>

			</div>
		</div>
		<div class="blank"></div>
		<div class="goodsBox_1">
			<c:forEach items="${frontList}" var="cate" varStatus="status">
				<div class="xm-box">
					<h4 class="title">
						<span>${cate.catename}</span> <a class="more" href="index/cate.action?id=${cate.cateid }">更多</a>
					</h4>
					<div id="show_new_area" class="clearfix">
						<c:forEach items="${cate.goodsList}" var="goods">
							<div class="pic" style='margin-left: 0px;'>
								<a href="index/detail.action?id=${goods.goodsid }"><img src="${goods.image }" alt="${goods.goodsname }" class="img"
									style="width: 220px; height: 240px" /></a>
								<p class="name">
									<a href="index/detail.action?id=${goods.goodsid }" title="${goods.goodsname }">${goods.goodsname }</a>
								</p>
								<p class="price">
									价格：<font class="f1"> ￥${goods.price }元 </font>
								</p>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="blank"></div>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
		var ary = location.href.split("&");
		jQuery(".picScroll-left").slide({
			titCell : ".hd ul",
			mainCell : ".bd ul",
			autoPage : true,
			effect : "left",
			autoPlay : true,
			scroll : 6,
			vis : 5,
			delayTime : 1500,
			pnLoop : false
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
