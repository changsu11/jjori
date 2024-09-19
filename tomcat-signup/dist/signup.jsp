<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, org.mindrot.jbcrypt.BCrypt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function validateForm() {
            var password = document.getElementById("password").value;
            if (password === "") {
                alert("비밀번호를 입력하세요");
                return false; // 폼 제출 중지
            }
            return true; // 폼 제출 진행
        }
    </script>
</head>
<body>
<div class="container">
    <h2 class="mt-5">회원 가입</h2>
    <form action="signup.jsp" method="POST" onsubmit="return validateForm();">
        <div class="mb-3">
            <label for="username" class="form-label">이름</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="이름 입력">
        </div>
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 입력">
        </div>
        <button type="submit" class="btn btn-primary">회원 가입</button>
    </form>
    <p class="mt-3">이미 회원이신가요? <a href="login.jsp">로그인</a></p>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            // 데이터베이스 연결 변수
            Connection conn = null;
            PreparedStatement pstmt = null;

            // 사용자 입력 값 받기
            String username = request.getParameter("username");
            String id = request.getParameter("id");
            String password = request.getParameter("password");

            // 서버 측 검증
            if (password == null || password.isEmpty()) {
                out.println("<script>alert('비밀번호를 입력하세요'); history.back();</script>");
            } else {
                try {
                    // 데이터베이스 연결
                    Class.forName("org.mariadb.jdbc.Driver");
                    String dbUrl = "jdbc:mariadb://10.100.0.20:3306/myappdb";
                    String dbUser = "root"; // 데이터베이스 사용자 이름
                    String dbPassword = "password"; // 데이터베이스 비밀번호
                    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    // 비밀번호 해시 처리
                    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

                    // SQL 쿼리
                    String sql = "INSERT INTO users (id, username, password) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, id);
                    pstmt.setString(2, username);
                    pstmt.setString(3, hashedPassword);

                    int result = pstmt.executeUpdate();

                    if (result > 0) {
                        out.println("<script>alert('회원가입 성공!'); location.href='login.jsp';</script>");
                    } else {
                        out.println("<script>alert('회원가입 실패! 다시 시도해주세요.'); history.back();</script>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<script>alert('SQL 오류 발생: " + e.getMessage() + "'); history.back();</script>");
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                    out.println("<script>alert('JDBC 드라이버 오류 발생: " + e.getMessage() + "'); history.back();</script>");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
                } finally {
                    // 리소스 해제
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
        }
    %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

