<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>Thêm khuyến mại</title>
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
	              	<h2><strong>Thêm khuyến mại</strong></h2>
	              	<hr/>
	                <span style="color:red"><i>${msg}</i></span>
	                <!-- show table-->
	                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Danh sách hàng hóa</h2>
		                    
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                  	<!-- search-->
					        <!-- ========================== -->
					        <div class="container">
				            	<div class="row">
					                <div class="col-md-9 col-sm-9 col-xs-12">
					                	<div class="box-header with-border">
					                        <input type="text" name="txtsearchproc" class="form-control" placeholder="Tìm kiếm sách" id="txtsearch1" onkeyup ="showHint(this.value);">
					                    </div>
					                    <div class="box-body suggest" id="sugges1">
					                        <ul class="list-suggest" id="result1"></ul>
					                    </div>
					                	<table id= "table" class="table table-striped table-bordered dataTable no-footer">
										  <thead>
										  	<tr>
										  		<th></th>
										  		<th>Ảnh</th>
										  		<th>Mã sản phẩm</th>
										  		<th>Tên sản phẩm</th>
										  		
										  		
										  		

										  		
										  	</tr>
										  </thead>
										   <tbody id="muontradetail" onload="editBill();"></tbody>
										</table>
					                </div>
					                <div class="col-md-3 col-sm-3 col-xs-12">
					                	<div class="x_panel">
					                		<div class="x_title">
							                  	<h4><font style="vertical-align: inherit;">
							                  			Thông tin khuyến mại: 
							                  				
							                  	</font></h4>
							                  
							                  <div class="clearfix"></div>
							                </div>
							                <div class="x_content">

							                	<div class='col-sm-12'>
								                    <label >Khuyến mại :</label>
								                    <div class="form-group">
								                        <div class="form-group" >
								                            <input type="text" id="kmvalue" class="form-control" name="kmvalue" placeholder="Giá trị khuyến mại" required="required" />
								                        </div>
								                    </div>
								                </div>
							                	<div class='col-sm-12'>
								                    <label >Thời gian bắt đầu :</label>
								                    <div class="clearfix"></div> 
								                    <div >
								                    	<div class="form-group">
												            <div class=" xdisplay_inputx form-group has-feedback">
								                                <input type="text" class="form-control " aria-describedby="inputSuccess2Status" id="single_cal4" required="required" />
								                                <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
								                            </div>
									                    </div>
								                    </div>
								                </div>
								                <div class="clearfix"></div> 
							                	<div class='col-sm-12'>
								                    <label >Thời gian kết thúc :</label>
								                    <div class="clearfix"></div> 
								                    <div >
								                    	<div class="form-group">
											                <div class=" xdisplay_inputx form-group has-feedback">
								                                <input type="text" class="form-control " id="single_cal3" required="required" />
								                                <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
								                                
								                              </div>
									                    </div>
								                    </div>
								                </div>
							                </div>
					                	</div>
					                	
					                </div>
					                <div class="clearfix"></div>      
							       
				            </div>
				            <button type="button" style="float: right;width: 91px;margin-right: 26px;" class="btn btn-primary" onclick="saveBill();"> Lưu</button>
			        		</div>
					        <!-- ========================== -->
					      </div>
	             </div>
				 </div>
              </div>
            </div>



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
