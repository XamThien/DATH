<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DAO.LogDAO"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<%
				long doanhthu = (long) request.getAttribute("revenueday");
				int orderc = (int) request.getAttribute("order");
				int userrc = (int) request.getAttribute("user");

				 SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
				try {
		            Date date = request.getParameter("filter") != null ? formatter.parse(request.getParameter("filter"))
		                    : new Date(System.currentTimeMillis() - (24 * 60 * 60 * 1000));
		            //Session session = Hibernate.getSessionFactory().openSession();
		            List<PgLog> logs = new LogDAO().getAllPgLog();
		           
		            
				
				%>
				<div class="right_col" role="main">
					<!-- ----------------------------------------------->
					<div class="row top_tiles">
						  <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="tile-stats">
							  <div class="icon"><i class="fa fa-money" style="color: blue;"></i></div>
							  <div class="count"><%=doanhthu %></div>
							  <h3>Doanh thu trong ngày</h3>
							  <p>.</p>
							</div>
						  </div>
						  <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="tile-stats">
							  <div class="icon"><i class="fa fa-credit-card" style="color: blue;"></i></div>
							  <div class="count"><%=orderc %></div>
							  <h3>Đơn đặt hàng trong ngày</h3>
							  <p>.</p>
							</div>
						  </div>
						  <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="tile-stats">
							  <div class="icon"><i class="fa fa-slideshare" style="color: blue;"></i></div>
							  <div class="count"><%=userrc %></div>
							  <h3>Khách mới trong ngày</h3>
							  <p>.</p>
							</div>
						  </div>
						  
						</div>
						<!--thông số tổng quan-->
						<div class="row">
							  <div class="col-md-12">
								<div class="x_panel">
								  <div class="x_title">
									<h2>Thống kê hoạt động hàng ngày:</h2>
									
									<div class="clearfix"></div>
								  </div>
								  <div class="x_content">
<!--===========================================================================-->							  
									<div class="col-md-12 col-sm-12 col-xs-12" style="height:400px;overflow: auto;">
									
									  <div class="x_panel">
										
										<div class="x_content" >
										  <div class="dashboard-widget-content">
						
											<ul class="list-unstyled timeline widget">
												<%
													for (PgLog log : logs) {
										                long logc = new Date().getTime() - log.getCreatedTime().getTime();
										                long diffMinutes = logc / (60 * 1000) % 60;
										                long diffHours = logc / (60 * 60 * 1000) % 24;
										                long diffDays = logc / (24 * 60 * 60 * 1000);
										                String str = diffDays != 0 ? diffDays + " day " : "";
										                str += diffHours != 0 ? diffHours + " hours " : "";
										                str += diffMinutes != 0 ? diffMinutes + " minutes" : "just now";
										                /* content += "<li><b>- " + log.getPgUsers().getUserId() + " </b> " + log.getDescription()
										                        + " " + log.getLogValue() + " "
										                        + "<p style='font-size: 11px;'><i>" + str + "</i></p></li>"; */
										            
													%>
											  <li>
												<div class="block">
												  <div class="block_content">
													<h2 class="title">
																	  <a><%=log.getPgUsers().getUserId() %></a>
																  </h2>
													<div class="byline">
													  <span><%=str %></span>
													</div>
													<p class="excerpt"> <%=log.getDescription() + " " + log.getLogValue() + " " %>
													</p>
												  </div>
												</div>
											  </li>
											
											  <%} %>
											</ul>
										  </div>
										</div>
									  </div>
									</div>
<!--===========================================================================-->	
								
<!--===========================================================================-->	
								  </div>
								</div>
							  </div>
							</div>
					<!-- ----------------------------------------------->
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			<%
				} catch (Exception ex) {
		            response.getWriter().print(ex.getMessage());
		            
		        }
			%>
		      </div>
		    </div>
    	</div>
	</body>
</html>
