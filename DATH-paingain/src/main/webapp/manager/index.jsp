<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Pain And Gain| Trang chủ</title>
		<%@include file="/template/header.jsp"%>
	</head>
	<body >
			<div class="nav-md">
		    <div class="container body">
		      <div class="main_container"> 
		            
		    	<%@include file="/template/navbar.jsp"%>
				
				<%@include file="/template/topnav.jsp"%>
				
				<div class="right_col" role="main">
					<div class="row">
						<div class="col-md-4">
							<div class="card p-30">
								<div class="media">
									<div class="media-left meida media-middle">
										<span>
											<i class="fa fa-money f-s-40 color-primary"></i>
										</span>
									</div>
									<div class="media-body media-text-right">
										<h2>16,870,000</h2>
										<p class="m-b-0">Doanh thu hôm nay</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card p-30">
								<div class="media">
									<div class="media-left meida media-middle">
										<span>
											<i class="fa fa-shopping-cart f-s-40 color-primary"></i>
										</span>
									</div>
									<div class="media-body media-text-right">
										<h2>23</h2>
										<p class="m-b-0">Số đơn hàng</p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="card p-30">
								<div class="media">
									<div class="media-left meida media-middle">
										<span>
											<i class="fa fa-user f-s-40 color-primary"></i>
										</span>
									</div>
									<div class="media-body media-text-right">
										<h2>11</h2>
										<p class="m-b-0">Khách hàng mới</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-8">
						<!-- Bar Chart -->
					<div class="card">
						<div class="card-title">
							<h4>Doanh thu</h4>
							<select style="font-size: 14px; float: right;">
								<option>Hôm nay</option>
								<option>7 ngày vừa qua</option>
								<option>Tháng này</option>
								<option>Tháng trước</option>
							</select>
						</div>
						<div class="flot-container">
							<div id="flotBar" style="padding: 0px; position: relative;">
								<canvas class="flot-base" width="422" height="275" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 422.5px; height: 275px;"></canvas>
								<div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
									<div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px;">
										<div class="flot-tick-label tickLabel" style="position: absolute; max-width: 52px; top: 256px; left: 67px; text-align: center;">9:00</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; max-width: 52px; top: 256px; left: 125px; text-align: center;">12:00</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; max-width: 52px; top: 256px; left: 183px; text-align: center;">14:00</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; max-width: 52px; top: 256px; left: 242px; text-align: center;">15:00</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; max-width: 52px; top: 256px; left: 300px; text-align: center;">18:00</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; max-width: 52px; top: 256px; left: 358px; text-align: center;">21:00</div>
									</div>
									<div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px;">
										<div class="flot-tick-label tickLabel" style="position: absolute; top: 241px; left: 23px; text-align: right;">0</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; top: 207px; left: 0px; text-align: right;">500,000</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; top: 173px; left: 0px; text-align: right;">1,000,000</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; top: 138px; left: 0px; text-align: right;">1,500,000</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; top: 104px; left: 0px; text-align: right;">2,000,000</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; top: 69px; left: 0px; text-align: right;">2,500,000</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; top: 35px; left: 0px; text-align: right;">3,000,000</div>
										<div class="flot-tick-label tickLabel" style="position: absolute; top: 1px; left: 0px; text-align: right;">3,500,000</div>
									</div>
								</div>
								<canvas class="flot-overlay" width="422" height="275" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 422.5px; height: 275px;"></canvas>
							</div>
						</div>
					</div>
					<!-- Bar Chart -->
					</div>
					<!-- Recent Activity -->
					<div class="col-md-4">
					<div class="panel">
						<div class="panel-body">
							<h3 class="title-hero">Hoạt động gần đây</h3>
							<ul>
								<li><b>- Admin</b> vừa thực hiện kiểm hàng
									<p style="font-size: 11px;"><i>20 phút trước</i></p>
								</li>
								<li><b>- Nhan vien 1</b> vừa đăng nhập
									<p style="font-size: 11px;"><i>15 phút trước</i></p>
								</li>
								<li><b>- Nhan vien 1</b> vừa bán đơn hàng trị giá 300,000đ
									<p style="font-size: 11px;"><i>Vừa xong</i></p>
								</li>
							</ul>
						</div>
					</div>
				<!-- Recent Activity -->
				</div>
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
    	</div>
	</body>
</html>
