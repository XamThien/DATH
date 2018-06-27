<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.PgCategories" %>
<%@ page import="DAO.CategoryDAO" %>
<%@ page import="java.util.List" %>
<div class="col-md-3 left_col">
	          <div class="left_col scroll-view">
	            <div class="navbar nav_title" style="border: 0;">
	              
	              <img src="/resources/production/images/Pain_&_Gain_Logo.png" class="site_title"></img>
	              
	            </div>
	
	            
	
	            <!-- sidebar menu -->
	            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	              <div class="menu_section">
	                <h3>Chức năng:</h3>
	                <ul class="nav side-menu">
	                  <li><a href="/manager/home"><i class="fa fa-home"></i> Trang chủ </a></li>
	                 
	                  <li><a><i class="fa fa-cube"></i>Quản lý sản phẩm <span class="fa fa-chevron-down"></span></a>
	                    	<ul class="nav child_menu">
		                      <li><a href="/danhmuc">Quản lý danh mục</a></li>
		                      <li><a href="/manager/hanghoa.jsp">Quản lý hàng hóa</a></li>
		                      <li><a href="/manager/suppliers.jsp">Quản lý nhà cung cấp</a></li>
		                    </ul>
	                  </li>
	                  <li><a><i class="fa  fa-file-text-o"></i>Quản lý đơn hàng <span class="fa fa-chevron-down"></span></a>
	                    	<ul class="nav child_menu">
		                      <li><a href="/manager/hoadon.jsp?stt=1">Đơn hàng đang tiếp nhận</a></li>
		                      <li><a href="/manager/hoadon.jsp?stt=2">Đơn hàng đang giao</a></li>
							  <li><a href="/manager/hoadon.jsp?stt=3">Đơn hàng hoàn thành</a></li>
		                      <li><a href="/manager/hoadon.jsp?stt=0">Đơn hàng hủy</a></li>
		                    </ul>
	                  </li>
	                  <li><a><i class="fa  fa-gift"></i>Quản lý khuyến mại <span class="fa fa-chevron-down"></span></a>
	                    	<ul class="nav child_menu">
	                    		<li><a href="#">Thêm khuyến mại</a>
		                      		<div class="navx">
										<ul>
											
											<%
									            List<PgCategories> catelst = new CategoryDAO().getActivePgCategories();
									            for(PgCategories catex : catelst)
								                {
								            %>
									            <li><a href="/manager/khuyenmai.jsp?id=<%=catex.getCategoryId()%>"><%=catex.getCategoryName() %></a></li>
									       <%} %>
										</ul>
									</div>
								</li>
		                   		<li><a href="/manager/danhsachkhuyenmai.jsp">Hủy khuyến mại</a></li>
		                    </ul>
	                  </li>
	                  <li><a href="/manager/nhanvien.jsp"><i class="fa fa-users"></i>Quản lý tài khoản </a></li>
	                  <li><a ><i class="fa fa-sitemap"></i>Quản lý phân quyền<span class="fa fa-chevron-down"></span></a>
	                  	<ul class="nav child_menu">
		                      <li><a href="/manager/phanquyen">Phân quyền</a></li>
		                      <li><a href="/manager/chucnang">Quản lý danh mục chức năng</a></li>
		                    </ul>
	                  </li>
	                </ul>
	              </div>

	            </div>
	            <!-- /sidebar menu -->
	          </div>
	        </div>
      