<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Quản lý nhà cung cấp</title>
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
	              	<h2><strong>Quản lý nhà cung cấp</strong></h2>
	              	<hr/>
	                <!-- <span style="color:red"><i>${msg}</i></span> -->
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới</button> </a>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Danh sách nhà cung cấp</h2>
		                    
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
										  		<th>Mã nhà cung cấp</th>
										  		<th>Tên nhà cung cấp</th>
										  		<th>Tên công ty</th>
										  		<th>Địa chỉ</th>
										  		<th>Số điện thoại</th>
										  		<th>Email</th>
										  		<th>Trạng thái</th>
										  		<th>Tùy chọn</th> 
										  	</tr>
										  </thead>
										  <tbody>
											  <tr>
											    <td>1</td>
											    <td>Nike Product</td>
											    <td>Nike Co.Ltd</td>
											    <td>California, USA</td>
											    <td>123123123</td>
											    <td>nikebetterworld@gmail.com</td>
											    <td>Còn hợp tác</td>
											    <td>
											    	<a href="#" data-toggle="modal" data-target="#modal-edit" class="btn btn-link" > <i class="fa fa-edit"></i> Sửa</a>
											    	<a href="#" data-toggle="modal" data-target="#modal-delete" class="btn btn-link" > <i class="fa fa-trash-o" ></i> Xóa</a>
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
                          <h4 class="modal-title" id="myModalLabel">Thêm nhà cung cấp: </h4>
                        </div>
                        <form action="#" method="post">
                        <div class="modal-body">
                          	 	<div class='col-sm-12'>
				                   <label >Tên nhà cung cấp:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Tên nhà cung cấp" />
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Tên công ty: </label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Tên công ty" />
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Địa chỉ:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Địa chỉ" />
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Số điện thoại:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="number" class="form-control" name="name" placeholder="Số điện thoại" />
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Email:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Email" />
				                        </div>
				                    </div>
				                </div>
				                
				                
				                <div class='col-sm-12'>
				                   <label>Trạng thái:</label>
				                    <div class="form-group" >
				                        <input type="radio"> Còn hợp tác <br>  
				                        <input type="radio"> Hết hợp tác <br>
				                        <input type="radio"> Ẩn
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

			<!-- Edit modal -->
            <div class="modal fade bs-example-modal-lg" id="modal-edit" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-delete">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Chỉnh sửa thông tin sản phẩm:</h4>
                        </div>
                        <form action="#" method="post">
                        <div class="modal-body">
                          	 	<div class='col-sm-12'>
				                   <label >Tên nhà cung cấp:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Tên nhà cung cấp" />
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Tên công ty: </label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Tên công ty" />
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Địa chỉ:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Địa chỉ" />
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Số điện thoại:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="number" class="form-control" name="name" placeholder="Số điện thoại" />
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Email:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Email" />
				                        </div>
				                    </div>
				                </div>
				                
				                
				                <div class='col-sm-12'>
				                   <label>Trạng thái:</label>
				                    <div class="form-group" >
				                        <input type="radio"> Còn hợp tác <br>  
				                        <input type="radio"> Hết hợp tác <br>
				                        <input type="radio"> Ẩn
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
			<!-- Delete modal -->
            <div class="modal fade bs-example-modal-lg" id="modal-delete" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm modal-delete">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Xác nhận</h4>
                        </div>
                        
                        <div class="modal-footer">
                        	<form action="#" method="post">
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
			<!--  Delete modal -->

        	<script type="text/javascript">
			    function pass_del(id) {
			    	
			    	document.getElementById("txtid").value = id;
			    };
			    function pass_update(id,name,phone,username,pass,address) {
			    	document.getElementById("eid").value = id; 
			    	document.getElementById("ename").value = name; 
			    	document.getElementById("ephone").value = phone; 
			    	document.getElementById("eusername").value = username;
			    	document.getElementById("epass").value = pass;
			    	document.getElementById("eaddress").value = address;
			    	
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
