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
  		<title>Quản lý chức năng</title>
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
	              	<h2><strong>Quản lý chức năng</strong></h2>
					<span style="color:red"><i>${msg }</i></span>
	              	<hr/>
	               
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới</button> </a>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Danh mục chức năng</h2>
		                    
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
										  		<th>Mã chức năng</th>
										  		<th>Tên chức năng</th>
										  		<th>Chức năng cha</th>
										  		<th>Trạng thái</th>
										  		<th>Tùy chọn</th> 
										  	</tr>
										  </thead>
										   <tbody>
										  <%
							                	ArrayList <PgModules> list = (ArrayList<PgModules>)request.getAttribute("result");
						 	                	if (list!=null)
						 	                	{
						 	                		for (PgModules mol : list)
						 	                		{
						 	                		
							                %>
										 
										  	
										  <tr>
										    <td><%=mol.getModuleId()%></td>
										    <td><%=mol.getModuleName() %></td>
										    <td><%
										     	if(mol.getParent()==0){
										     		out.print("Không có");
										     	} else {
										     	PgModules	mols =  new ModuleDAO().getPgModulesByID(mol.getParent());
										     		out.print(mols.getModuleName());
										     	}
										     
										     %></td>
										    <% if (mol.getModuleStatus()==1) {
			                                        out.print("<td>Active</td>");
			                                    } else {
			                                        out.print("<td>InActive</td>");
			                                }%>
											<td>
										    	<a href="#" onclick="pass_update(<%=mol.getModuleId() %>,'<%=mol.getModuleName() %>','<%=mol.getParent() %>',<%=mol.getModuleStatus() %>)" data-toggle="modal" data-target="#modal-edit" class="btn btn-link"> <i class="fa fa-edit"></i> Sửa</a>
										    	<%-- <a href="#" onclick="pass_del(<%=catg.getCategoryId() %>)" data-toggle="modal" data-target="#modal-delete" class="btn btn-link" > <i class="fa fa-trash-o" ></i> Xóa</a> --%>
										    	
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
                          <h4 class="modal-title" id="myModalLabel">Thêm mới chức năng: </h4>
                        </div>
                        <form action="/moduleac?action=add" method="post">
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
				                           ArrayList <PgModules> lis = (ArrayList<PgModules>)request.getAttribute("result");
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

			<!-- Edit modal -->
            <div class="modal fade bs-example-modal-lg" id="modal-edit" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-delete">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Sửa thông tin chức năng:</h4>
                        </div>
                        <form action="/moduleac?action=edit" method="post">
                        <div class="modal-body">
                        	<div class="hd_id">
                        		<input type="hidden" id="eid" class="form-control" name="id" />
                        	</div>
                          	 <div class='col-sm-12'>
				                   <label >Tên chức năng: </label>
				                    <div class="form-group ">
				                        <div class="form-group code" >
				                            <input id="ename" class="form-control" name="name" placeholder="Tên danh mục" />
				                            
				                        </div>
				                    </div>
				                </div>
			                 
			                 <div class='col-sm-12'>
				                   <label >Chức năng cha:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                           <select class="form-control" id="eparent" name="parent" >
			                                	<option value="0">Không có</option>
				                           <%
				                           ArrayList <PgModules> lst = (ArrayList<PgModules>)request.getAttribute("result");
				                           if(lis != null){
				                        	   for(PgModules l : lst){
				                        		   
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
				             <div class='col-sm-12'>
				                   <label >Trạng thái:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select class="form-control" id="estatus" name="status" >
			                                	<option value="1" >Active</option>
			                                
			                                	<option value="0" >InActive</option>
			                                
											</select>
				                        </div>
				                    </div>
				             </div>
			            </div>    
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="submit" onclick="return checkedit()" class="btn btn-info">Cập nhật </button>
                          
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Edit modal -->
			<!-- Delete modal 
            <div class="modal fade bs-example-modal-lg" id="modal-delete" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm modal-delete">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Xác nhận</h4>
                        </div>
                        
                        <div class="modal-footer">
                        	<form action="del" method="post">
                        		<div class="edit">
                        			<input type="hidden" id="txtid" name="did" />
                        		</div>
                          		<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                          		<button type="submit" class="btn btn-info">Xóa</button>
                          
                          	</form>
                        </div>

                      </div>
                    </div>
            </div>
			  Delete modal -->

        	<script type="text/javascript">
			    function pass_update(id,name,parent,status) {
			    	document.getElementById("eid").value = id; 
			    	document.getElementById("ename").value = name; 
			    	document.getElementById("eparent").value = parent; 
			    	if(status==1){
			    		document.getElementById("estatus").value="1";
			    	} else {document.getElementById("estatus").value="0";}
			    	
			    };
			  
			    function checkadd(){
			    	if(document.getElementById("aname").value==""){
			    		alert("Bạn chưa điền tên danh mục sản phẩm.");
			    		return false;
			    	} 
			    	return true;
			    }
			    function checkedit(){
			    	if(document.getElementById("ename").value==""){
			    		alert("Bạn chưa điền tên danh mục sản phẩm.");
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
    	</div>
	</body>
</html>
