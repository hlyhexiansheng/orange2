<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>单个产品</title>
		<link href="<%=basePath %>css/headertoparea.css" type="text/css" rel="stylesheet" />
		<link href="<%=basePath %>css/base.css" type="text/css" rel="stylesheet" />
		<script src="<%=basePath %>js/jquery-1.11.1.min.js" type="text/javascript" ></script>
		<script type="text/javascript">

		$(document).ready(initedPage);
		
		function initedPage(){
			initElementListener();
		}

		function initElementListener(){
			$('.smallImage').find('li').each(function(index, element) {
	               $(element).on('mouseover', onMouseOver) 
	            });

				$('.colorList').find('img').each(function(index, element) {
	                $(element).on('mouseover',onMouseOverColor);
	                $(element).on('mouseout',onMouseOutColor);
	                $(element).on('click',onMouseClickColor);
	            });

	            $('.sizeList').find('div').each(function(index,element){
					$(element).on('mouseover',onMouseOverSize);
					$(element).on('mouseout',onMouseOutSize);
					$(element).on('click',onMouseClickSize);	
	            });

	            $('.similarTermsList').find('div').each(function(index,element){
					$(element).on('mouseover',onMouseOverTermsList);
					$(element).on('mouseout',onMouseOutTermsList);
					$(element).on('click',onMouseClickTermsList);
		        });
		}

		function onMouseOverTermsList(){
			if($(this).attr("class") == "similarTermsListSingle-selected"){
				return;
			}
			$(this).attr("class","similarTermsListSingle-mouseOver");	
		}

		function onMouseOutTermsList(){
			if($(this).attr("class") == "similarTermsListSingle-selected"){
				return;
			}
			$(this).attr("class","similarTermsListSingle-normal");	
		}

		function onMouseClickTermsList(){
			if($(this).attr("class") == "similarTermsListSingle-selected"){
				return;
			}
			refreshTermsList();
			$(this).attr("class","similarTermsListSingle-selected");	
		}

		function refreshTermsList(){
            $('.similarTermsList').find('div').each(function(index,element){
				$(element).attr("class","similarTermsListSingle-normal");
	        });
		}

		function onMouseClickSize(){
			if($(this).attr("class") == "sizeListSingle-selected"){
				return;
			}
			refreshOtherSize();
			$(this).attr("class","sizeListSingle-selected");
		}

		function onMouseOutSize(){
			if($(this).attr("class") == "sizeListSingle-selected"){
				return;
			}
			$(this).attr("class","sizeListSingle-normal");
		}

		function onMouseOverSize(){
			if($(this).attr("class") == "sizeListSingle-selected"){
				return;
			}
			$(this).attr("class","sizeListSingle-mouseOver");
		}

		function onMouseClickColor(){
			if($(this).attr("class") == "img-selected"){
				return;	
			}
			refreshOtherColor();
			$(this).attr("class","img-selected");	
		}

		function refreshOtherColor(){
			$('.colorList').find('img').each(function(index, element) {
                $(element).attr("class","img-normal");
            });
		}

		function refreshOtherSize(){
            $('.sizeList').find('div').each(function(index,element){
				$(element).attr("class","sizeListSingle-normal");
             });
		}

		function onMouseOutColor(){
			if($(this).attr("class") == "img-selected"){
				return;	
			}
			$(this).attr("class","img-normal");	
		}

		function onMouseOverColor(){
			if($(this).attr("class") == "img-selected"){
				return;	
			}
			$(this).attr("class","img-mouseOver");	
		}
		
		function onMouseOver(){
			$("#bigImage").attr("src",$(this).attr("name"));		
		}		
		</script>		
		
	
	</head>
	
	

	<body>
		<div id="head">
			<div class="headerTopArea">
				<div class="headerTop">
					<div class="headerTopLeft"></div>
					<div class="headerTopRight"></div>
				</div>
			</div>
			<span class="blank_10"></span>
			<div class="mainNavBox">
				<div class="mainNav">
					<div class="mainNavList">
						<span class="mainNavListSingle">创建产品</span>
						<span class="mainNavListSingle">产品商城</span>
					</div>
				</div>
				<div class="seacher"></div>
			</div>
		</div>
		<span class="blank_10"></span>
		<div class="danpinBox">
			<div class="productCategoryBox">
				<span><a href="#">首页</a> </span>
				
				<span>></span>
				
				<span><a href="#">篮球</a> </span>
				
				<span>></span>
				
				<span><a href="#">NBA</a> </span>
				
				<span>></span>
				
				<span>单件名称</span>
			</div>
			<span class="blank_15"></span>
			<div class="danpinArea">
				<span class="blank_10"></span>
				<div class="danpinLeft">
					<div class="danpinLeft_picList">
						<div class="smallImage">
							<ul>
								<li name="<%=basePath %>image/product/bigImage1.png">
									<span style="background-image: url(<%=basePath %>image/product/image1.png);"></span>
								</li>
								<li name="<%=basePath %>image/product/bigImage2.png">
									<span style="background-image: url(<%=basePath %>image/product/image2.png);"></span>
								</li>
								<li name="<%=basePath %>image/product/bigImage3.png">
									<span style="background-image: url(<%=basePath %>image/product/image3.png);"></span>
								</li>
								<li name="<%=basePath %>image/product/bigImage4.png">
									<span style="background-image: url(<%=basePath %>image/product/image4.png);"></span>
								</li>
							</ul>
						</div>
					</div>
					<div class="danpinLeft_picCenter">
						<div class="bigImage">
							<img id="bigImage" src="<%=basePath %>image/product/bigImage1.png" title="none" />
						</div>
					</div>
				</div>
				<div class="danpinRight">
					<div class="similarTermsBox">
						<div style="margin: 10px;">
							类似的商品还有
						</div>
						<div class="similarTermsList">
							<div class="similarTermsListSingle-selected">
								<img src="<%=basePath %>image/product/product_1.png" />
							</div>
							<div class="similarTermsListSingle-normal">
								<img src="<%=basePath %>image/product/product_1.png" />
							</div>
							<div class="similarTermsListSingle-normal">
								<img src="<%=basePath %>image/product/product_1.png" />
							</div>
						</div>
					</div>
					<div class="normalInfo">
						<div class="priceBox">
							<span>售价:</span>
							<span>￥<strong>89</strong> </span>
						</div>
					</div>
					<span class="blank_30"></span>
					<div class="selectArea">
						<div class="colorTitle">
							颜色:
						</div>
						<span class="blank_5"></span>
						<div class="selectAreaColorSelectBox">
							<div class="colorList">
							<s:iterator value="#request.list" var="entry">
								<div class="colorListSingle">
									<img src="<%=basePath %>image/colorappearance/164,width=19.jpg" class="img-normal" />
								</div>
				  			</s:iterator>
							
								<!--<div class="colorListSingle">
									<img src="<%=basePath %>image/colorappearance/134,width=19.jpg" class="img-selected" />
								</div>
								<div class="colorListSingle">
									<img src="<%=basePath %>image/colorappearance/164,width=19.jpg" class="img-normal" />
								</div>
								<div class="colorListSingle">
									<img src="<%=basePath %>image/colorappearance/376,width=19.jpg" class="img-normal" />
								</div>
								<div class="colorListSingle">
									<img src="<%=basePath %>image/colorappearance/134,width=19.jpg" class="img-normal" />
								</div>
								<div class="colorListSingle">
									<img src="<%=basePath %>image/colorappearance/164,width=19.jpg" class="img-normal" />
								</div>
								<div class="colorListSingle">
									<img src="<%=basePath %>image/colorappearance/376,width=19.jpg" class="img-normal" />
								</div> -->
							</div>
						</div>
						<span class="blank_10"></span>
						<div>
							尺码:
						</div>
						<span class="blank_5"></span>
						<div class="selectAreaSizeSelectBox">
							<div class="sizeList">
								<div class="sizeListSingle-normal">
									S
								</div>
								<div class="sizeListSingle-normal">
									L
								</div>
								<div class="sizeListSingle-normal">
									XL
								</div>
								<div class="sizeListSingle-normal">
									XXL
								</div>
								<div class="sizeListSingle-normal">
									XXXL
								</div>
							</div>
						</div>
						<span class="blank_15"></span>
						<div class="selectAreaNumSelectBox">
							<div style="float: left">
								数量:&nbsp;
							</div>
							<div style="float: left">
								<select id="selectedCount">
									<option value="1">
										1
									</option>
									<option value="2">
										2
									</option>
									<option value="3">
										3
									</option>
									<option value="4">
										4
									</option>
									<option value="5">
										5
									</option>
									<option value="6">
										6
									</option>
									<option value="7">
										7
									</option>
								</select>
							</div>
						</div>
						<div class="selectAreaSelectedBox"></div>
						<!--  已购买信息预留 -->

						<span class="blank_25"></span>
						<div class="selectAreaBtnBuy">
							<a id="btnBuyLink" href="#" class="btnBuy">放入购物车</a>
						</div>
					</div>
				</div>
			</div>

		</div>
		<span class="blank_50"></span>
		<div class="infoDetail-recommend-box">
			<div class="recommendArea">
				<div class="title">
					<h3>
						看过此商品的顾客最终购买
					</h3>
				</div>
				<div class="recommendList">
					<div class="recommendListSingle">
						<img src="<%=basePath %>image/product/product_1.png" />
					</div>
					<div class="recommendListSingle">
						<img src="<%=basePath %>image/product/product_1.png" />
					</div>
					<div class="recommendListSingle">
						<img src="<%=basePath %>image/product/product_1.png" />
					</div>
				</div>
			</div>
			<div class="infonDetailArea">
				<div class="titleNavList">
					<ul>
						<li class="liSelected">
							商品详情
						</li>
						<li class="liNormal">
							印刷说明
						</li>
						<li class="liNormal">
							面料说明
						</li>
						<li class="liNormal">
							售后服务
						</li>
					</ul>
				</div>
				<div class="infoBox">
					<div class="productDetailArea">
						<!--商品详情:-->
						<div class="productMS">
							<span class="blank_15"></span>
							<h3>
								产品描述：
							</h3>
							<span class="blank_20"></span>
							<p style="color: #666;">
								本款为春夏T恤基础印花产品。面料为100%棉,款式基础百搭,吸汗,透气性良好,穿着舒适,易清洗,防敏感,不易起球,不易产生静电。
							</p>
							<font color="#FF0000">图案描述：</font>看过美国往事吗？我感动的哭了。
						</div>
						<span class="blank_20"></span>
						<div class="washSM">
							<h3>
								洗涤说明：
							</h3>
							<div>
								<span class="spriteWashings" title="40度水温 常规洗"
									style="background-position: 0px -0px"></span>
								<span class="spriteWashings" title="分色洗涤"
									style="background-position: 0px -80px"></span>
								<span class="spriteWashings" title="不可氯漂"
									style="background-position: 0px -160px"></span>
								<span class="spriteWashings" title="低温熨烫，最高110度"
									style="background-position: 0px -240px"></span>
								<span class="spriteWashings" title="不可转笼翻转干燥"
									style="background-position: 0px -320px"></span>
								<span class="spriteWashings" title="平摊干燥"
									style="background-position: 0px -400px"></span>
							</div>
						</div>
						<div class="sizeTable">
							<span class="blank_20"></span>
							<h3>
								产品尺码表：
							</h3>
							<span class="blank_20"></span>
							<table>
								<tbody>
									<tr>
										<td class="col01">
											尺码
										</td>
										<td class="col02">
											号型（身高/胸围）
										</td>
										<td class="col03">
											1/2胸围
										</td>
										<td class="col04">
											后衣长
										</td>
										<td class="col05">
											1/2下摆围
										</td>
										<td class="col06">
											袖长
										</td>
										<td class="col07">
											肩宽
										</td>
									</tr>
									<tr>
										<td>
											S
										</td>
										<td>
											165/88A
										</td>
										<td>
											48
										</td>
										<td>
											66
										</td>
										<td>
											48
										</td>
										<td>
											18
										</td>
										<td>
											43
										</td>
									</tr>
									<tr>
										<td>
											M
										</td>
										<td>
											170/92A
										</td>
										<td>
											50
										</td>
										<td>
											68
										</td>
										<td>
											50
										</td>
										<td>
											19
										</td>
										<td>
											44
										</td>
									</tr>
									<tr>
										<td>
											L
										</td>
										<td>
											175/96A
										</td>
										<td>
											52
										</td>
										<td>
											70
										</td>
										<td>
											52
										</td>
										<td>
											20
										</td>
										<td>
											45
										</td>
									</tr>
									<tr>
										<td>
											XL
										</td>
										<td>
											180/100A
										</td>
										<td>
											54
										</td>
										<td>
											72
										</td>
										<td>
											54
										</td>
										<td>
											21
										</td>
										<td>
											46
										</td>
									</tr>
									<tr>
										<td>
											XXL
										</td>
										<td>
											185/104A
										</td>
										<td>
											56
										</td>
										<td>
											74
										</td>
										<td>
											56
										</td>
										<td>
											22
										</td>
										<td>
											47
										</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td>
											XXXL
										</td>
										<td>
											190/108B
										</td>
										<td>
											58
										</td>
										<td>
											76
										</td>
										<td>
											58
										</td>
										<td>
											23
										</td>
										<td>
											48
										</td>
									</tr>
									<tr>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div class="printDetailArea">
						<!--打印说明:-->

					</div>
					<div class="shouHouDetailArea">
						<!--售后服务:-->

					</div>
				</div>
			</div>
		</div>
		<span class="blank_50"></span>
		<div class="footerBox">
			<div class="footer">
				<span class="blank_15"></span>
				<div class="helpCol01">
					<h3>
						关于我们
					</h3>
					<span class="blank_10"></span>
					<ul>
						<li>
							公司简介
						</li>
						<li>
							招贤纳士
						</li>
						<li>
							合作专区
						</li>
						<li>
							联系我们
						</li>
					</ul>
				</div>
				<div class="helpCol01">
					<h3>
						新手指南
					</h3>
					<span class="blank_10"></span>
					<ul>
						<li>
							自定义设计
						</li>
						<li>
							注册账户
						</li>
						<li>
							购物流程
						</li>
						<li>
							配送说明
						</li>
					</ul>
				</div>
				<div class="helpCol01">
					<h3>
						支付方式
					</h3>
					<span class="blank_10"></span>
					<ul>
						<li>
							货到付款
						</li>
						<li>
							在线支付
						</li>
						<li>
							账户余额
						</li>
					</ul>
				</div>
				<div class="helpCol01">
					<h3>
						售后服务
					</h3>
					<span class="blank_10"></span>
					<ul>
						<li>
							退换货政策
						</li>
						<li>
							退换货办理流程
						</li>
						<li>
							退款说明
						</li>
					</ul>
				</div>
				<div class="helpCol01">
					<h3>
						帮助
					</h3>
					<span class="blank_10"></span>
					<ul>
						<li>
							在线客服
						</li>
						<li>
							找回密码
						</li>
					</ul>
				</div>
			</div>
			<span class="blank_20"></span>
			<div style="color: #CCC; text-align: center">
				Copyright 2007 - 2014 vancl.com All Rights Reserved 京ICP证100557号
				京公网安备11011502002400号 出版物经营许可证新出发京批字第直110138号
			</div>
		</div>
		<s:debug></s:debug>
	</body>


</html>

