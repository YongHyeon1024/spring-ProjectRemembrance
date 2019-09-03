var table;
var tableLength;
var maxNo, cardNo;
var id, front, back;
//var param = getParameterByName('level'); // 테이블명
console.log("js 에서 찍힌 log " + param);
var param = "QUIZCARD"; // 테이블명
$(() => { // 시작시 실행
	console.log("start");
	selectList();
});

function btn_insertOne() {
	insertOne();
	setTimeout(() => {
		selectList();
	}, 1000); 
}

function btn_deleteOne(id) {
	console.log(id);
	cardNo = $('#n' + id).text();
	console.log(cardNo);
	deleteOne();
	setTimeout(() => {
		selectList();
	}, 1000); 
}

function btn_updateOne(id) {
	console.log(id);
	cardNo = $('#n' + id).text();
	console.log(cardNo);
	updateOne();
	setTimeout(() => {
		alert("수정되었습니다.");
		selectList();
	}, 1000); 
}

function btn_test() { // 테스트용 버튼
	test1();
}

function getParameterByName(name) { // html 파라미터 가져오기
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function selectList() { // 리스트 불러오기
	$.post( "http://1.234.5.158:3003/ajax/post", {  // post 방식
	sql: "SELECT * FROM " + param + " ORDER BY Q_NO ASC"
	})
	.done(function(retdata) {
		console.log("post");
		table = retdata.rows;
		tableLength = table.length;
		console.log(table);
		$('#wtable > tbody').empty(); // 테이블 비우기
		for(var i=0; i<tableLength; i++){ // 테이블 작성
			$('#wtable > tbody:last').append(
				'<tr>' + 
					'<td scope="row" align="center" id="nid' + table[i][0] + '">' + table[i][0] + '</td>' + 
					'<td align="center">' + 
						'<input type="text" class="form-control" id="fid' + table[i][0] + '" aria-describedby="basic-addon3" ' + 
						'value="' + table[i][2] + '"</>' + 
					'</td>' + 
					'<td align="center">' + 
						'<input type="text" class="form-control" id="bid' + table[i][0] + '" aria-describedby="basic-addon3" ' + 
						'value="' + table[i][3] + '"</>' + 
					'</td>' + 
					'<td align="center">' + 
					'<button type="button" class="btn btn-success" id="id' + table[i][0] + 
						'" onclick="btn_updateOne(this.id)">수정</button>' + 
					'<button type="button" class="btn btn-danger" id="id' + table[i][0] + 
						'" onclick="btn_deleteOne(this.id)">삭제</button>' + 
					'</td>' + 
				'</tr>'
			);
		}
	});
}

// '<input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">' + table[i][2] + '</input>'

// '<tr>' + 
// 	'<td scope="row" align="center">' + list[i][0] + '</td>' + 
// 	'<td align="center">' + list[i][2] + '</td>' + 
// 	'<td align="center">' + list[i][3] + '</td>' + 
// 	'<td align="center">' + 
// 	'<button type="button" class="btn btn-success">수정</button>' + 
// 	'<button type="button" class="btn btn-danger">삭제</button>' + 
// 	'</td>' + 
// '</tr>'

function insertOne() { // 카드 1개 추가
	$.post( "http://1.234.5.158:3003/ajax/post", {  // post 방식
		sql: "SELECT MAX(Q_NO) FROM " + param // Q_NO 가장 큰값 받아오기
		})
	.done(function(retdata) {
		console.log("post");
		maxNo = retdata.rows[0][0];
		id = "admin";
		front = $('#q_front').val();
		back = $('#q_back').val();
		$('#q_front').val("");
		$('#q_back').val("");
		console.log(maxNo);
		console.log(id);
		console.log(front);
		console.log(back);
		$.post( "http://1.234.5.158:3003/ajax/post", {  // post 방식
			sql: "INSERT INTO " + param + " (Q_NO, Q_ID, Q_FRONT, Q_BACK, Q_HIT) " + 
			"VALUES (" + (maxNo + 1) + ", '" + id + "', '" + front + "', '" + back + "', 0)" // 카드 1개 입력
			})
		.done(function(retdata) {
			console.log("post");
			console.log(retdata);
		});
	});
}

function deleteOne() {
	console.log(cardNo);
	$.post( "http://1.234.5.158:3003/ajax/post", {  // post 방식
		sql: "DELETE FROM " + param + " WHERE Q_NO = " + cardNo // 카드 1개 삭제
		})
	.done(function(retdata) {
		console.log("post");
		console.log(retdata);
	});
}

function updateOne() {
	front = $('#fid' + cardNo).val();
	back = $('#bid' + cardNo).val();
	console.log(cardNo);
	console.log(front);
	console.log(back);
	$.post( "http://1.234.5.158:3003/ajax/post", {  // post 방식
		sql: "UPDATE " + param + " SET Q_FRONT = '" + front + "', Q_BACK = '" + back + 
		"' WHERE Q_NO = " + cardNo // 카드 1개 업데이트
		})
	.done(function(retdata) {
		console.log("post");
		console.log(retdata);
	});
}


function test1(){
	
}

// "INSERT INTO QUIZCARD (Q_NO, Q_ID, Q_FRONT, Q_BACK, Q_HIT) " + 
// "VALUES (" + (maxNo + 1) + ", " + id + ", " + front + ", " + back + "0)"

// "DELETE FROM " + param + " WHERE Q_NO = " + cardNo

// "UPDATE " + param + " SET Q_FRONT = " + front + ", Q_BACK = " + back + " WHERE Q_NO = " + cardNo