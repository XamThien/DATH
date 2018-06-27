<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	HttpSession sesion = request.getSession();
	PgUsers u = (PgUsers) sesion.getAttribute("login");
	if(u.getPgRoles().getRoleId()!=1){
		response.sendRedirect("/site/layouts/accessdenied.jsp");
	}
	PgRolePermission rs = new RolePermissionDAO().getPgRolePermissionByRoleIDModuleID(u.getPgRoles().getRoleId(), 9);
	if(rs.getPerStatus()==1){
		if(rs.getIsRead()== true){
%>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Phân quyền</title>
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
	              	<h2><strong>Vai trò trên trang</strong></h2>
	              	<hr/>
	               <span style="color:red"><i>${msg}</i></span> 
	               <%if(rs.getIsInsert()== true){ %>
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới</button> </a>
	                <%} %>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
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
										  		<th>ID</th>
										  		<th>Tên vai trò</th>
										  		<th>Vai trò cha</th>
										  		<th>Tùy chọn</th> 
										  		
										  	</tr>
										  </thead>
										   <tbody>
										   <%
							                	ArrayList <PgRoles> list = (ArrayList<PgRoles>)request.getAttribute("result");
						 	                	if (list!=null)
						 	                	{
						 	                		for (PgRoles role : list)
						 	                		{
						 	                		
							                %>
										   
										  <tr>
										    <td><%=role.getRoleId()%></td>
										    <td><%=role.getRoleName() %></td>
										    <%
										    	if(role.getParent()==0){
										    		out.print("<td></td>");
										    	} else{
										    		PgRoles parent = new RoleDAO().getPgRolesByID(role.getParent());
										    		%>
										    <td><%=parent.getRoleName() %></td>		
										    		<%
										    	}
										    %>
										    
										    <td>
										    
										    	<a href="chitietphanquyen.jsp?roleid=<%=role.getRoleId() %>" class="btn btn-link"> <i class="fa fa-eye" ></i> Chi tiết</a>
										    	<%if(rs.getIsUpdate()== true){ %>
										    	<a href="editrole.jsp?roleid=<%=role.getRoleId() %>" class="btn btn-link" > <i class="fa fa-edit"></i> Sửa</a>
										    <%} %>
										    </td>
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
           <div class="modal fade bs-example-modal-lg" id="modal-add" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-delete">
                    <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                          <h4 class="modal-title" id="myModalLabel">Thêm mới vai trò: </h4>
                        </div>
                        <form action="rolecontrol?action=add" method="post">
                        <div class="modal-body">
                          	 <div class='col-sm-12'>
				                   <label >Tên vai trò:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="aname" class="form-control" name="name" placeholder="Tên vai trò" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Vai trò cha:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select class="form-control" id="aparent" name="parent">
				                            	<option value="0" selected>Không có vai trò cha</option>
				                            	<%
				                            		ArrayList<PgRoles> parents = (ArrayList<PgRoles>) new RoleDAO().getAllPgRoles();
				                            	if (parents!=null)
						 	                	{
						 	                		for (PgRoles roles : parents)
						 	                		{
				                            	%>
				                            	<option value="<%=roles.getRoleId()%>"><%=roles.getRoleName() %></option>
				                            	<%
						 	                		}
						 	                	}
				                            	%>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="reset" class="btn btn-info">Làm mới </button>
                          <button type="submit" onclick="return checkadd()" class="btn btn-info">Lưu </button>
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Add new  modal -->

			<!-- Edit modal -->
            
			<!--  Edit modal -->
			
			<!-- Detail modal -->
           
			<!--  Detail modal -->
			
			<!-- Delete modal -->
            
			<!--  Delete modal -->

        	<script type="text/javascript">
        	function checkadd(){
		    	if(document.getElementById("aname").value==""){
		    		alert("Bạn chưa điền tên vai trò.");
		    		return false;
		    	} 
		    	return true;
		    }
			    
			</script>
					<!-- ----------------------------------------------->
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
	</body>
</html>
<%}}%>