
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
										  		<th>STT</th>
										  		<th>Tên sản phẩm</th>
										  		<th>Số lượng</th>
										  		<th>Giá bán</th>
										  		<th>Giá nhập</th>
										  		<th>Cập nhật</th>
										  		<th>Hot</th>
										  		<th>New</th>
										  		<th>Trạng thái</th>
										  		<th>Tùy chọn</th> 
										  	</tr>
										  </thead>
										  <tbody>
										  <%
										  		List<PgProducts> lst = new ProductDAO().getAllPgProducts(id);
										  		int dem=1;
										  		for(PgProducts pr : lst)
										  		{
										  			
										  		
										  %>
											  <tr>
											    <td><%=dem %></td>
											    <td><%=pr.getProductName() %></td>
											    <td><%=pr.getQuantity() %></td>
											    <td><%=pr.getUnitPrice() %></td>
											    <td><%=pr.getUnitOrder() %></td>
											    <td><%
											    	if(pr.getModifiedTime()== null){
											    		out.print("");
											    	} else {
											    		out.print(pr.getModifiedTime());
											    	}%></td>
											    <td><input type="checkbox"  <%=(pr.getIsHot())? "checked":"" %>></td>
											    <td><input type="checkbox"  <%=(pr.getIsNew())? "checked":"" %>></td>
											    <% if (pr.getProductStatus()==1) {
				                                        out.print("<td>Active</td>");
				                                    } else {
				                                        out.print("<td>InActive</td>");
				                                }
				                                %>
											    
											    <td>
											    	<a href="#" data-toggle="modal" data-target="#modal-edit" class="btn btn-link" onclick="pass_update(<%=pr.getProductId() %>,'<%=new ProductPictures().getPgProductPicturesByID(pr.getProductId()).getPath() %>','<%=pr.getProductName() %>',<%=pr.getPgCategories().getCategoryId() %>,<%=pr.getPgSuppliers().getSupplierId() %>,<%=pr.getQuantity() %>,<%=pr.getUnitPrice() %>,<%=pr.getUnitOrder() %>,'<%=pr.getIsHot() %>','<%=pr.getIsNew() %>','<%=pr.getDescription() %>',<%=pr.getProductStatus() %>,'<%=pr.getCreateTime() %>')" > <i class="fa fa-edit"></i> Sửa</a>
										    	</td>
											  </tr>
											  <%dem++;} %>
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
				                            <input type="number" class="form-control" name="soluong" min="1" max="100" placeholder="Số lượng" required="required" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Đơn giá bán:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="number" class="form-control" min="10000"  name="giaban" placeholder="Đơn giá bán" required="required" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Đơn giá nhập:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="number" class="form-control" min="10000"  name="gianhap" placeholder="Đơn giá nhập" required="required" />
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
                        <form action="/product?action=edit&st=1" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                        		<input type="hidden" id="eid" name="eid">
                        		<input type="hidden" id="ecreate" name="ecreate">
                        		<div class='col-sm-12'>
	                        		<label >Ảnh sản phẩm:</label>
	                        		<div class="clearfix"></div>
                        			<div style="height: 200px;width:200px;overflow: hidden;" class='col-sm-5' >
                        				<img width="200px" id="eoutput"/>
                        			</div>
                        			<div class='col-sm-6'>
                        				<br/>
                        				<br/>
                        				<br/>
                        				<input type="file" name="ephoto"  accept="image/*" onchange="eloadFile(event)" style="word-wrap: break-word;">
                        			</div>
                        		</div>
                          	 	<div class='col-sm-12'>
				                   <label >Tên sản phẩm:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" id="eten" name="eten" placeholder="Tên sản phẩm" required="required" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Danh mục:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <select  class="form-control" id="edanhmuc" name="edanhmuc">
				                            	
				                            	<%
				                            		//List<PgCategories> lstcate = new CategoryDAO().getActivePgCategories();
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
				                            <select  class="form-control" id="encc" name="encc">
				                            	<%
				                            		//List<PgSuppliers> lstncc = new PgSuppliersDAO().getListSupplier();
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
				                            <input type="number" class="form-control" min="1" max="100" id="esoluong" name="esoluong" placeholder="Số lượng" required="required" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Đơn giá bán:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="number" class="form-control" min="10000"  id="egiaban" name="egiaban" placeholder="Đơn giá bán" required="required" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Đơn giá nhập:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="number" class="form-control" min="10000"  id="egianhap" name="egianhap" placeholder="Đơn giá nhập" required="required" />
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <div class='col-sm-6'>
				                   		<label> Hot:</label>
					                    <input type="checkbox" id="ehot" name="ehot" value="true">
				                   </div>
				                   <div class='col-sm-6'>
				                   		<label> New:</label>
					                    <input type="checkbox" id="enew" name="enew" value="true">
				                   </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            
				                            <textarea id="emota" name="emota" rows="4" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
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
                        	<form action="/product?action=delete" method="post">
                        		<div class="edit">
                        			<input type="hidden" id="did" name="did" />
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
			    	
			    	document.getElementById("did").value = id;
			    };
			    function pass_update(id,eoutput,eten,edanhmuc,encc,esoluong,egiaban,egianhap,ehot,enew,emota,estatus,ecreate) {
			    	document.getElementById("eid").value = id; 
			    	document.getElementById("eoutput").src = eoutput;
			    	document.getElementById("eten").value = eten; 
			    	document.getElementById("edanhmuc").value = edanhmuc;
			    	document.getElementById("encc").value = encc;
			    	document.getElementById("egiaban").value = egiaban;
			    	document.getElementById("egianhap").value = egianhap;
			    	if(emota=="null"){
			    		document.getElementById("emota").value = "";
			    	} else {
			    		document.getElementById("emota").value = emota;
				    	
			    	}
			    	
			    	document.getElementById("esoluong").value = esoluong;
			    	if(ehot == "true") { document.getElementById("ehot").checked= true;} else { document.getElementById("ehot").checked= false;}
			    	if(enew == "true") { document.getElementById("enew").checked= true;} else { document.getElementById("enew").checked= false;}
			    	if(estatus==1){
			    		document.getElementById("estatus").value="1";
			    	} else {document.getElementById("estatus").value="0";}
			    	document.getElementById("ecreate").value = ecreate;
			    	
			    };
			    var eloadFile = function (event) {
	                 var reader = new FileReader();
	                 reader.onload = function () {
	                     var eoutput = document.getElementById('eoutput');
	                     eoutput.src = reader.result;
	                 };
	                 reader.readAsDataURL(event.target.files[0]);
	             };
			</script>
					<!-- ----------------------------------------------->
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>
    	
	</body>
</html>

