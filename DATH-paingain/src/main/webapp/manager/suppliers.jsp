<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="model.PgSuppliers" %>
<%@ page import="DAO.PgSuppliersDAO" %>
<title>Quản lý nhà cung cấp</title>
		<%@include file="/template/header.jsp"%>
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
	                <span style="color:red"><i><%=request.getAttribute("msg") %></i></span>
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
					                	<table id="datatable" class="table table-striped table-bordered dataTable no-footer">
										  <thead>
										  	<tr>
										  		<th>Mã</th>
										  		<th>Nhà cung cấp</th>
										  		<th>Contact name</th>
										  		<th>Địa chỉ</th>
										  		<th>Khu vực</th>
										  		<th>Số điện thoại</th>
										  		<th>Email</th>
										  		<th>Trạng thái</th>
										  		<th><a href="#" style="color: white;" data-toggle="modal" data-target="#modal-add"  > <i class="fa fa-plus" ></i> Thêm mới</a></th> 
										  		
										  	</tr>
										  </thead>
										   <tbody>
										  
										 
										  <%
										  PgSuppliersDAO dao = new PgSuppliersDAO();
										  List<PgSuppliers> list = new ArrayList<PgSuppliers>();
										  list = (ArrayList<PgSuppliers>) dao.getListSupplier();
										  if(list != null){
										  for(PgSuppliers sup:list){
										  %>
										  <tr>
										    <td><%=sup.getSupplierId()%></td>
										    <td><%=sup.getCompanyName()%></td>
										    <td><%=sup.getContactName()%></td>
										    <td><%=sup.getAddress()%></td>
										    <td><%=sup.getRegion()%></td>
										    <td><%=sup.getPhone()%></td>
										    <td><%=sup.getEmail()%></td>
										    <td>
										    	<%if (sup.getSupplierStatus()==1){ %>
										    		<input type="checkbox" checked disabled>
										    	<% }else{ %>
										    		<input type="checkbox" disabled>
										    	<% } %>
										    </td>
										    <td>
										    	<a href="#" data-toggle="modal" data-target="#modal-edit" class="btn btn-link" onclick="pass_update(<%=sup.getSupplierId()%>,'<%=sup.getCompanyName()%>','<%=sup.getContactName()%>','<%=sup.getAddress()%>','<%=sup.getRegion()%>','<%=sup.getPhone()%>','<%=sup.getEmail()%>',<%=sup.getSupplierStatus()%>)" > <i class="fa fa-edit"></i> Sửa</a>
										    	</td>
										  
										  </tr>
										  <%} }else{%>
										  	<tr>
										  		<td colspan="10"><p>Không có dữ liệu</p></td>
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
                          <h4 class="modal-title" id="myModalLabel">Thêm mới nhà cung cấp: </h4>
                        </div>
                        <form action="/manager/supplieraction?action=add" method="post">
                        <div class="modal-body">
                          	 <div class='col-sm-12'>
				                   <label >Tên nhà cung cấp :<div style="color: red;" id="mes1"></div></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="companyid1" class="form-control" name="companyname" placeholder="Tên nhân viên" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Contact name :<div style="color: red;" id="mes2"></div></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="contactid1" class="form-control" name="contactname" placeholder="last name nhân viên" />                            
				                        </div>
				                    </div>
				                </div>
			
							   <div class='col-sm-12'>
				                   <label >Địa chỉ :</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="address" placeholder="last name nhân viên" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
					              <div class='col-sm-12'>
				                   <label >Khu vực :</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="region" placeholder="last name nhân viên" />
				                            
				                        </div>
				                    </div>
				                </div>	
				                			                		                
			                 <div class='col-sm-12'>
				                    <label >Số điện thoại :<div style="color: red;" id="mes3"></div></label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" id="phoneid1" class="form-control" name="phone" placeholder="Số điện thoại" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Email :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="email" placeholder="Tên tài khoản" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Trạng thái:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="checkbox" name="status" />			                            
				                        </div>
				                    </div>
				                </div>        
                        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="reset" class="btn btn-info">Reset </button>
                          <button type="submit" class="btn btn-info">Save </button>
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
                          <h4 class="modal-title" id="myModalLabel">Chỉnh sửa thông tin nhà cung cấp :</h4>
                        </div>
                        <form action="/manager/supplieraction?action=edit" method="post">
                        <div class="modal-body">
                        	<div class="hd_id">
                        		<input type="hidden" id="eid" class="form-control" name="id" />
                        	</div>
                          	 <div class='col-sm-12'>
				                   <label >Tên nhà cung cấp : <div style="color: red;" id="mes4"></div></label>
				                    <div class="form-group ">
				                        <div class="form-group code" >
				                            <input id="companyid" class="form-control" name="companynameE" placeholder="Tên nhà cung cấp" />
				                            
				                        </div>
				                    </div>
				                </div>
			                 
				                <div class='col-sm-12'>
				                   <label >Contact name : <div style="color: red;" id="mes5"></div></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input id="contactid" type="text" class="form-control" name="contactE" placeholder="Contact name" />
				                            
				                        </div>
				                    </div>
				                </div>
			
							   <div class='col-sm-12'>
				                   <label >Địa chỉ :</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input id="addressid" type="text" class="form-control" name="addressE" placeholder="Địa chỉ" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
					              <div class='col-sm-12'>
				                   <label >Khu vực :</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input id="regionid" type="text" class="form-control" name="regionE" placeholder="Khu vực" />
				                            
				                        </div>
				                    </div>
				                </div>	
				                			                		                
			                 <div class='col-sm-12'>
				                    <label >Số điện thoại : <div style="color: red;" id="mes6"></div></label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input id="phoneid" type="text" class="form-control" name="phoneE" placeholder="Số điện thoại" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Email :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input id="emailid" type="text" class="form-control" name="emailE" placeholder="Email" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Trạng thái:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input id="statusid" type="checkbox" name="statusE" />			                            
				                        </div>
				                    </div>
				                </div>        
			                 
                        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="button" id="reset" class="btn btn-info">Reset </button>
                          <button type="submit" class="btn btn-info">Save </button>
                          
                        </div>
                    	</form>
                      </div>
                    </div>
            </div>
			<!--  Edit modal -->

        	<script type="text/javascript">
        		var message = "Không được để trống!!!"
			    function pass_update(id,company,contact,address,region,phone,email,status) {
			    	document.getElementById("eid").value = id;
			    	document.getElementById("companyid").value = company; 
			    	document.getElementById("contactid").value = contact; 
			    	document.getElementById("addressid").value = address;
			    	document.getElementById("regionid").value = region;
			    	document.getElementById("phoneid").value = phone;
			    	document.getElementById("emailid").value = email;
				    if(status === 1){
				    	document.getElementById("statusid").checked = true; 
					    } else {
					    	document.getElementById("statusid").checked = false; 
						    }
			    };
				document.getElementById("companyid1").addEventListener("blur",function(){
						if(this.value ===""){
					    		document.getElementById("mes1").innerHTML = message ;
							}else{
					    		document.getElementById("mes1").innerHTML = null ;
								}
					});
				document.getElementById("contactid1").addEventListener("blur",function(){
					if(this.value ===""){
				    		document.getElementById("mes2").innerHTML = message ;
						} else {
				    		document.getElementById("mes2").innerHTML = null ;
							}
				});
				document.getElementById("phoneid1").addEventListener("blur",function(){
					var patt = /[0-9]{10,11}/;
				    var result = patt.test(this.value);
					if(this.value ===""){
				    		document.getElementById("mes3").innerHTML = message ;
						} else {
							if(result == false){
							    document.getElementById("mes3").innerHTML = "Định dạng số điện thoại không đúng!!!";
							} else{
							    document.getElementById("mes3").innerHTML = null;
								}
						}
				});
				document.getElementById("companyid").addEventListener("blur",function(){
					if(this.value ===""){
				    		document.getElementById("mes4").innerHTML = message ;
						} else {
				    		document.getElementById("mes4").innerHTML = null ;
							}
				});
				document.getElementById("contactid").addEventListener("blur",function(){
					if(this.value ===""){
				    		document.getElementById("mes5").innerHTML = message ;
						} else {
				    		document.getElementById("mes5").innerHTML = null ;
							}
				});
				document.getElementById("phoneid").addEventListener("blur",function(){
					var patt = /[0-9]{10,11}/;
				    var result = patt.test(this.value);
					if(this.value ===""){
				    		document.getElementById("mes6").innerHTML = message ;
						} else {
							if(result == false){
							    document.getElementById("mes6").innerHTML = "Định dạng số điện thoại không đúng!!!";
							} else{
							    document.getElementById("mes6").innerHTML = null;
								}
						}
				});
			</script>
					<!-- ----------------------------------------------->
			    </div>
			    
			    <%@include file="/template/footer.jsp"%>
				<%@include file="/template/footname.jsp"%>
			
		      </div>
		    </div>

