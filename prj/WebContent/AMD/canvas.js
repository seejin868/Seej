
/*window.onload = function() {
	var canvas = document.getElementById("canvas");
	
	draw(canvas);
}*/

var canvas, ctx;

window.onload = function() {
	
	canvas = document.getElementById("canvas");
	ctx = canvas.getContext("2d");
	
/*리스너 추가*/
	canvas.addEventListener("mousedown", listener);
	canvas.addEventListener("mousemove", listener);
	canvas.addEventListener("mouseup", listener);
	canvas.addEventListener("mouseout", listener);
}

/*
function draw(canvas) {
	var ctx = canvas.getContext("2d");
	ctx.moveTo(30, 100);
	ctx.lineTo(80, 100);
	ctx.stroke();
}*/

var pos = {
	drawble : false,
	x : -1,
	y : -1
}

function listener(event) {
	switch (event.type) {
	case "mousedown":/*마우스를 누르면 그리기 시작*/
		initDraw(event);
		break;
	case "mousemove":/*이동하면 선을 그린다*/
		if (pos.drawable)
			draw(event);
		break;
	case "mouseout":/*마우스가 캔버스에서 나가거나 마우스를 누르지 않으면 그리기 종료*/
	case "mouseup":
		finishDraw();
		break;
	}
}
/*초기화 및 현재위치 등 그리는 준비*/
function initDraw(event) {
	ctx.beginPath();
	pos.drawable = true;
	var coors = getPosition(event);
	pos.X = coors.X;
	pos.Y = coors.Y;
	ctx.moveTo(pos.X, pos.Y);
}
/*그리기*/
function draw(event) {
	var coors = getPosition(event);
	ctx.lineTo(coors.X,coors.Y);
	pos.X = coors.X;
	pos.Y = coors.Y;
	ctx.stroke();
}
/*그리기 종료*/
function finishDraw(){
	pos.drawable = false;
	pos.X = -1;
	pos.Y = -1;
}
/*마우스 현재위치*/
function getPosition(event) {
	/*event.pageXY만 있는 경우는 캔버스가 배치된 위치만큼 어긋나있다 */
	/*마우스의 현재 위치에서 캔버스의 위치를 뺀다*/
	var x = event.pageX - canvas.offsetLeft;
	var y = event.pageY - canvas.offsetTop;
	
	return {
		X : x,
		Y : y
	};
}
//색변경
function changeColor( r,g,b,a){
	//ctx.strokeStyle = color;
	ctx.strokeStyle = "rgba(" + r +","+ g +","+ b +"," + a +")";
}
//선 굵기 변경
function changeThicknessLine(thick){
	ctx.lineWidth = thick
}
