<%@page import="Project_VO.GameVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Project_DAO.GameDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>페이지 구성</title>    
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body {
		background-image: url("./game_img_upload/backgroundimg1.jpg");
		background-size: cover;
	}
</style>
<script type="text/javascript">

var page = 1;

$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) 
    {
     
    	 console.log( page++ );
      
      $.ajax({
			// 서버에 요청할 자원
			url : "productlist.jsp?pnum="+page,
			// 타입
			dataType : 'text',
			// 성공했다면
			success : function(data)
			{
				 $("#write_image").append(data);
			}
		}); // ajax end	
      
      
      
      
      
    }
});

</script>
	
<body>
		
        
    <div id="container">
    
        					
		             <%@include file="header_test.jsp" %> 		        
			
			
			
			
           <div id="contents" >
           
           	<a href="GameList.jsp">
	           	<div class="quiz" >
	           		<h3> 퀴 즈 </h3>
	           		<h3> 더 많은 퀴즈를 풀어볼까요?</h3>
	           	</div>
			</a>
			
			<div id="write_quiz">
			<%
			GameDAO dao = new GameDAO();
			
			ArrayList<GameVO> quiz = dao.main_gameList4();
			
			for(GameVO vo : quiz)
			{
				%>
				<div class="write_wrapper">
					<a href="GameDetailBf.jsp?g_no=<%=vo.getG_no() %>">
						<img class='pdimg' src='<%=vo.getG_file()%>'> <br>	
						<div class='hover_txt'>
							제목 : <%=vo.getG_title() %>
						</div>
					</a>
				</div>
				
			<%	
			}
			%>
                </div>
                <div class="quiz">	
	                 	<a href="postList.jsp">	           
			           		<h3> 그림 게시판 </h3>
			           		<h3> 더 많은 그림을 보고 싶은가요?</h3>
		           		</a>
		        </div>
                 <div id="write_image">            
	                 
	                 	<jsp:include page="productlist.jsp" flush="false">
	   				    	<jsp:param name="pnum" value="1" />			
						</jsp:include>
                	
                </div>
            </div>

           		
	              <!-- <div id="sidebar">
	             	
	             	<div>
	             	
	             	</div>
	                <div style="align-content: center;">
					

					
	                </div>
	                <div>
	                	<h4>일일 조회순</h4>
	                   	
                    </div>
	                
	                <div>
	           		 	<h4>일일 추천순 </h4>
           		 	        		 	
	           		 </div>
           		 	</div>  -->
	           		 
	        
          
    </div>
    
</body>

</html>