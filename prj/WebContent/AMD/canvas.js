
window.onload = function() {
	var canvas = document.getElementById("canvas");
	draw(canvas);
}

var canvas, ctx;

window.onload = function() {
	canvas = document.getElementById("canvas");
	ctx = canvas.getContext("2d");

	canvas.addEventListener("mousedown", listener);
	canvas.addEventListener("mousemove", listener);
	canvas.addEventListener("mouseup", listener);
	canvas.addEventListener("mouseout", listener);
}

function draw(canvas) {
	var ctx = canvas.getContext("2d");
	ctx.moveTo(30, 100);
	ctx.lineTo(80, 100);
	ctx.stroke();
}

var pos = {
	drawble : false,
	x : -1,
	y : -1
}

function listener(event) {
	switch (event.type) {
	case "mousedown":
		initDraw(event);
		break;
	case "mousemove":
		if (pos.drawable)
			draw(event);
		break;
	case "mouseout":
	case "mouseup":
		finishDraw();
		break;
	}
}

function initDraw(event) {
	ctx.beginPath();
	pos.drawable = true;
	var coors = getPosition(event);
	pos.X = coors.X;
	pos.Y = coors.Y;
	ctx.moveTo(pos.X, pos.Y);
}

function draw(event) {
	var coors = getPosition(event);
	ctx.lineTo(coors.X,coors.Y);
	pos.X = coors.X;
	pos.Y = coors.Y;
	ctx.stroke();
}

function finishDraw(){
	pos.drawable = false;
	pos.X = -1;
	pos.Y = -1;
}

function getPosition(event) {
	var x = event.pageX - canvas.offsetLeft;
	var y = event.pageY - canvas.offsetTop;
	return {
		X : x,
		Y : y
	};
}