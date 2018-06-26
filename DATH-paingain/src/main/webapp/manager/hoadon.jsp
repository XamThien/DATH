<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	HttpSession sesion = request.getSession();
	PgUsers u = (PgUsers) sesion.getAttribute("login");
	if(u.getPgRoles().getRoleId() != 1 && u.getPgRoles().getRoleId() != 2){
		response.sendRedirect("/site/layouts/accessdenied.jsp");
	}
%>
<!DOCTYPE html>
<html>
	<% 
		int stt = Integer.parseInt(request.getParameter("stt"));
		String title ="";
		if(stt==1) {title = "đang xử lý tiếp nhận";}
		if(stt==2) {title = "đang giao";}
		if(stt==3) {title = "hoàn thành";}
		if(stt==0) {title = "hủy";}
	%>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Quản lý đơn hàng <%=title %></title>
		<%@include file="/template/header.jsp"%>
	</head>
	<body >
			<div class="nav-md">
		    <div class="container body">
		      <div class="main_container"> 
		            
		    	<%@include file="/template/navbar.jsp"%>
				
				<%@include file="/template/topnav.jsp"%>
				
				<div class="right_col" role="main">
					<!-- ----------------------------------------------->
					<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
	              	<h2><strong>Quản lý đơn hàng <%=title %></strong></h2>
					<span style="color:red"><i>${msg }</i></span>
	              	<hr/>
	               
	                
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Danh sách đơn hàng</h2>
		                    
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                  	<!-- search-->
					        <!-- ========================== -->
					        <div class="container">
				            	<div class="row">
					                <div class="col-sm-12">
					                	<table id= "datatable" class="table table-striped table-bordered dataTable no-footer">
										  <thead>
										  	<tr>
										  		<th>STT</th>
										  		<th>Ngày tạo đơn</th>
										  		<th>Ngày duyệt đơn</th>
										  		<th>Khách hàng</th>
										  		<th>Số điện thoại nhận</th>
												
										  		<th></th> 
										  	</tr>
										  </thead>
										   <tbody>
										  <%
							                	List <PgOrders> list = new PgOrdersDAO().getAllPgOrders(stt);
						 	                	if (list!=null)
						 	                	{
						 	                		int dem =1;
						 	                		for (PgOrders or : list)
						 	                		{
						 	                		
							                %>
										 
										  	
										  <tr>
										    <td><%=dem %></td>
										    <td><%=or.getOrderDate() %></td>
										    <td><%=or.getApprovedDate() %></td>
										    <td><%=or.getPgUsers().getFirstName() %> <%=or.getPgUsers().getLastName() %></td>
										    <td><%=or.getShipPhone() %></td>
											<td>
										    	<a href="/manager/chitiethoadon.jsp?stt=<%=stt %>&id=<%=or.getOrderId()%>"  class="btn btn-link">  Chi tiết</a>
										    	
										    	
										    </td>
										  </tr>
										  
										  <%
					 	                		dem++;}
					 	                	}
						 	                	else {out.println("Không có dữ liệu hiển thị");}
						                %>
										  </tbody>
										</table>
					                </div>
					                <div class="clearfix"></div>
					                
	
							        <div class="ln_solid"></div>
							       
				            </div>

			        		</div>
					        <!-- ========================== -->
					      </div>
	             </div>
				 </div>
              </div>
            </div>


        	
					<!-- ----------------------------------------------->
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
    	</div>
	</body>
</html>
