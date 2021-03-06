<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	HttpSession sesion = request.getSession();
	PgUsers u = (PgUsers) sesion.getAttribute("login");
	if(u.getPgRoles().getRoleId() != 1){
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
  		<title>Chình sửa vai trò trên trang</title>
		<%@include file="/template/header.jsp"%>
		<%
		int id = Integer.parseInt(request.getParameter("roleid"));
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
	              	<h2><strong>Chình sửa vai trò trên trang</strong></h2>
	              	<hr/>
	              	<span style="color:red"><i>${msg}</i></span>
	              	<% 
	              	PgRolePermission rl = new RolePermissionDAO().getPgRolePermissionByRoleIDModuleID(u.getPgRoles().getRoleId(), 10);
	              	if(rl.getPerStatus()==1){
	              		if(rl.getIsInsert()== true){
	              	
	              	%>
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới chức năng</button> </a>
	              <%}} %>
	               <% if (rs.getIsInsert()== true){ %>
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add2"><button><i class="fa fa-plus" ></i> Thêm mới thao tác</button> </a>
	                <%} %>
	                <!-- show table-->
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
										  		<th>Trạng thái thao tác</th>
										  		<th>Tùy chọn</th>
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
			                                <td>
			                                <% if(rs.getIsUpdate()== true){ %>
			                                <a href="#" onclick="pass_update(<%=per.getPermissionId()%>,'<%=per.getPgModules().getModuleName() %>',<%=per.getIsRead() %>,<%=per.getIsInsert() %>,<%=per.getIsUpdate() %>,<%=per.getPerStatus() %>,'<%=per.getDescription() %>')" data-toggle="modal" data-target="#modal-edit" class="btn btn-link"> <i class="fa fa-edit"></i> Sửa thao tác</a>
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
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Thêm mới vai trò: </h4>
                        </div>
                        <form action="/moduleac?action=addpq&id=<%=id %>" method="post">
                        <div class="modal-body">
                          	 <div class='col-sm-12'>
				                   <label >Tên chức năng: </label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="aname" class="form-control" name="name" placeholder="Tên danh mục" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Chức năng cha:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                           <select class="form-control" id="aparent" name="parent" >
			                                	<option value="0" selected>Không có</option>
				                           <%
				                           ArrayList <PgModules> lis = (ArrayList<PgModules>) new ModuleDAO().getActivePgModules();
				                           if(lis != null){
				                        	   for(PgModules l : lis){
				                        		   
				                        		   %>
				                        		<option value="<%=l.getModuleId() %>" ><%=l.getModuleName() %></option>   
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
			
			<!-- Add new modal 2-->
           <div class="modal fade bs-example-modal-lg" id="modal-add2" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-delete">
                    <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Thêm mới thao tác: </h4>
                        </div>
                        <form action="/rolecontrol?action=add" method="post">
                        <div class="modal-body">
                          	 <div class='col-sm-12'>
				                   <label >Tên chức năng:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select class="form-control" id="module" name="module" >
				                           <%
				                           ArrayList <PgModules> ls = (ArrayList<PgModules>) new ModuleDAO().getActivePgModules();
				                           if(lis != null){
				                        	   for(PgModules l : ls){
				                        		   
				                        		   %>
				                        		<option value="<%=l.getModuleId() %>" ><%=l.getModuleName() %></option>   
				                        		   <%
				                        	   }
				                           }
				                           %>
			                                	
			                                
											</select>
				                        </div>
				                    </div>
				                </div>
				               <div class="hd_id">
                        		<input type="hidden" id="roleid" class="form-control" name="roleid" value="<%=id%>"/>
                        	</div>
				                
				                <div class='col-sm-12'>
				                   <label >Thao tác:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                        	<input type="checkbox" id="read" name="read" onblur="adel_read()"> Xem chi tiết <br>	
				                        	<input type="checkbox" id="insert" name="insert" onblur="read_add()"> Thêm mới	<br>
				                        	<input type="checkbox" id="update" name="update" onblur="read_add()"> Cập nhật	<br>
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                            <textarea rows="4" name="desc" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
				                        </div>
				                    </div>
				                </div>
				        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="reset" class="btn btn-info">Làm mới </button>
                          <button type="submit" class="btn btn-info">Lưu </button>
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Add new  modal 2-->
			
			<!-- Edit modal -->
            <div class="modal fade bs-example-modal-lg" id="modal-edit" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-delete">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Sửa thao tác:</h4>
                        </div>
                        <form action="/rolecontrol?action=edit" method="post">
                        <div class="modal-body">
                        <div class="hd_id">
                        		<input type="hidden" id="perid" class="form-control" name="perid" />
                        	</div>
							   <div class='col-sm-12'>
				                   <label >Tên chức năng:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" placeholder="Tên chức năng" disabled="disabled" id="modelname">
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Thao tác:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                        	<input type="checkbox" id="eread" name="eread" onblur="del_read()"> Xem chi tiết <br>	
				                        	<input type="checkbox" id="einsert" name="einsert" onblur="read_edit()"> Thêm mới	<br>
				                        	<input type="checkbox" id="eupdate" name="eupdate" onblur="read_edit()"> Cập nhật	<br>
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Trạng thái:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select class="form-control" id="estatus" name="estatus" >
			                                	<option value="1" >Active</option>
			                                
			                                	<option value="0" >InActive</option>
			                                
											</select>
				                        </div>
				                    </div>
				             </div>
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                            <textarea id="edes" name="edes" rows="4" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
				                        </div>
				                    </div>
				                </div>                        	
			            </div>    
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                          <button type="submit" class="btn btn-info">Cập nhật </button>
                          
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Edit modal -->
					<!-- ----------------------------------------------->
			    </div>
			    <script type="text/javascript">
			    function pass_update(id,name,read,insert,update,status,des) {
			    	document.getElementById("perid").value = id; 
			    	document.getElementById("modelname").value = name;
			    	if(read == true){
			    		document.getElementById("eread").checked = true;
			    	} else {
			    		document.getElementById("eread").checked = false;
			    	}
			    	if(insert == true){
			    		document.getElementById("einsert").checked = true;
			    	}else {
			    		document.getElementById("einsert").checked = false;
			    	}
			    	if(update == true){
			    		document.getElementById("eupdate").checked = true;
			    	}else {
			    		document.getElementById("eupdate").checked = false;
			    	}
			    	if(status==1){
			    		document.getElementById("estatus").value="1";
			    	} else {document.getElementById("estatus").value="0";}

			    	document.getElementById("edes").value = des; 
			    };
			  
			    function checkadd(){
			    	if(document.getElementById("aname").value==""){
			    		alert("Bạn chưa điền tên chức năng.");
			    		return false;
			    	} 
			    	return true;
			    }
			    function read_edit(){
			    	if((document.getElementById("einsert").checked == true)||(document.getElementById("eupdate").checked == true)){
			    		document.getElementById("eread").checked = true;
			    	}
			    }
			    function read_add(){
			    	if((document.getElementById("insert").checked == true)||(document.getElementById("update").checked == true)){
			    		document.getElementById("read").checked = true;
			    	}
			    }
			    function del_read(){
			    	if((document.getElementById("eread").checked == false)){
			    		document.getElementById("einsert").checked = false;
			    		document.getElementById("eupdate").checked = false;
			    	}
			    }
			    function adel_read(){
			    	if((document.getElementById("read").checked == false)){
			    		document.getElementById("insert").checked = false;
			    		document.getElementById("update").checked = false;
			    	}
			    }
			    
			</script>
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
	</body>
</html>
<%}} %>
