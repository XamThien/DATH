<%@page import="DAO.*"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Quản lý sản phẩm</title>
		<%@include file="/template/header.jsp"%>
	</head>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		
		session.setAttribute("cateid", id);
	%>
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
	              	<h2><strong>Quản lý sản phẩm</strong></h2>
	              	<span style="color:red"><i>${msg}</i></span>
	              	<hr/>
	                
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới</button> </a>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Danh sách sản phẩm</h2>
		                    
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
										  		<th></th>
										  		<th>Tên sản phẩm</th>
										  		<th>Số lượng</th>
										  		<th>Giá bán</th>
										  		<th>Giá nhập</th>
										  		<th>Cập nhật</th>
										  		<th>Hot</th>
										  		<th>New</th>
										  		<th>Tùy chọn</th> 
										  	</tr>
										  </thead>
										  <tbody>
										  <%
										  		List<PgProducts> lst = new ProductDAO().getAllPgProducts(id);
										  		for(PgProducts pr : lst)
										  		{
										  			
										  		
										  %>
											  <tr>
											    <td><img style="max-height:40px; max-width:40px;" src="/images/<%= new ProductPictures().getPgProductPicturesByID(pr.getProductId()).getPath()%>"></td>
											    <td><%=pr.getProductName() %></td>
											    <td><%=pr.getQuantity() %></td>
											    <td><%=pr.getUnitPrice() %></td>
											    <td><%=pr.getUnitOrder() %></td>
											    <td><%=pr.getModifiedTime() %></td>
											    <td><input type="checkbox"  <%=(pr.getIsHot())? "checked":"" %>></td>
											    <td><input type="checkbox"  <%=(pr.getIsNew())? "checked":"" %>></td>
											    
											    <td>
											    	<a href="#" data-toggle="modal" data-target="#modal-edit" class="btn btn-link" > <i class="fa fa-edit"></i> Sửa</a>
										    	<a href="#" data-toggle="modal" data-target="#modal-delete" class="btn btn-link" > <i class="fa fa-trash-o" ></i> Xóa</a>
											    </td>
											  </tr>
											  <%} %>
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
                          <h4 class="modal-title" id="myModalLabel">Thêm mới sản phẩm: </h4>
                        </div>
                        <form action="/product?action=add" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                        		<div class='col-sm-12'>
	                        		<label >Ảnh sản phẩm:</label>
	                        		<div class="clearfix"></div>
                        			<div style="height: 200px;width:200px;overflow: hidden;" class='col-sm-5' >
                        				<img width="200px" id="output"/>
                        			</div>
                        			<div class='col-sm-6'>
                        				<br/>
                        				<br/>
                        				<br/>
                        				<input type="file" name="photo"  accept="image/*" onchange="loadFile(event)" style="word-wrap: break-word;" required="required">
                        			</div>
                        		</div>
                          	 	<div class='col-sm-12'>
				                   <label >Tên sản phẩm:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="ten" placeholder="Tên sản phẩm" required="required" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Danh mục:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select  class="form-control" name="danhmuc">
				                            	
				                            	<%
				                            		List<PgCategories> lstcate = new CategoryDAO().getActivePgCategories();
				                            		for(PgCategories ct : lstcate)
				                            		{
				                            	%>
				                            	<option value="<%=ct.getCategoryId()%>"><%=ct.getCategoryName() %></option>
				                            	<%} %>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                
			                 	<div class='col-sm-12'>
				                   <label >Nhà cung cấp:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select  class="form-control" name="ncc">
				                            	<%
				                            		List<PgSuppliers> lstncc = new PgSuppliersDAO().getListSupplier();
				                            		for(PgSuppliers ct : lstncc)
				                            		{
				                            	%>
				                            	<option value="<%=ct.getSupplierId()%>"><%=ct.getCompanyName() %></option>
				                            	<%} %>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Số lượng:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="number" class="form-control" name="soluong" placeholder="Số lượng" required="required" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Đơn giá bán:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="number" class="form-control" name="giaban" placeholder="Đơn giá bán" required="required" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Đơn giá nhập:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="number" class="form-control" name="gianhap" placeholder="Đơn giá nhập" required="required" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <div class='col-sm-6'>
				                   		<label> Hot:</label>
					                    <input type="checkbox" name="hot" value="true">
				                   </div>
				                   <div class='col-sm-6'>
				                   		<label> New:</label>
					                    <input type="checkbox" name="new" value="true">
				                   </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            
				                            <textarea rows="4" cols="50" style="width: 450px;" placeholder="Mô tả..." name="mota"></textarea>
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
                        		<div>
                        			<div style="float: left; width: 200px; height: 200px; margin-right: 50px; ">
                        				<img style="max-height: 200px; max-width: 200px; border: 1px solid; border-radius: 12px;" src="/resources/production/images/prod-1.jpg">
                        			</div>
                        			<div style="padding-top: 70px;">
                        				<button style="background-color: lightblue; border:none; border-radius: 10px; font-size: 20px; width: 150px;">Tải ảnh lên</button>
                        			</div>
                        		</div>
                          	 	<div class='col-sm-12'>
				                   <label >Tên sản phẩm:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Tên sản phẩm" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Danh mục:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select style="width: 200px;">
				                            	<option>--Chọn danh mục--</option>
				                            	<option>Áo</option>
				                            	<option>Quần</option>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                
			                 	<div class='col-sm-12'>
				                   <label >Nhà cung cấp:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select style="width: 200px;">
				                            	<option>--Chọn nhà cung cấp--</option>
				                            	<option>Nike</option>
				                            	<option>Adidas</option>
				                            	<option>Under Armour</option>
				                            </select>
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Số lượng:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="username" placeholder="Số lượng" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Đơn giá:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="pass" placeholder="Đơn giá" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="Mô tả..." />  -->
				                            <textarea rows="4" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label>Ngày chỉnh sửa cuối:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <p><script> 
				                            	document.write(new Date().toLocaleDateString()+"\t\t---");
				                            	document.write(new Date().toLocaleTimeString()); 
				                            </script></p>
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label>Trạng thái:</label>
				                    <div class="form-group" >
				                        <input type="radio"> Còn hàng <br>  
				                        <input type="radio"> Hết hàng <br>
				                        <input type="radio"> Ẩn
				                    </div>
				                </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
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
	        	 var loadFile = function (event) {
	                 var reader = new FileReader();
	                 reader.onload = function () {
	                     var output = document.getElementById('output');
	                     output.src = reader.result;
	                 };
	                 reader.readAsDataURL(event.target.files[0]);
	             };// code display image upload
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
