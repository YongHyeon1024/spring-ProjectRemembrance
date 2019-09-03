<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" pageEncoding="UTF-8"%>


<!-- 시스템 날씨 데이터 불러오기 -->
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<div class="card mb-3">
  <div class="card-header">
    <i class="fas fa-table"></i> QnA 게시판 
    <span style="float:right"> <button type="button" class="btn btn-primary btn-sm" 
    onclick="location.href='${pageContext.request.contextPath}/main.do?menu=12'" 
    class="right" > 새로운 질문 올리기</button> </span>
    
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered table table-striped" id="dataTable" >
        <thead>
          <tr>
            <th scope="col">작성자</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">날짜</th>
          </tr>
        </thead>

        <tbody>
          <c:forEach var="board" items="${list }">
          <tr>
            <td>${board.Q_WRITER }</td>
            <td><a href="main.do?menu=${param.menu }&no=${board.Q_NO}">${board.Q_TITLE}</a></td>
            <td>${board.Q_HIT }</td>
            <td>${board.Q_DATE }</td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <div class="card-footer small text-muted">
    <%Date now = new Date();
       SimpleDateFormat sf = new SimpleDateFormat("yy년 MM월 dd일 E a hh:mm:ss"); 
       String today = sf.format(now);%>
    <%= today %>
  </div>
</div>