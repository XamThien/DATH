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
  		<title>Quản lý danh mục sản phẩm</title>
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
	              	<h2><strong>Quản lý danh mục sản phẩm</strong></h2>
					<span style="color:red"><i>${msg }</i></span>
	              	<hr/>
	               
	                <a href="#" style="color: #2c6c8a;" data-toggle="modal" data-target="#modal-add"><button><i class="fa fa-plus" ></i> Thêm mới</button> </a>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Danh mục sản phẩm</h2>
		                    
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
										  		<th>Mã danh mục</th>
										  		<th>Tên danh mục</th>
										  		<th>Mô tả</th>
										  		<th>Sort index</th>
										  		<th>Trạng thái</th>
												<th>Danh sách sản phẩm</th>
										  		<th>Tùy chọn</th> 
										  	</tr>
										  </thead>
										   <tbody>
										  <%
							                	ArrayList <PgCategories> list = (ArrayList<PgCategories>)request.getAttribute("result");
						 	                	if (list!=null)
						 	                	{
						 	                		for (PgCategories catg : list)
						 	                		{
						 	                		
							                %>
										 
										  	
										  <tr>
										    <td><%=catg.getCategoryId() %></td>
										    <td><%=catg.getCategoryName() %></td>
										    <td><%=catg.getDescription() %></td>
										    <td><%=catg.getSortIndex() %></td>
										    <% if (catg.getCategoryStatus()==1) {
			                                        out.print("<td>Active</td>");
			                                    } else {
			                                        out.print("<td>InActive</td>");
			                                }%>
											<td><a href="/manager/sanpham.jsp?id=<%=catg.getCategoryId()%>" class="btn btn-link">Danh sách sản phẩm</a></td>
										    <td>
										    	<a href="#" onclick="pass_update(<%=catg.getCategoryId() %>,'<%=catg.getCategoryName() %>','<%=catg.getDescription() %>',<%=catg.getSortIndex() %>,<%=catg.getCategoryStatus() %>)" data-toggle="modal" data-target="#modal-edit" class="btn btn-link"> <i class="fa fa-edit"></i> Sửa</a>
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
                          <h4 class="modal-title" id="myModalLabel">Thêm mới danh mục sản phẩm: </h4>
                        </div>
                        <form action="/categoryac?action=add" method="post">
                        <div class="modal-body">
                          	 <div class='col-sm-12'>
				                   <label >Tên danh mục: <span style="color: red;" id="mes1"></span></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <input type="text" id="aname" class="form-control" name="name" placeholder="Tên danh mục" />
				                            
				                        </div>
				                    </div>
				                </div>
				                
				                <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                            <textarea rows="4" id="adescrip" name="descrip" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
				                        </div>
				                    </div>
				                </div>
				                <div class='col-sm-12'>
				                   <label >Sort index: <span style="color: red;" id="mes2"></span></label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                            <input type="number" min=0 id="asort" class="form-control" value="0" name="sort" placeholder="Sort index" />
				                        </div>
				                    </div>
				                </div>
				        </div>
                        <div class="clearfix"></div>

                        <div class="modal-footer">
                         
                          <button type="reset" class="btn btn-info">Làm mới </button>
                          <button type="submit" onclick="checkadd()" class="btn btn-info">Lưu </button>
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
                          <h4 class="modal-title" id="myModalLabel">Sửa thông tin danh mục:</h4>
                        </div>
                        <form action="/categoryac?action=edit" method="post">
                        <div class="modal-body">
                        	<div class="hd_id">
                        		<input type="hidden" id="eid" class="form-control" name="id" />
                        	</div>
                          	 <div class='col-sm-12'>
				                   <label >Tên danh mục: <span style="color: red;" id="mes3"></span></label>
				                    <div class="form-group ">
				                        <div class="form-group code" >
				                            <input id="ename" class="form-control" name="name" placeholder="Tên danh mục" />
				                            
				                        </div>
				                    </div>
				                </div>
			                 
			                 <div class='col-sm-12'>
				                   <label >Mô tả:</label>
				                    <div class="form-group" >
				                        <div class="form-group" >
				                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
				                            <textarea id="edescrip" name="descrip" rows="4" cols="50" style="width: 450px;" placeholder="Mô tả..."></textarea>
				                        </div>
				                    </div>
				             </div>
				             <div class='col-sm-12'>
			                   <label >Sort index: <span style="color: red;" id="mes4"></span></label>
			                    <div class="form-group" >
			                        <div class="form-group" >
			                            <!-- <input type="" class="form-control" name="name" placeholder="last name nhân viên" />  -->
			                            <input type="number" min=0 id="esort" class="form-control" name="sort" placeholder="Sort index" />
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
                          <button type="submit" onclick="checkedit()" class="btn btn-info">Cập nhật </button>
                          
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
        	var message = "Không được để trống!!!"
			    function pass_del(id) {
			    	
			    	document.getElementById("txtid").value = id;
			    };
			    function pass_update(id,name,descript,sort,status) {
			    	document.getElementById("eid").value = id; 
			    	document.getElementById("ename").value = name; 
			    	document.getElementById("edescrip").value = descript; 
			    	document.getElementById("esort").value = sort;
			    	if(status==1){
			    		document.getElementById("estatus").value="1";
			    	} else {document.getElementById("estatus").value="0";}
			    	
			    };
			    document.getElementById("aname").addEventListener("blur",function(){
					if(this.value ===""){
				    		document.getElementById("mes1").innerHTML = message ;
						}else{
				    		document.getElementById("mes1").innerHTML = null ;
							}
				});
			    document.getElementById("ename").addEventListener("blur",function(){
					if(this.value ===""){
				    		document.getElementById("mes3").innerHTML = message ;
						}else{
				    		document.getElementById("mes3").innerHTML = null ;
							}
				});
			    document.getElementById("asort").addEventListener("blur",function(){
					if(this.value ===""){
				    		document.getElementById("mes2").innerHTML = message ;
						}else{
				    		document.getElementById("mes2").innerHTML = null ;
							}
				});
			    document.getElementById("esort").addEventListener("blur",function(){
					if(this.value ===""){
				    		document.getElementById("mes4").innerHTML = message ;
						}else{
				    		document.getElementById("mes4").innerHTML = null ;
							}
				});
			  
			    function checkadd(){
			    	if(document.getElementById("aname").value==""){
			    		alert("Bạn chưa điền tên danh mục sản phẩm.");
			    		return false;
			    	} else if (document.getElementById("asort").value==""){
			    		alert("Bạn chưa điền mã sắp xếp danh mục sản phẩm.");
			    		return false;
			    	}
			    	return true;
			    }
			    function checkedit(){
			    	if(document.getElementById("ename").value==""){
			    		alert("Bạn chưa điền tên danh mục sản phẩm.");
			    		return false;
			    	} else if (document.getElementById("esort").value==""){
			    		alert("Bạn chưa điền mã sắp xếp danh mục sản phẩm.");
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
