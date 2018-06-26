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
		
		  
	%>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Tải ảnh sản phẩm</title>
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
	              	<h2><strong>Tải ảnh sản phẩm</strong></h2>
	              	<hr/>
	                <span style="color:red"><i>${msg}</i></span>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Thông tin sản phẩm</h2>
		                    
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
												Mã sản phẩm: <br/>
												Tên sản phẩm: <br/>
												Số lượng sản phẩm: <br/>
												
											</div>
					        			</div>
					        			<div class="col-sm-6" style=" padding-left: 30px;">
					        			<%
											try{
												PgProducts tl = new ProductDAO().getPgProductsByID(id);
					        			%>
					        				<%=id %><br/>
					        				<%=tl.getProductName() %> <br/>
					        				<%=tl.getQuantity() %> <br/>
					        				
					        			</div>
					        		</div>
					        		<div class="col-sm-6" style="padding-left: 53px;">
											<label>Thông tin khách hàng:</label>
										<div class="clearfix"></div>
					        			<div class="col-sm-4" >
											<div style="float:right;">
												Giá nhập: <br/>
												Giá bán: <br/>
												Cập nhật: <br/>
												
											</div>
					        			</div>
					        			<div class="col-sm-6" style=" padding-left: 30px;">
					        				<%=tl.getUnitOrder() %> <br/>
					        				<%=tl.getUnitPrice() %> <br/>
					        				<%=tl.getModifiedTime() %> <br/>
					        				<%}
					        			catch(Exception e)

					        			{
					        				response.sendRedirect("/manager/index.jsp");
					        			}%>
					        			</div>
					        		</div>
					        		
					        	</div>
					        	<br/>
					        	<div class="ln_solid"></div>
								<h2>Danh sách hàng hóa:</h2>
					        	
				            	<div class="row">
					                <div class="col-sm-12">
					                	// vùng ảnh ở đây
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
