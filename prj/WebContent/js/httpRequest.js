	// 생성된 XMLHttpRequest객체의 변수 선언
	var xhr= null;
// 브라우저에 상관없이 XMLHttpReqeust객체 생성
   	function getXMLHttpRequest(){
		// MS 브라우저라면 
		if(window.ActiveObject){
			try{
				return new ActiveXObject("MsMXL2.XMLHTTP");
			}catch (e) {
				try{
				return new ActiveXObject("Microsoft.XMLHTTP");
				}catch (e1) {
					null;
				}
			} 
		// 만약   ms의 브라우저가 아니라면
		}else if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}else {
			return null;
		}
	}
   	
   	// XMLHttpRequest 객체를 사용해서 지정한 방식(get, post),
   	// 지정된 url, 첨부할 파라미턴값을 사용해서 웹서버에 요청을 전송
   	
   	
   	function sendRequest(url, params, callback, method){
   		xhr= getXMLHttpRequest();
   		//console.log(xhr);
   		
   		var httpMethod = method ? method:'GET';
   		if(httpMethod != 'GET' && httpMethod != 'POST'){
   				httpMethod='GET';
   		}
   		var httpParams = 
   		(params == null || params=="") ? null : params;
   		
   		var httpUrl = url;
   		// http 요청방식이 GET이면 url뒤에 파라미터 붙임
   		if(httpMethod=='GET' && httpMethod != null){
   				httpUrl = httpUrl + "?" + httpParams;
   		}
   		
   		// 동기방식에서 브라우저간 차이가 발생하므로 크로스 브라우저를 위해
   		// 항상 비동기식으로 XMLHttpRequest객체 사용
   		// open 
   		xhr.open(httpMethod,httpUrl, true);
   		
   		// 웹서버에 전송할 컨텐트 타입지정
   		xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
   		// readState 값이 바뀔때마다 호출될 callback 함수 지정
   		xhr.onreadystatechange = callback;
   		// Http요청 방식이 'POST' 이면 send() 함수를 통해 파라미터 전송
   		xhr.send(httpMethod== 'POST'?httpParams:null);
   		
   	}
   	
   	
   	
   	
   	
   	
   	