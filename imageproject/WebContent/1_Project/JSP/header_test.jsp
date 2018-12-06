<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="./css/main.css">
<style>
	
	
    
</style>
<script type="text/javascript">
<!--

//-->




function searching()
{
	var a = document.getElementById('search_text').value;
	var b = document.getElementById('search_type').value;

	location.href="postList_search.jsp?search="+a+"&type="+b;

}


function Enter_Check(){
if(event.keyCode == 13){
	searching();  // 실행할 이벤트
}
}

</script>
    
	<div id="hat">
		<div id="header">
    		<div id="find">
	           	<a href="main.jsp" id ="mark">
	           		<img src="../Images/mark.gif" class="mark">
	           	</a>
           		
					<input type="text" placeholder="이미지를 찾아볼까요?" id="search_text" onkeydown="JavaScript:Enter_Check();">
					<i class="fa fa-search fa-lg fa-fw" aria-hidden="true"></i>
					<select name="search_type" id="search_type">
						<option value="p_title">제목</option>
						<option value="p_writer">글쓴이</option>
					</select>
				
           		<!-- <input type="text" id="search_input" placeholder="검색어를 입력해주세요"> -->
            </div>
            
            <div id="log">
            <%
            if( session.getAttribute("id") == null)
            {
            %>	         
            	<a href="./clogin.jsp"><div>로그인</div></a>
            	<a href="./cregister.jsp"><div>회원가입</div></a>      
            <%
            }
            else
            {
           	
            %>
                      	
            	<div class="icon">
            		<a href="GameList.jsp"><i class="fa fa-gamepad fa-2x" aria-hidden="true" style="width: 100%"></i></a>
            	</div>
            	<div class="icon">
            		<a href="GameList.jsp"><i class="fa fa-picture-o fa-2x" aria-hidden="true"></i></a>
            	</div>
            	<div class="icon">
            		<a href="./cmodify.jsp"><i class="fa fa-user fa-2x" aria-hidden="true" alt="회원정보"></i></a>
            	</div>
            	<div class="icon">
            		<a href="logout_test.jsp"><i class="fa fa-sign-out fa-2x" aria-hidden="true"></i></a>
            	</div>
            <%
            }
            %>
            </div>	
        </div>
       </div>
            
            	
            