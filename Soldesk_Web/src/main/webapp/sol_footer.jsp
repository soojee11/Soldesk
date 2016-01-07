<%@ page contentType="text/html; charset=UTF-8"%>
			</div>
		<!--end: Container-->
	
	</div>
	<!-- end: Wrapper  -->	
	
	
	<!-- start: Copyright -->
	<div id="copyright">

		<!-- start: Container -->
		<div class="container">

			<p>
				&copy; 2015, soldesk created by no.5&nbsp;&nbsp;&nbsp;<a href="javascript:showAdmin();"><strong>관리자 페이지</strong></a>
			</p>
			<script>
			function showAdmin() {//아이디중복확인
				var sx = parseInt(screen.width);//팝업창 나타내는 위치
			    var sy = parseInt(screen.height);
			    var x = (sx / 2) - 600;
			    var y = (sy / 2) - 350;
			    
			    var win = window.open("http://172.16.6.175:9090/solproject/sol_admin/login.do", "", "width=1200, height=700");
			    win.moveTo(x, y);//화면이동
			 }//end
			</script>
		</div>
		<!-- end: Container  -->
		
	</div>	
	<!-- end: Copyright -->

<!-- start: Java Script -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../sol_js/jquery-1.8.2.js"></script>
<script src="../sol_js/bootstrap.js"></script>
<script src="../sol_js/flexslider.js"></script>
<script src="../sol_js/carousel.js"></script>
<script src="../sol_js/jquery.cslider.js"></script>
<script src="../sol_js/slider.js"></script>
<script defer="defer" src="../sol_js/custom.js"></script>
<!-- end: Java Script -->

</body>
</html>