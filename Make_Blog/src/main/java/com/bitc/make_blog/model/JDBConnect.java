package com.bitc.make_blog.model;

import java.sql.*;

public class JDBConnect {
    protected Connection conn;
    protected Statement stmt;
    protected PreparedStatement pstmt;
    protected ResultSet rs;




    public JDBConnect(){
            this("com.mysql.cj.jdbc.Driver","jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC","full505","full505");
    }
    public JDBConnect(String driver, String url, String id, String pw){
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url,id,pw);
            System.out.println("*****db is open");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    public void dbClose(){
        try{
            if(rs != null){rs.close();}
            if(stmt != null){stmt.close();}
            if(pstmt != null){pstmt.close();}
            if(conn != null){conn.close();}

            System.out.println("데이터 베이스 연결 해제");
        }
        catch (Exception e){
            throw  new RuntimeException(e);
        }
    }
}
