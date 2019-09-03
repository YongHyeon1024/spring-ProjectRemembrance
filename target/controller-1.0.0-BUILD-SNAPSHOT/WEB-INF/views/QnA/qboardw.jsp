<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
  <h3>게시판 글쓰기</h3>
  <main class="login-form">
  <div class="cotainer">
    <div class="row justify-content-center">
      <div class="col-md-5">
        <div class="card">
          <div class="card-header">게시판 글쓰기</div>
          <form action="${pageContext.request.contextPath}/qb/qboardw.do"
            method="post">
            <div class="card-body">

              <div class="form-group row">
                <label for="motto" class="col-md-4 col-form-label text-md-right">제목
                </label>
                <div class="col-md-6">
                  <input type="text" name="title" class="form-control" />
                </div>
              </div>

              <div class="form-group row">
                <label for="motto" class="col-md-4 col-form-label text-md-right">내용
                </label>
                <div class="col-md-6">
                  <textarea rows="6" name="content" class="form-control" /></textarea>
                </div>
              </div>

              <div class="form-group row">
                <label for="motto" class="col-md-4 col-form-label text-md-right">작성자
                </label>
                <div class="col-md-6">
                  <input type="text" name="writer" class="form-control" />
                </div>
              </div>

              <div class="col-md-6 offset-md-4">

                <button type="submit" class="btn btn-primary" value="글쓰기">글쓰기</button>
                <button type="button" class="btn btn-danger" onclick="location.href='main.do?menu=3'">목록으로 이동</button>

              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  </main>
</body>
</html>