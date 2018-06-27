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
		session.setAttribute("spidx", id);
		
		  
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
					        			<label></label>
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
										<label></label>
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
								<h2>Ảnh sản phẩm:</h2>
					        	<div class="row">
					        		<div class="col-sm-12">
					        		<%
					        			List<String> lst = new ProductPictures().getLstPhoto(id);
					        			for (String path :lst)
					        			{
					        				%>
					        				<img alt="xxx" src="<%=path%>" width="150px;" data-toggle="modal" data-target="#modal-delete" onclick="pass_del('<%=path%>');">
					        				<%
					        			}
					        		%>
					        		</div>
					        	</div>
					        	<hr/>
				            	<div class="row">
					                <div class="col-sm-12">
					                	<fieldset class="form-group">
						                	<form action="/uploadphoto?action=add" method="post" enctype="multipart/form-data">
										         <div class="col-sm-6">
											         <a href="javascript:void(0)" class="btn btn-primary" onclick="$('#pro-image').click()">Chọn ảnh</a>
											        <input type="file" id="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>
										         </div>
										         <div class="col-sm-6">
										         	<button type="submit" style="float:right;" class="btn btn-primary">Upload</button>
										         </div>
									         </form>
									    </fieldset>
									    <div class="preview-images-zone">
									        
									    </div>
					                </div>
					                
					              <div class="clearfix"></div>
					              
	
							        <div class="ln_solid"></div>
							       
				            </div>

			        		</div>
					        <!-- ========================== style="display: none;" -->
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
                          <h4 class="modal-title" id="myModalLabel">Xác nhận xóa ảnh</h4>
                        </div>
                        
                        <div class="modal-footer">
                        	<form action="/uploadphoto?action=delete" method="post">
                        		<div class="edit">
                        			<input type="hidden" id="pathx" name="path" />
                        			<input type="hidden" id="did" name="did" value="<%=id%>" />
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
		    	
		    	document.getElementById("pathx").value = id;
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
