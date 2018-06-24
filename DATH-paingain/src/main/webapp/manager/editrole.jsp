<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Chình sửa vai trò trên trang</title>
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
	              	<h2><strong>Chình sửa vai trò trên trang</strong></h2>
	              	<hr/>
	                <!-- <span style="color:red"><i>${msg}</i></span> -->
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới module</button> </a>
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add2"><button><i class="fa fa-plus" ></i> Thêm mới thao tác</button> </a>
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
										  		<th>Xem chi tiết</th>
										  		<th>Thêm mới</th> 
										  		<th>Cập nhật</th>
										  		<th>Xóa</th>
										  		<th>Tùy chọn</th>
										  	</tr>
										  </thead>
										   <tbody>
										  <tr>
										    <td>Nhân viên</td>
										    <td><input type="checkbox" checked="checked" disabled="disabled"></td>
										    <td><input type="checkbox" checked="checked" disabled="disabled"></td>
										    <td><input type="checkbox" checked="checked" disabled="disabled"></td>
										    <td><input type="checkbox" checked="checked" disabled="disabled"></td>
										    <td>
										    	<a href="#" data-toggle="modal" data-target="#modal-edit" class="btn btn-link"> <i class="fa fa-edit"></i> Sửa</a>
										    </td>
										  </tr>
										  <tr>
										    <td>Sản phẩm</td>
										    <td><input type="checkbox" checked="checked" disabled="disabled"></td>
										    <td><input type="checkbox" checked="checked" disabled="disabled"></td>
										    <td><input type="checkbox" checked="checked" disabled="disabled"></td>
										    <td><input type="checkbox" checked="checked" disabled="disabled"></td>
										    <td>
										    	<a href="#" data-toggle="modal" data-target="#modal-edit" class="btn btn-link"> <i class="fa fa-edit"></i> Sửa</a>
										    </td>
										  </tr>
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
				                   <label >Tên module:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Tên module" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                            <textarea rows="4" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Module cha:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select>
				                            	<option>0</option>
				                            	<option>1</option>
				                            	<option>2</option>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                          <button type="reset" class="btn btn-info">Làm mới </button>
                          <button type="submit" class="btn btn-info">Lưu </button>
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
                        <form action="#" method="post">
                        <div class="modal-body">
                          	 <div class='col-sm-12'>
				                   <label >Tên chức năng:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select>
				                            	<option>--Tên các modules ở đây--</option>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Module:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select>
				                            	<option>0</option>
				                            	<option>1</option>
				                            	<option>2</option>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Vai trò:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select>
				                            	<option>Admin</option>
				                            	<option>Nhân viên</option>
				                            	<option>Khách hàng</option>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Thao tác:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                        	<input type="checkbox"> Xem chi tiết <br>	
				                        	<input type="checkbox"> Thêm mới	<br>
				                        	<input type="checkbox"> Cập nhật	<br>
				                        	<input type="checkbox"> Xóa	
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Trạng thái:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                        	<input type="checkbox">
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                            <textarea rows="4" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
				                        </div>
				                    </div>
				                </div>
				        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
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
                          <h4 class="modal-title" id="myModalLabel">Sửa chức năng:</h4>
                        </div>
                        <form action="#" method="post">
                        <div class="modal-body">
							                          	 <div class='col-sm-12'>
				                   <label >Tên chức năng:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" placeholder="Tên chức năng" value="--Tên chức năng ở đây--">
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Module:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select>
				                            	<option>0</option>
				                            	<option>1</option>
				                            	<option>2</option>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Vai trò:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select>
				                            	<option>Admin</option>
				                            	<option>Nhân viên</option>
				                            	<option>Khách hàng</option>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Thao tác:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                        	<input type="checkbox" checked="checked"> Xem chi tiết <br>	
				                        	<input type="checkbox" checked="checked"> Thêm mới	<br>
				                        	<input type="checkbox" checked="checked"> Cập nhật	<br>
				                        	<input type="checkbox" checked="checked"> Xóa	
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Trạng thái:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                        	<input type="checkbox" checked="checked">
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                            <textarea rows="4" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
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
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
	</body>
</html>
