<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Thông tin chi tiết các vai trò</title>
		<%@include file="/template/header.jsp"%>
		<%
		int id = Integer.parseInt(request.getParameter("roleid"));
		PgRoles role = new RoleDAO().getPgRolesByID(id);
	%>
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
	              	<h2><strong>Thông tin chi tiết của vai trò <%=role.getRoleName() %></strong></h2>
	              	<hr/>
	                <!-- <span style="color:red"><i>${msg}</i></span> -->
	                <a href="editrole.jsp?roleid=<%=id %>" style="color: #2c6c8a;"><button><i class="fa fa-edit" ></i> Sửa phân quyền chức năng</button> </a>
	               <!-- show table-->
	               <div class="x_panel">
		                  <div class="x_title">
		                  	<h2>Các tài khoản trực thuộc vai trò <%=role.getRoleName() %>:</h2>
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
										  		<th>Tên tài khoản</th>
										  		<th>Tên nhân viên</th>
										  		<th>Giới tính</th>
										  		<th>Số điện thoại</th> 
												<th>Trạng thái</th>
										  	</tr>
										  </thead>
										   <tbody>
										   <%
										   		ArrayList<PgUsers> us = (ArrayList<PgUsers>) new UserDAO().getAccountByRole(id);
										   		if(us != null){
										   			for(PgUsers user : us){
										   				%>
											   <tr>
												    <td><%=user.getUserId() %></td>
												    <td><%=user.getLastName()+" "+user.getFirstName()%></td>
												    <td><%
															if(user.getSex()==true){
																out.print("Nam");
															}else{
																out.print("Nữ");
															}
															%></td>
												    <td><%=user.getPhoneNumber() %></td>
												    <% if (user.getUserStatus()==1) {
					                                        out.print("<td>Active</td>");
					                                    } else {
					                                        out.print("<td>InActive</td>");
					                                }%>
											  </tr>
										   				
										   	<%
										   			}
										   		}
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
	                <div class="x_panel">
		                  <div class="x_title">
		                  	<h2>Thao tác với chức năng:</h2>
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
										  		<th>Chức năng</th>
										  		<th>Mô tả</th>
										  		<th>Xem chi tiết</th>
										  		<th>Thêm mới</th> 
										  		<th>Cập nhật</th>
										  		<th>Trạng thái</th>
										  	</tr>
										  </thead>
										   <tbody>
										   <%
										   ArrayList<PgRolePermission> pers = (ArrayList<PgRolePermission>) new RolePermissionDAO().getPgRolePermissionByRoleID(id);
									   		if(pers != null){
									   			for(PgRolePermission per : pers){
										   %>
										  <tr>
										    <td><%=per.getPgModules().getModuleName() %></td>
										     
										    <td><% if(per.getDescription() == null){
										    	out.print("");
										    } else {out.print(per.getDescription());}
										    
										    %></td>
										    <td><%
										    	if(per.getIsRead()){
										    		out.print("<input type=\"checkbox\" checked=\"checked\" disabled=\"disabled\">");
										    	} else {
										    		out.print("<input type=\"checkbox\" disabled=\"disabled\">");
											    	}
										    %></td>
										    <td><%
										    	if(per.getIsInsert()){
										    		out.print("<input type=\"checkbox\" checked=\"checked\" disabled=\"disabled\">");
										    	} else {
										    		out.print("<input type=\"checkbox\" disabled=\"disabled\">");
											    	}
										    %></td>
										   <td><%
										    	if(per.getIsUpdate()){
										    		out.print("<input type=\"checkbox\" checked=\"checked\" disabled=\"disabled\">");
										    	} else {
										    		out.print("<input type=\"checkbox\" disabled=\"disabled\">");
											    	}
										    %></td>
										   
			                                <% if (per.getPerStatus()==1) {
			                                        out.print("<td>Active</td>");
			                                    } else {
			                                        out.print("<td>InActive</td>");
			                                }%>
										  </tr>
										  <%
									   			}
									   		}
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
            
            <!-- Add new modal -->
           
			<!--  Edit modal -->
					<!-- ----------------------------------------------->
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
	</body>
</html>
