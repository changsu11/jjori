<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, org.mindrot.jbcrypt.BCrypt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2 class="mt-5">로그인</h2>
    <form action="login.jsp" method="POST">
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 입력" required>
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
    </form>
    <p class="mt-3">회원이 아니신가요? <a href="signup.jsp">회원 가입</a></p>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            //데이터베이스 연결변수
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            //사용자 입력 값 받기
            String id = request.getParameter("id");
            String password = request.getParameter("password");

            try {
                // 데이터베이스 연결
                Class.forName("org.mariadb.jdbc.Driver");
                String dbUrl = "jdbc:mariadb://10.100.0.20:3306/myappdb";
                String dbUser = "root";
                String dbPassword = "password";
                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                // 비밀번호 해시 처리
                String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

                // SQL 쿼리
                String sql = "SELECT password FROM users WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, hashedPassword);

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String storedPassword = rs.getString("password");
                    if (BCrypt.checkpw(password, storedPassword)) {
                        out.println("<script>alert('로그인 성공!'); location.href='index.jsp';</script>");
                    } else {
                        out.println("<script>alert('로그인 실패! 비밀번호를 확인하세요.'); history.back();</script>");
                    }
                } else {
                    out.println("<script>alert('로그인 실패! 아이디를 확인하세요.'); history.back();</script>");
                }
            } catch (SQLException e) {
                out.println("<script>alert('데이터베이스 오류가 발생했습니다. 나중에 다시 시도해주세요.'); history.back();</script>");
                e.printStackTrace(); // Consider logging instead of printing stack trace
            } catch (ClassNotFoundException e) {
                out.println("<script>alert('시스템 오류가 발생했습니다. 나중에 다시 시도해주세요.'); history.back();</script>");
                e.printStackTrace(); // Consider logging instead of printing stack trace
            } finally {
                // 리소스 해제
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
</div>
</body>
</html>
