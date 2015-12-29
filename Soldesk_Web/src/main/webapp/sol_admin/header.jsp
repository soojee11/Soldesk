<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>solProject admin</title>
    
	<script src="../test/js/test.js"></script>
	<script src="../js/myjs.js"></script>
	
    <!-- Bootstrap CSS -->    
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="../css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="../css/elegant-icons-style.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
  </head>

  <body>
  <!-- container section start -->
  <section id="container" class="">
      <!--header start-->
      
      <header class="header dark-bg">
            <!--logo start-->
            <a href="../adminIndex.do" class="logo">SolProject <span class="lite">Admin</span></a>
            <!--logo end-->
            <div class="nav search-row" id="top_menu">
            </div>
            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                    <!-- alert notification start-->
                    <li id="alert_notificatoin_bar" class="dropdown">
                        <ul class="dropdown-menu extended notification">
                            <div class="notify-arrow notify-arrow-blue"></div>
                        </ul>
                    </li>
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            
                            <!-- <span class="username">Jenifer Smith</span> -->
                            <% if((session.getAttribute("s_admin_mlevel")!=null) && (session.getAttribute("s_admin_id")!=null))
								{%>
									<span class="username"><strong>[<%=session.getAttribute("s_admin_id")%>]</strong> 님 환영합니다.</span>
								<%
								} %>
                            <!-- <b class="caret"></b> -->
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>
      </header>      
      <!--header end-->

      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_house_alt"></i>
                          <span>Member</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">                      
                          <li><a  href="../member/memlist.do">Delete&Level_Update</a></li>
                      </ul>
                  </li>  
				  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Board</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                      	  <li><a href="../bbs/noticeList.do">Notice</a></li>
                          <li><a  href="../bbs/bbsDel.do">Board_delete</a></li>
                      </ul>
                  </li>       
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>Q&A board</span>
                        	<span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a  href="../qna/qnaDel.do">Q&A_delete</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">                     
                      <a class="" href="javascript:;">
                          <i class="icon_piechart"></i>
                          <span>Lecture</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                        <ul class="sub">
                          <li><a  href="../player/readCateInfo.do">Lecture_insert</a></li>                          
                          <li><a  href="../player/updelete.do">Update&Delete</a></li>
                      </ul>
                  </li>
                   <li class="sub-menu">
                      <a class="" href="javascript:;">
                          <i class="icon_genius"></i>
                          <span>Test</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                        <ul class="sub">
                          <li><a  href="../test/testList.do">Test_insert</a></li>                    
                          <li><a  href="../test/testDelete.do">Update&Delete</a></li>
                      </ul>
                  </li>
                  <li>
                  	<a class="" href="../logout.do">
                          <i class="icon_genius"></i>
                          <span>Logout</span>
                    </a>
                  </li>
              
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
    
    