<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
  <div class="alert alert-success" role="alert">단어장 관리</div>
  <br /> <!-- <label for="basic-url">단어장 이름을 반드시 입력해주세요!</label> -->
  <%-- <form action="${pageContext.request.contextPath }/word/wordcardCreate.do" method="post">
  <div class="input-group mb-3">
    <div class="form-inline"> <!-- input-group-prepend"> -->
      <span class="input-group-text" id="basic-addon1">단어장 이름</span>
        <input type="text" class="form-control" id="q_name" name="q_name"
          placeholder="단어장 이름을 입력해주세요." required="required" style="width:400px">
        <button type="submit" class="btn btn-primary">생성</button>
      </div>
  </div>
  </form> --%>
  <h4>당신이 가지고 있는 QUIZCARD 단어장 입니다.</h4>
  <table class="table" id="wtable">
    <thead class="thead-light" align="center">
      <tr>
        <th scope="col" align="center">번호</th>
        <th scope="col" align="center">단어</th>
        <th scope="col" align="center">뜻</th>
        <th scope="col" align="center">메뉴</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${list }">
      <tr>
        <td scope="row" align="center">${list.q_no }</td>
        <td align="center">${list.q_front }</td>
        <td align="center">${list.q_back }</td>
        <td align="center">
          <button type="button" class="btn btn-success">수정</button>
          <button type="button" class="btn btn-danger">삭제</button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

</div>



</br>
</br>
<div class="container" align="left">
  <label for="basic-url"> 단어의 정보를 입력하세요.</label>
  <div class="row">
    <div class="col">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text" id="basic-addon1">단어</span>
        </div>
        <input type="text" class="form-control" id="q_front"
          placeholder="단어를 입력해주세요." required="required">
      </div>

    </div>
    <div class="col">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text" id="basic-addon3">단어 뜻</span>
        </div>
        <input type="text" class="form-control" id="q_back"
          placeholder="단어의 뜻을 입력해주세요." required="required">
		  <button type="submit" class="btn btn-primary" onclick="btn_insertOne();">+</button>
		</div>
		<button type="button" class="btn btn-primary" onclick="location.href='main.do?menu=9'">단어장 수정 완료</button>

    </div>
  </div>
</div>


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/wordtable.js"></script>