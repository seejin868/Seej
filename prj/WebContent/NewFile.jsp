<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<script>
$(document).ready(function(){
    // canvas
    var cnvs = document.getElementById('cnvs');
    // canvas 사용가능
    if (cnvs.getContext) {
        // 캔버스 컨텍스트
        var ctx = cnvs.getContext('2d');
        
        // 그리기 모드인지 체크하는 변수
        var isDraw = false;

        // 이미지 복원
        if (localStorage['imgData']) {
            var aData = new Array();
            aData = localStorage['imgData'].split('|');
            var imgData = ctx.createImageData(cnvs.width, cnvs.height);

            var j = 0;
            for (var i=0; i<imgData.data.length; i+=4) {
                imgData.data[i]    = aData[j+0]; // R
                imgData.data[i+1] = aData[j+1]; // G
                imgData.data[i+2] = aData[j+2]; // B
                imgData.data[i+3] = 0xFF; // Alpha
                j += 3;
            }
            // 복원된 픽셀데이터를 캔버스에 밀어넣기
            ctx.putImageData(imgData, 0, 0);
        // 이미지 초기화
        } else {
            ctx.fillStyle = 'rgb(255, 255, 255)';
            ctx.fillRect(0, 0, cnvs.width, cnvs.height);
        }

        // 그리기 옵션
        var dot = 1;
        var color = 'rgb(0, 0, 0)';

        // 그리기 옵션 - 도트크기
        $('#dot').bind('change', function(){  dot = $('#dot').val(); });
        // 그리기 옵션 - 색깔
        $('#color').bind('change', function(){ color = $('#color').val(); });

        // 이벤트 핸들러 연결
        $('#cnvs').mousemove(function(e){
            // 그릴 수 있으면 그린다.
            if (isDraw) draw(e);        
        });
        $('#cnvs').mousedown(function(e){
            // 왼쪽 버튼 down 이면 그릴 수 있다고 선언
            if (e.button===0) {
                isDraw = true;
                draw(e);
            }
        });
        $('#cnvs').mouseup(function(e){
            // 버튼 up 이면 그릴 수 없다고 선언
            isDraw = false;                 
        });

        // 그리기
        function draw(e)
        {
            ctx.fillStyle = color;
            ctx.fillRect(e.offsetX, e.offsetY, dot, dot);
        }

        // 지우기
        function clearCanvas()
        {
            ctx.clearRect(0, 0, cnvs.width, cnvs.height);
            ctx.beginPath();

            localStorage.removeItem('imgData');
        }

        // 저장
        function saveImg()
        {
            var imgData = ctx.getImageData(0, 0, cnvs.width, cnvs.height);
            var strData = '';
            for (var i=0; i<imgData.length; i+=4) {
                strData += imgData[i]+'|'+imgData[i+1]+'|'+imgData[i+2]+'|';
            }
            localStorage.setItem('imgData', strData);
        }

        // 지우기
        $('button[id="btnDel"]').click(function(){
            clearCanvas();
        });

        // 저장하기
        $('button[id="btnSave"]').click(function(){
            saveImg();
        });

    // canvas 사용불가
    } else {
        alert('canvas가 지원되지 않는 브라우저입니다. 구글 크롬을 권장합니다.');
        return;
    }
});
</script>
</head>

<body>

<div>
    <canvas id="cnvs" width="300" height="300" style="border: 1px solid black;"></canvas>
    <br />
    <div>
        <!-- 도트크기 -->
        <select id="dot">
            <option value="1">1px</option>
            <option value="2">2px</option>
            <option value="5">5px</option>
            <option value="10">10px</option>
        </select>
        &nbsp;
        <!-- 색깔 -->
        <select id="color">
            <option value="rgb(0, 0, 0)">black</option>
            <option value="rgb(255, 0, 0)">red</option>
            <option value="rgb(0, 255, 0)">green</option>
            <option value="rgb(0, 0, 255)">blue</option>
            <option value="rgb(255, 255, 0)">yellow</option>
            <option value="rgb(255, 255, 255)">white</option>
        </select>
    </div>
    <br />
    <button id="btnDel">지우기</button>
    &nbsp;
    <button id="btnSave">저장하기</button>
</div>

</body>
</html>
