/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.2.10.v20150310
 * Generated at: 2018-06-20 04:20:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class NewFile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/template/footname.jsp", Long.valueOf(1529466780990L));
    _jspx_dependants.put("/template/footer.jsp", Long.valueOf(1529466780988L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("  \t\t<title>Pain And Gain| Trang chủ</title>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body >\r\n");
      out.write("\t\t\t<div class=\"nav-md\">\r\n");
      out.write("\t\t    <div class=\"container body\">\r\n");
      out.write("\t\t      <div class=\"main_container\"> \r\n");
      out.write("\t\t       \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div class=\"right_col\" role=\"main\">\r\n");
      out.write("\t\t\t\t\t<!-- ----------------------------------------------->\r\n");
      out.write("\t\t\t\t\t<!-- đay là phần nội dung -->\r\n");
      out.write("\t\t\t\t\t<h2>đay là nội dung trang chủ</h2>\r\n");
      out.write("\t\t\t\t\t<button class=\"btn btn-primary\"><a href=\"login.jsp\">Nhấn vào đây để vào login ==> manager</a></button>\r\n");
      out.write("\t\t\t\t\t<br/>\r\n");
      out.write("\t\t\t\t\t<button class=\"btn btn-primary\">Nhấn vào đây để sang phần client</button>\r\n");
      out.write("\t\t\t\t\t<!-- ----------------------------------------------->\r\n");
      out.write("\t\t\t    </div>\r\n");
      out.write("\t\t\t    \r\n");
      out.write("\t\t\t    ");
      out.write("\r\n");
      out.write("\t<!-- =================================================================================================-->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!-- =================================================================================================-->\r\n");
      out.write("\t\t\t<script src=\"/resources/vendors/jquery/dist/jquery.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t    <!-- Bootstrap ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(" -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/bootstrap/dist/js/bootstrap.min.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- FastClick -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/fastclick/lib/fastclick.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- NProgress -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/nprogress/nprogress.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- ECharts -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/echarts/dist/echarts.min.js\"></script>\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/echarts/map/js/world.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t   \r\n");
      out.write("\t\t    <!-- Chart.js -->\r\n");
      out.write("    \t\t<script src=\"/resources/vendors/Chart.js/dist/Chart.min.js\"></script>\r\n");
      out.write("\t\t   \r\n");
      out.write("\t\t    <!-- gauge.js -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/gauge.js/dist/gauge.min.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- bootstrap-progressbar -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- iCheck -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/iCheck/icheck.min.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- Skycons -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/skycons/skycons.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- Flot -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/Flot/jquery.flot.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <script src=\"/resources/vendors/Flot/jquery.flot.pie.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <script src=\"/resources/vendors/Flot/jquery.flot.time.js\"></script>\r\n");
      out.write("\t\t   \r\n");
      out.write("\t\t    <script src=\"/resources/vendors/Flot/jquery.flot.stack.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <script src=\"/resources/vendors/Flot/jquery.flot.resize.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <script src=\"/resources/vendors/DateJS/build/date.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- Flot plugins -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/flot.orderbars/js/jquery.flot.orderBars.js\"></script>\r\n");
      out.write("\t\t   \r\n");
      out.write("\t\t    <script src=\"/resources/vendors/flot-spline/js/jquery.flot.spline.min.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <script src=\"/resources/vendors/flot.curvedlines/curvedLines.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <!-- JQVMap -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/jqvmap/dist/jquery.vmap.js\"></script>\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/jqvmap/dist/maps/jquery.vmap.world.js\"></script>\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t   \r\n");
      out.write("\t\t    <!-- bootstrap-daterangepicker -->\r\n");
      out.write("\t\t    <script src=\"/resources/vendors/moment/min/moment.min.js\"></script>\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t    <script src=\"/resources/vendors/bootstrap-daterangepicker/daterangepicker.js\"></script>\r\n");
      out.write("\t\t    \t    \r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net/js/jquery.dataTables.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-buttons/js/buttons.print.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js\"></script>\r\n");
      out.write("\t\t     <script src=\"/resources/vendors/datatables.net-scroller/js/dataTables.scroller.min.js\"></script>\r\n");
      out.write("\t\t   \r\n");
      out.write("\t\t\t<!-- Custom Theme Scripts -->\r\n");
      out.write("\t\t    <script src=\"/resources/build/js/custom.min.js\"></script>\r\n");
      out.write("\t\t     \r\n");
      out.write("\t\t    <script src=\"/resources/build/js/jquery.boot-tab-slider.min.js\"></script>\r\n");
      out.write("\t\t    ");
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t    \t<!-- footer content -->\r\n");
      out.write("\t        <footer>\r\n");
      out.write("\t          <div class=\"pull-right\">\r\n");
      out.write("\t            Phần mềm bán hàng xxx!\r\n");
      out.write("\t          </div>\r\n");
      out.write("\t          <div class=\"clearfix\"></div>\r\n");
      out.write("\t        </footer>\r\n");
      out.write("     ");
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t      </div>\r\n");
      out.write("\t\t    </div>\r\n");
      out.write("    \t</div>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
