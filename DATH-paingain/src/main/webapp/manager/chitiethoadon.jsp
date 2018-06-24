<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		//stt là trạng thái hiện tại
		int stt = Integer.parseInt(request.getParameter("stt"));
		String title ="";
		if(stt==1) {title = "đang xử lý tiếp nhận";}
		if(stt==2) {title = "đang giao";}
		if(stt==3) {title = "hoàn thành";}
		if(stt==0) {title = "hủy";}
		 Map<Integer,String> tt=new HashMap<Integer,String>();  
		 tt.put(0,"Hủy");  
		 tt.put(1,"Đang xử lý");  
		 tt.put(2,"Đang giao hàng");  
		 tt.put(3,"Hoàn thành");  
		  
	%>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Chi tiết đơn hàng <%=title %></title>
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
	              	<h2><strong>Chi tiết đơn hàng <%=title %></strong></h2>
	              	<hr/>
	                <span style="color:red"><i>${msg}</i></span>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Thông tin đơn hàng</h2>
		                    
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                  	<!-- search-->
					        <!-- ========================== -->
					        <div class="container">
					        	<br/>
					        	<div class="row">
					        		<div class="col-sm-6" style="border-right: 1px solid; padding-left: 53px;">
					        			<label>Thông tin khách hàng:</label>
										<div class="clearfix"></div>
					        			<div class="col-sm-4" >
											<div style="float:right;">
												Tên khách hàng: <br/>
												Tên người nhận: <br/>
												Địa chỉ nhận: <br/>
												SĐT người nhận:
											</div>
					        			</div>
					        			<div class="col-sm-6">
					        			<%
					        				PgOrders or = new PgOrdersDAO().getPgOrdersByID(id);
					        			%>
					        				<%=or.getPgUsersByCustomerId().getFirstName() %> <%=or.getPgUsersByCustomerId().getLastName() %> <br/>
					        				<%=or.getShipName() %> <br/>
					        				<%=or.getShipAddress() %> <br/>
					        				<%=or.getShipPhone() %>
					        			</div>
					        		</div>
					        		<div class="col-sm-6" style="padding-left: 53px;">
					        			<form action="#" method="post">
					        			<label>Cập nhật đơn hàng:</label>
										<div class="clearfix"></div>
					        			
					        				<div class="col-sm-3">
					        					<br/>
					        					<div style="float:right;">Trạng thái</div>
					        				</div>
					        				<div class="col-sm-6">
					        					<br/>
					        					<select  class="form-control"  name="tt" <%=(stt==0 || stt==3)? "disabled='disabled'":"" %>>
												
				                            	<%
				                            	if(stt==0)
												{
												%>
				                            	<option value="0">Hủy</option>
				                            	<%
												}
												else
				                            	for(Map.Entry m:tt.entrySet()){  
				                            		if((int)m.getKey()>=stt)
				                            		{
				                            	%>
				                            	<option value="<%=m.getKey()%>"><%=m.getValue() %></option>
				                            	<%}} %>
				                            	<option value="0">Hủy</option>
				                            </select>
											<div class="clearfix"></div>
											<button type="button" style="margin-top: 7px;" class="btn btn-primary" <%=(stt==0 || stt==3)? "disabled='disabled'":"" %>>Cập nhật</button>
					        				</div>
					        			
					        			
					        			</form>	
					        		</div>
					        	</div>
					        	<br/>
					        	<div class="ln_solid"></div>
								<h2>Danh sách hàng hóa:</h2>
					        	
				            	<div class="row">
					                <div class="col-sm-12">
					                	<table id= "table" class="table table-striped table-bordered dataTable no-footer">
										  <thead>
										  	<tr>
										  		<th>STT</th>
										  		<th>Mã sản phẩm</th>
										  		<th>Tên sản phẩm</th>
										  		<th>Số lượng</th>
										  		<th>Đơn giá bán</th> 
										  		<th>Giảm giá</th> 
										  		<th>Thành tiền</th> 
										  		
										  	</tr>
										  </thead>
										   <tbody>
										  <%
										  	List<PgOrderDetails> lst = (List<PgOrderDetails>) new OrderDatail().getAllPgOrderDetails(id);
										  	if(lst!= null)
										  	{
										  		int dem=1;
										  		for(PgOrderDetails tl :lst)
										  		{ 
										  			
										  %>
										 
										  	
										  <tr>
										    <td><%=dem %></td>
										    <td><%=tl.getPgProducts().getProductId() %></td>
										    <td><%=tl.getPgProducts().getProductName() %></td>
										    <td><%=tl.getAmount() %></td>
										    <td><%=tl.getUnitPrice() %></td>
										    <td><%=tl.getUnitSale() %></td>
										    
										    <td>tiền</td>
										  </tr>
										  
										  <%
										  		dem++;}}
										  	else
										  	{
										  		out.println("Không có dữ liệu hiển thị");
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
                          <h4 class="modal-title" id="myModalLabel">Thêm mới sách mượn: </h4>
                        </div>
                        <form action="#" method="post">
                        <div class="modal-body">
                          	 <div class='col-sm-12'>
				                   <label >Tên sách :</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="name" placeholder="Tên sách" required="required"/>
				                            
				                        </div>
				                    </div>
				                </div>
			                 <div class='col-sm-12'>
				                    <label >Tác giả :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="phone" placeholder="Tác giả" required="required" />
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Nhà xuất bản :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="username" placeholder="Nhà xuất bản" required="required"/>
				                            
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                    <label >Số lượng :</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" class="form-control" name="pass" placeholder="Số lượng" required="required"/>
				                            
				                        </div>
				                    </div>
				                </div>
				                
			                 
                        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                          <button type="reset" class="btn btn-info">Làm mới </button>
                          <button type="submit" onclick="alert('Chức năng đang trong thời gian hoàn thiện, Ahihi');" class="btn btn-info">Lưu </button>
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
                          <h4 class="modal-title" id="myModalLabel">Chỉnh sửa thông tin sách mượn :</h4>
                        </div>
                        <form action="trasach?action=edit" method="post">
                        <div class="modal-body">
                        	<div class="hd_id">
                        		<input type="hidden" id="pid" class="form-control" name="pid" />
                        		<input type="hidden" id="sid" class="form-control" name="sid" />
                        	</div>
                          	 <div class='col-sm-12'>
				                   <label >Tên sách :</label>
				                    <div class="form-group ">
				                        <div class="form-group code" >
				                            <input id="name" class="form-control" name="name" placeholder="Tên sách" disabled="disabled" />
				                            
				                        </div>
				                    </div>
				                </div>
			                 <div class='col-sm-12'>
				                    <label >Tác giả:</label>
				                    <div class="form-group">
				                        <div class="form-group" >
				                            <input type="text" id="tg" class="form-control" name="author" placeholder="Nhà xuất bản" disabled="disabled"/>
				                            
				                        </div>
				                    </div>
				                </div>
			                 <div class='col-sm-12'>
				                <div class="form-group status">
					                <label >Số lượng :</label>
					                <div class="form-group ">
				                        <div class="form-group code" >
				                            <input id="sl" type="number" class="form-control" name="sl" placeholder="Số lượng" />
				                            
				                        </div>
				                    </div>
				                            
				                </div>
			                 </div>
			                 <div class='col-sm-12'>
				                <div class="form-group status">
					                <label >Trạng thái :</label>
					                <div class="form-group ">
				                        <div class="form-group code" >
				                            
				                            <select class="form-control" name="tt">
												  <option value="1">Chưa trả sách</option>
												  <option value="0">Đã trả đủ sách</option>
											</select>
				                        </div>
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
			<!--  Edit modal -->
            <!-- Delete modal -->
            <div class="modal fade bs-example-modal-lg" id="modal-delete" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm modal-delete">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Xác nhận trả đủ sách:</h4>
                        </div>
                        
                        <div class="modal-footer">
                        	
                        		
                          		<button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                          		<a  href="trasach?action=full&did=<%=id %>" class="btn btn-info">Xác nhận </a>
                          
                          	
                        </div>

                      </div>
                    </div>
            </div>
			<!--  Delete modal -->
			<script type="text/javascript">
			    
			    function pass_update(pid,sid,name,tg,sl) {
			    	document.getElementById("pid").value = pid; 
			    	document.getElementById("sid").value = sid; 
			    	document.getElementById("name").value = name; 
			    	document.getElementById("tg").value = tg; 
			    	document.getElementById("sl").value = sl; 
			    	
			    	
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
