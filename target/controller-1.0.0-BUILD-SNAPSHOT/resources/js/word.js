var data;
var dataLength;
var rand;
var count = 0;
var param = getParameterByName('level'); // 테이블명
$(() => { // 시작시 실행, 데이터 베이스 가져오기
	console.log("start");
	$.post( "http://1.234.5.158:3003/ajax/post", {  // post 방식
		sql: "SELECT * FROM " + param + " ORDER BY Q_NO ASC"
		})
	.done(function(retdata) {
		console.log("post");
		data = retdata.rows;
		dataLength = data.length;
		console.log(data);
		next();
	});
});

function btn_o() { // O 버튼
	console.log("o 버튼");
	chck();
	next();
}
function btn_x() { // X 버튼
	console.log("x 버튼");
	send1();
	if(count < dataLength){ // 특정 회수를 넘어가면 동작 안함
		data.push(data[0]); // 카드 뒤로 복제
	}
	chck();
	next();
}

function btn_test() { // 테스트용 버튼
	test1();
}

function chck() {
	count++;
	data.splice(0,1); // 카드 제거
	console.log(count);
	console.log(data);
	$('#collapseExample').attr('class','collapse');
}
function next() {
	var len = data.length;
	if(len === 0){
		setTimeout(() => {
			 alert('학습이 종료되었습니다. 메인화면으로 돌아갑니다.');
			 location.replace("main.do"); // 카드가 없으면 특정 페이지로 이동
		}, 1000);
		return;
	}
	//rand = Math.floor(Math.random() * len); // 랜덤
	$('#front').text(data[0][2]); // 다음 카드
	$('#back').text(data[0][3]); // 답 보기
}
function send1() {
	$.post( "http://1.234.5.158:3003/ajax/post", {  // post 방식
		sql: "UPDATE " + param + " SET Q_HIT = " + (data[0][4] + 1) + " WHERE Q_NO = " + data[0][0] // hit 증가
		})
	.done(function(retdata) {
		console.log(retdata);
		console.log("send");
	});
	//UPDATE 테이블명 SET 수정되어야 할 컬럼명 = 수정되기를 원하는 새로운 값
}

function getParameterByName(name) { // html 파라미터 가져오기
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function test1(){ // 테스트
	var tmp;
	console.log("테스트용 버튼");
	$.post( "http://1.234.5.158:3003/ajax/post", { 
		sql: "SELECT * FROM QUIZCARD"
		})
	.done(function( retdata ) {
		console.log(retdata);
		tmp = retdata.rows.length + 1;
		console.log(tmp);
		var i = 0;
		var fn1 = setInterval(() => {
			$.post( "http://1.234.5.158:3003/ajax/post", { 
				sql: "INSERT INTO " + param + " VALUES("+(tmp+i)+", 'id"+(tmp+i)+"', 'front"+(tmp+i)+"', 'back"+(tmp+i)+"', 0)"
				})
			.done(function( retdata ) {
				console.log(retdata);
			});
			console.log(i);
			i++;
			if(i === 6){
				clearInterval(fn1);
				console.log("ci");
			}
		}, 1000);
	});
}