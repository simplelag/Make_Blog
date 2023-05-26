package com.bitc.make_blog.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class userDAO extends JDBConnect {
    public int join(userDTO user){
        int result = 0;
        String sql= "insert into blog_member(id,pass,name)Values(?,?,?);";
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getId());
            pstmt.setString(2,user.getPass());
            pstmt.setString(3,user.getName());
            result = pstmt.executeUpdate();
        }
        catch (SQLException e){
            System.out.println("회원가입중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return result;
    }

    public int login(userDTO user){

        String sql = "select * from blog_member where id = ?  and pass = ? ";
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getId());
            pstmt.setString(2,user.getPass());
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                result = 1;
            }
            else {
                result=0;
            }
            rs.close();
        }
        catch (SQLException e){
            System.out.println("로그인중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return result ;
    }
    public int isMember(String id, String pw) {
        int result = 0;

//    사용자 id와 pw 를 가지고 해당 정보가 데이터 베이스에 있는지 확인하는 SQL 쿼리문 생성
        String sql = "SELECT count(id) AS cnt FROM blog_member ";
        sql += "WHERE id = ? ";
        sql += "AND pass = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setString(2,pw);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = 1;
            }
            else{
                result = 0;
            }
        }
        catch (SQLException e) {
            System.out.println("SELECT 사용 시 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return result;
    }
    public userDTO selectMember(String id, String pass) {
        userDTO member = new userDTO();

        String sql  = "SELECT id, pass, name, grade FROM blog_member ";
        sql += "WHERE id = ? ";
        sql += "AND pass = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pass);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                member.setId(rs.getString("id"));
                member.setPass(rs.getString("pass"));
                member.setName(rs.getString("name"));
                member.setGrade(rs.getInt("grade"));
            }
        }
        catch (SQLException e) {
            System.out.println("SELECT 명령 사용 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return member;
    }
}

