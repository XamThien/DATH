			<%
				HttpSession sessi = request.getSession();
			    if(sessi.getAttribute("login")==null)
			    {
			    	response.sendRedirect(request.getContextPath() +"/login.jsp");
			    	
			    }
			%>	
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		    <!-- Meta, title, CSS, favicons, etc. -->
		    <meta charset="utf-8"/>
		    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		    <meta name="viewport" content="width=device-width, initial-scale=1"/>
			<link rel="icon" href="/resources/production/images/favicon.ico" type="image/ico" />

	
			
		    <!-- Bootstrap -->

		    <link rel="stylesheet" href="/resources/vendors/bootstrap/dist/css/bootstrap.min.css">
		    
		    <!-- Font Awesome -->
		    <link rel="stylesheet" href="/resources/vendors/font-awesome/css/font-awesome.min.css">
		    
		    <!-- NProgress -->
		    <link rel="stylesheet" href="/resources/vendors/nprogress/nprogress.css">
		    
		    <!-- iCheck -->
		    <link rel="stylesheet" href="/resources/vendors/iCheck/skins/flat/green.css">
		    <!-- iCheck -->
		    <link rel="stylesheet" href="/resources/vendors/iCheck/skins/flat/green.css">
		       <!-- bootstrap-wysiwyg -->
		     <link rel="stylesheet" href="/resources/vendors/google-code-prettify/bin/prettify.min.css" >
		    <!-- Select2 -->
		     <link rel="stylesheet" href="/resources/vendors/select2/dist/css/select2.min.css" >
		    <!-- Switchery -->
		     <link rel="stylesheet" href="/resources/vendors/switchery/dist/switchery.min.css" >
		    <!-- starrr -->
		     <link rel="stylesheet" href="/resources/vendors/starrr/dist/starrr.css" >
		     <!-- Datatables -->
		    <link rel="stylesheet" href="/resources/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" >
		    <link rel="stylesheet" href="/resources/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" >
		    <link rel="stylesheet" href="/resources/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" >
		    <link rel="stylesheet" href="/resources/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" >
		    <link rel="stylesheet" href="/resources/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" >
			
		    <!-- bootstrap-progressbar -->
		    <link rel="stylesheet" href="/resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css">
		   
		    <!-- JQVMap -->
    		
    		<link rel="stylesheet" href="/resources/vendors/jqvmap/dist/jqvmap.min.css">
		    
		    
		    <!-- bootstrap-daterangepicker -->
		    <link rel="stylesheet" href="/resources/vendors/bootstrap-daterangepicker/daterangepicker.css">
			<link href="/resources/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

		    <!-- Custom CSS -->
			<link href="/resources/css/customCss/helper.css" rel="stylesheet">
    		<link href="/resources/css/customCss/style.css" rel="stylesheet">
			
		    <!-- Custom Theme Style -->
		    <link rel="stylesheet" href="/resources/build/css/custom.min.css">
		    
		    <link rel="stylesheet" href="/resources/build/css/configstyle.css">
		    
		    <link rel="stylesheet" href="/resources/build/css/jquery.boot-tab-slider.min.css">