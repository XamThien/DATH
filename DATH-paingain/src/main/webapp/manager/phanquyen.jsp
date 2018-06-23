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
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới</button> </a>
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
										    ArrayList<PgUsers> users = (ArrayList<PgUsers>) new UserDAO().getAccountByRole(role.getRoleId());
										    ArrayList<String> usname = new ArrayList<String>();
										    if(users != null){
		                        				for(PgUsers us : users){
		                        					usname.add(us.getUserId());
		                        				}
		                        			}
		                        			ArrayList<PgRolePermission> pers = (ArrayList<PgRolePermission>) new RolePermissionDAO().getPgRolePermissionByRoleID(role.getRoleId());
		                        			ArrayList<Boolean> perls = new ArrayList<Boolean>();
		                        			ArrayList<String> mol = new ArrayList<String>();
		                        			if(pers != null){
		                        				for(PgRolePermission per : pers){
		                        					mol.add(per.getPgModules().getModuleName());
		                        					perls.add(per.getIsRead());
		                        					perls.add(per.getIsInsert());
		                        					perls.add(per.getIsUpdate());
		                        					perls.add(per.getIsDelete());
		                        				}
		                        			}
										    %>
										    
										    <td>
										    	<a href="" onclick="detail(<%=role.getRoleId() %>,'<%=role.getRoleName() %>',<%=usname %>,<%=perls %>,<%=mol %>)" data-toggle="modal" data-target="#modal-detail" class="btn btn-link" > <i class="fa fa-eye" ></i> Chi tiết</a>
										    	<a href="editrole.jsp" class="btn btn-link" > <i class="fa fa-edit"></i> Sửa</a>
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
                        <form action="#" method="post">
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
                          <button type="submit" class="btn btn-info">Lưu </button>
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Add new  modal -->

			<!-- Edit modal -->
            
			<!--  Edit modal -->
			
			<!-- Detail modal -->
            <div class="modal fade bs-example-modal-lg" id="modal-detail" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-delete">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Chi tiết vai trò:</h4>
                        </div>
                        <form action="#" method="post">
                        <div class="modal-body">
                        	<div class="hd_id">
                        		<input type="hidden" id="did" class="form-control" name="id" />
                        	</div>
                        	<div class='col-sm-12'>
                        		 <label>Tài khoản thuộc quyền </label> <label id="dname"></label>
                        		<div id="listus">
                        		
                        		</div>
                        	</div>
                        	
                        	<div class='col-sm-12'>
                        		<label>Phạm vi thao tác:</label>
                        		<div id="listper">
                        		
                        		</div>
                        		<table id= "datatable" class="table table-striped table-bordered dataTable no-footer">
                        			
										  <thead>
										  	<tr>
										  		<th>Modules</th>
										  		<th>Xem chi tiết</th>
										  		<th>Thêm mới</th> 
										  		<th>Cập nhật</th>
										  		<th>Xóa</th>
										  	</tr>
										  </thead>
										   <tbody>
										  <tr>
										    <td>Nhân viên</td>
										    <td><input type="checkbox" checked="checked"></td>
										    <td><input type="checkbox" checked="checked"></td>
										    <td><input type="checkbox" checked="checked"></td>
										    <td><input type="checkbox" checked="checked"></td>
										  </tr>
										  <tr>
										    <td>Sản phẩm</td>
										    <td><input type="checkbox" checked="checked"></td>
										    <td><input type="checkbox" checked="checked"></td>
										    <td><input type="checkbox" checked="checked"></td>
										    <td><input type="checkbox" checked="checked"></td>
										  </tr>
										  </tbody>
								</table>
                        	</div>
			            </div>    
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Detail modal -->
			
			<!-- Delete modal -->
            
			<!--  Delete modal -->

        	<script type="text/javascript">
			    
			    function detail(id,name,usname,perls,mol) {
			    	document.getElementById("did").value = id; 
			    	document.getElementById("dname").append(name); 
			    	var html1='<ul>';
			    	if(usname !== null){
			    		for(var us in usname){
				    		html1 += '<li>'+ us + '</li>';
				    	}
				    	html1 += '</ul>';
				    	
			    	} else {
			    		html1 = 'Không có tài khoản';
			    	}
			    	document.getElementById("listus").append(html1);
			    	var html2='<table id= "datatable" class="table table-striped table-bordered dataTable no-footer"> <thead>'+
						  	'<tr><th>Modules</th><th>Xem chi tiết</th><th>Thêm mới</th> <th>Cập nhật</th><th>Xóa</th>	</tr> </thead> <tbody>';
			    	
		    		for(var i =0; i < mol.length;i++){
			    		html2 += '<tr><td>'+mol[i]+'</td>';
			    		if(perls[i*4]== true){
			    			html2 += '<td><input type="checkbox" checked="checked"></td>';
			    		} else {
			    			html2 += '<td><input type="checkbox"></td>';
			    		}
			    		if(perls[i*4+1]== true){
			    			html2 += '<td><input type="checkbox" checked="checked"></td>';
			    		} else {
			    			html2 += '<td><input type="checkbox"></td>';
			    		}
			    		if(perls[i*4+2]== true){
			    			html2 += '<td><input type="checkbox" checked="checked"></td>';
			    		} else {
			    			html2 += '<td><input type="checkbox"></td>';
			    		}
			    		if(perls[i*4+3]== true){
			    			html2 += '<td><input type="checkbox" checked="checked"></td></tr>';
			    		} else {
			    			html2 += '<td><input type="checkbox"></td></tr>';
			    		}
			    		
			    	}
			    	html2 += ' </tbody> </table>';
				    
			    	document.getElementById("listper").append(html2);
			    	
			    };
			    
			</script>
					<!-- ----------------------------------------------->
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
    	</div>
	</body>
</html>
