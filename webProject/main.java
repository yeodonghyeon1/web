package myapp;
import java.sql.*;

/* 각종 기능들 따로 빼논 클래스입니다 
 * 쓰려면 맨위에 import ex)myapp.main 하시면됩니다
 * myapp 부분은 본인 패키지 이름 쓰셔야합니다
 * <%@ page import= "myapp.main" %>
 * 
 * */

public class main {
	
	
	//테이블 크기 구하는 메소드
	public int getTotalRows(String table_name) {
	    int count = 0;
	 
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
	        StringBuffer sql = new StringBuffer();
	        sql.append("select * from ");
	        sql.append(table_name);
	        pstmt = conn.prepareStatement(sql.toString());
	        pstmt = conn.prepareStatement(sql.toString());

	        rs = pstmt.executeQuery();

	        if(rs != null) {
	        while (rs.next()) {
	            count++;
	        }
	        }
	    } catch (SQLException e) {
	        // TODO Auto-generated catch block
            System.out.println("오류코드1");
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null)
	                rs.close();

	            if (pstmt != null)
	                pstmt.close();
	            if (conn != null)
	                conn.close();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }
	    return count;
	}
	
	
	/* 페이징 처리 메소드-------------------------------------------- */
	public int currentBlock(int cPage, int pageLength) {
		return  cPage % pageLength == 0 ? cPage / pageLength : (cPage / pageLength) + 1;
	}
	public int startPage(int currentBlock, int pageLength) {
		return  (currentBlock - 1)  * pageLength + 1;
	}
	public int endPage(int startPage, int pageLength) {
		System.out.println("rrr" + startPage + pageLength);
		return startPage + pageLength - 1;
		
	}
	
	//-------------------------------------------------------------//
	
	
	

	

}

