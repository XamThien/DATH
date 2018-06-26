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
  		<title>Danh sách khuyến mại</title>
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
	              	<h2><strong>Dừng khuyến mại</strong></h2>
	              	<span style="color:red"><i>${msg}</i></span>
	              	<hr/>
	                
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới</button> </a>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Danh sách khuyến mại</h2>
		                    
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
										  		<th>Mã sản phẩm</th>
										  		<th>Tên sản phẩm</th>
										  		<th>Danh mục</th>
										  		<th>Thời gian bắt đầu</th>
										  		<th>Thời gian kết thúc</th>
										  		<th>Giá trị</th> 
										  		<th>Trạng thái</th>
										  		<th>Action</th>
										  		
										  	</tr>
										  </thead>
										  <tbody>
										  <%
										  List<PgProductSales> lst = new ProductSalesDAO().getAllPgProducts();
										  	int dem=1;
											 for (PgProductSales pr : lst)
											 {
												
										  			
										  		
										  %>
											  <tr>
											    <td><%=dem %></td>
											    <td><%=pr.getPgProducts().getProductId() %></td>
											    <td><%=pr.getPgProducts().getProductName() %></td>
											    <td><%=pr.getPgProducts().getPgCategories().getCategoryName() %></td>
											    <td><%=pr.getStartDate() %></td>
											    <td><%=pr.getEndDate() %></td>
											    <td><%=pr.getSaleValue() %></td>
											    
											    <% if (pr.getSalesStatus()==1) {
				                                        out.print("<td>Active</td>");
				                                    } else {
				                                        out.print("<td>InActive</td>");
				                                }
				                                %>
											    <td>
											    	<a href="#" data-toggle="modal" data-target="#modal-delete" class="btn btn-link"  onclick="pass_del(<%=pr.getSaleId()%>);"><%=(pr.getSalesStatus()==1)?"Inactive":"Active" %></a>
										    		
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
                        	<form action="/khuyenmai?action=edit" method="post">
                        		<div class="edit">
                        			<input type="hidden" id="did" name="did" />
                        		</div>
                          		<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                          		<button type="submit" class="btn btn-info">Xác nhận</button>
                          
                          	</form>
                        </div>

                      </div>
                    </div>
            </div>
			<!--  Delete modal -->
			
        	<script type="text/javascript">
	        	 
			    function pass_del(id) {
			    	
			    	document.getElementById("did").value = id;
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
