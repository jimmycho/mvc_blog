/*package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import utility.DBClose;
import utility.DBOpen;



public class BbsDAO {
	
	
	
	 *//**
	  * �亯�� ���� ��ȸ
	  * @param bbsno ��ȸ�� �� ��ȣ
	  * @return dto -bbsno,title,grpno,indent,ansnum
	  *//*
	 public BbsDTO readReply(int bbsno){
	   Connection con = DBOpen.getConnection();
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	   BbsDTO dto = null;        // �ϳ��� �ۿ� �ش�
	   
	   sql = new StringBuffer();
	   sql.append(" SELECT bbsno,title,grpno,indent,ansnum ");
	   sql.append(" FROM bbs");
	   sql.append(" WHERE bbsno = ?");
	  
	   try{
	     pstmt = con.prepareStatement(sql.toString());
	     pstmt.setInt(1, bbsno);
	     
	     rs = pstmt.executeQuery();
	     
	     if(rs.next() == true){
	       String title = rs.getString("title"); 
	       int grpno = rs.getInt("grpno");
	       int indent = rs.getInt("indent");
	       int ansnum = rs.getInt("ansnum");
	       
	       dto = new BbsDTO();         // �ϳ��� ���ڵ带 �ϳ��� ��ü�� ��ȯ
	       dto.setBbsno(bbsno);
	       dto.setTitle(title);
	       dto.setGrpno(grpno);
	       dto.setIndent(indent);
	       dto.setAnsnum(ansnum);
	     
	     }
	   }catch(Exception e){
	     e.printStackTrace();
	   }finally{
	     DBClose.close(con, pstmt, rs);
	   }
	   
	   return dto;
	 }
	 
	  

	*//** 
	   * �亯 ���, ����� ���ڵ� ���� ����: 0 , 1 
	   *  
	   * @param dto 
	   *          ������ ��ü 
	   * @return ����� ���ڵ� �� 
	   *//* 
	  public int reply(BbsDTO dto) { 
	    Connection con = DBOpen.getConnection(); // DBMS ���� 
	    PreparedStatement pstmt = null; 
	    int cnt = 0; 

	    try { 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" INSERT INTO bbs(bbsno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum)"); 
	      sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), ?, ?, ?, ?, 0, sysdate, ?, ?, ?)"); 

	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setString(1, dto.getWname()); 
	      pstmt.setString(2, dto.getTitle()); 
	      pstmt.setString(3, dto.getContent()); 
	      pstmt.setString(4, dto.getPasswd()); 
	      pstmt.setInt(5, dto.getGrpno()); // �θ��Ǳ׷��ȣ 
	      pstmt.setInt(6, dto.getIndent()+1); 
	      pstmt.setInt(7, dto.getAnsnum()+1); 

	      cnt = pstmt.executeUpdate(); 
	    } catch (Exception e) { 
	      System.out.println(e.toString()); 
	    } finally { 
	      DBClose.close(con, pstmt); 
	    } 

	    return cnt; 
	  } 

	  *//** 
	   * �亯 ���� ���� 
	   * @param grpno �׷� ��ȣ 
	   * @param ansnum �亯 ���� 
	   *//* 
	  public void addAnsnum(int grpno, int ansnum){ 
	    Connection con = DBOpen.getConnection();  // DBMS ���� 
	    PreparedStatement pstmt = null; 
	     
	    try{ 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" UPDATE bbs"); 
	      sql.append(" SET ansnum = ansnum + 1"); 
	      sql.append(" WHERE grpno=? AND ansnum > ?"); 

	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setInt(1, grpno); 
	      pstmt.setInt(2, ansnum); 

	      pstmt.executeUpdate(); 
	    }catch(Exception e){ 
	      System.out.println(e.toString()); 
	    }finally{ 
	      DBClose.close(con, pstmt); 
	    } 
	     
	  }   
	
	 public int delete(int bbsno){
		    Connection con = DBOpen.getConnection();
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
		    int cnt = 0;             // return �� ���ڵ� ����
		    
		    sql = new StringBuffer();
		    sql.append(" DELETE FROM bbs");
		    sql.append(" WHERE bbsno = ?");
		   
		    try{
		      pstmt = con.prepareStatement(sql.toString());
		      pstmt.setInt(1, bbsno);
		      
		      cnt = pstmt.executeUpdate(); // 0 or 1
		    }catch(Exception e){
		      System.out.println(e.toString());
		    }finally{
		      DBClose.close(con, pstmt);
		    }
		    
		    return cnt;
		  }
	
	*//**
	   * �޸� �����մϴ�.
	   * @param vo ������ �����Ͱ� �ִ� ��ü
	   * @return ����� ���ڵ� ����
	   *//*
	  public int update(BbsDTO dto){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	    int cnt = 0;             // return �� ���ڵ� ����
	    
	    sql = new StringBuffer();
	    sql.append(" UPDATE bbs");
	    sql.append(" SET wname=?, title=?, content=?");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getWname());
	      pstmt.setString(2, dto.getTitle());
	      pstmt.setString(3, dto.getContent());
	      pstmt.setInt(4, dto.getBbsno());
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
	  }
	
	*//**
	   * �н����带 �˻��մϴ�.
	   * @param bbsno �� ��ȣ
	   * @param passwd �н����� 
	   * @return 0: �н����� ��ġ���� ����, 1: �н����� ��ġ
	   *//*
	  public int checkPasswd(int bbsno, String passwd){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	    int cnt = 0;             // ���ڵ� ����
	    
	    sql = new StringBuffer();
	    sql.append(" SELECT COUNT(bbsno) as cnt");
	    sql.append(" FROM bbs");
	    sql.append(" WHERE bbsno=? AND passwd=?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      pstmt.setString(2, passwd);
	      
	      rs = pstmt.executeQuery();
	      
	      if(rs.next() == true){
	        cnt = rs.getInt("cnt");
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt, rs);
	    }
	    
	    return cnt;
	  }
	 public BbsDTO read(int bbsno){
		    Connection con = DBOpen.getConnection();
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
		    BbsDTO dto = null;        // �ϳ��� �ۿ� �ش�
		    
		    sql = new StringBuffer();
		    sql.append(" SELECT bbsno, wname, title, content, viewcnt, wdate");
		    sql.append(" FROM bbs");
		    sql.append(" WHERE bbsno = ?");
		   
		    try{
		      pstmt = con.prepareStatement(sql.toString());
		      pstmt.setInt(1, bbsno);
		      
		      rs = pstmt.executeQuery();
		      
		      if(rs.next() == true){
		        String title = rs.getString("title");
		        String content = rs.getString("content");
		        String wname = rs.getString("wname");
		        int viewcnt = rs.getInt("viewcnt");
		        String wdate = rs.getString("wdate");
		        
		        dto = new BbsDTO();         // �ϳ��� ���ڵ带 �ϳ��� ��ü�� ��ȯ
		        dto.setBbsno(bbsno);
		        dto.setWname(wname);
		        dto.setTitle(title);
		        dto.setContent(content);
		        dto.setViewcnt(viewcnt);
		        dto.setWdate(wdate);
		      
		      }
		    }catch(Exception e){
		      e.printStackTrace();
		    }finally{
		      DBClose.close(con, pstmt, rs);
		    }
		    
		    return dto;
		  }
		 
		  *//**
		   * ��ȸ�� ����
		   * @param memono ��ȸ�� ������ �� ��ȣ
		   *//*
		  public void increaseViewcnt(int bbsno){
		    Connection con = DBOpen.getConnection();
		    PreparedStatement pstmt = null;
		    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
		    
		    sql = new StringBuffer();
		    sql.append(" UPDATE bbs");
		    sql.append(" SET viewcnt = viewcnt + 1");
		    sql.append(" WHERE bbsno = ?");
		   
		    try{
		      pstmt = con.prepareStatement(sql.toString());
		      pstmt.setInt(1, bbsno);
		      
		      pstmt.executeUpdate();
		      
		    }catch(Exception e){
		      e.printStackTrace();
		    }finally{
		      DBClose.close(con, pstmt);
		    }
		    
		  }  
		  
		  *//** 
		   * �˻��� ���ڵ� ������ ����  
		   * @param col �˻� �÷� 
		   * @param word �˻��� 
		   * @return �˻��� ���ڵ� ���� 
		   *//* 
		     public int total(String col, String word){
		        int total=0;
		        Connection con=null;
		        PreparedStatement pstmt=null;
		        ResultSet rs = null;
		        StringBuffer sql = new StringBuffer();
		        sql.append(" SELECT count(*) FROM bbs ");
		        
		        if(word.trim().length()>0)
		         sql.append(" WHERE "+col+" Like '%'|| ? ||'%'");
		        
		        try {
		            con = DBOpen.getConnection();
		            pstmt = con.prepareStatement(sql.toString());
		            
		            if(word.trim().length()>0)  
		               pstmt.setString(1, word);
		            
		            rs = pstmt.executeQuery();
		            
		            if(rs.next()){
		              total = rs.getInt(1);
		            }
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		        } finally{
		            DBClose.close(con, pstmt, rs);
		        }
		        
		        
		        return total;
		    }
	
	*//**
	 * ���
	 * @param (�˻��÷�-wname,title,content,total),word(�˻���-����Է°�)
	 * @return List���
	 *//*
		  
		  
		  public List<BbsDTO> list(String col, String word,int sno, int eno){
		   Connection con = DBOpen.getConnection();
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
		   List<BbsDTO> list = null;
		   
		   sql = new StringBuffer();
		   sql.append("SELECT bbsno, wname, title, viewcnt, wdate,  r");
		   sql.append("FROM (");
		   sql.append("SELECT bbsno, wname, title, viewcnt, wdate, rownum as r ");
		   sql.append("FROM ( ");
		   sql.append("  SELECT bbsno, wname, title, viewcnt, wdate");
		   sql.append("FROM bbs ");
		   
		   
		   if(word.trim().length()>0)  //�Է��� ���� �ִٴ� �ǹ�
			   sql.append(" WHERE "+col+" Like '%'|| ? || '%' ");
		    
		   sql.append(" ORDER BY grpno DESC, ansnum ASC");
		   sql.append(" )");
		   sql.append(" )where r>=? and r<=?");
		  
		   try{
			   int i=0;
		     pstmt = con.prepareStatement(sql.toString());
		     if(word.trim().length()>0)
		    	 pstmt.setString(++i, word);
		     
		     pstmt.setInt(++i, sno);
		     pstmt.setInt(++i, eno);
		     
		     rs = pstmt.executeQuery();
		     list = new ArrayList<BbsDTO>();
		     
		     while(rs.next() == true){
		       int bbsno = rs.getInt("bbsno");    // �÷� -> ������ ��ȯ, DBMS -> JAVA
		       String wname = rs.getString("wname");
		       String title = rs.getString("title");
		       int viewcnt = rs.getInt("viewcnt");
		       String wdate = rs.getString("wdate");
		       int grpno = rs.getInt("grpno");
		       int indent = rs.getInt("indent");
		       int ansnum = rs.getInt("ansnum");
		       
		       BbsDTO dto = new BbsDTO();         // �ϳ��� ���ڵ带 �ϳ��� ��ü�� ��ȯ
		       dto.setBbsno(bbsno);
		       dto.setWname(wname);
		       dto.setTitle(title);
		       dto.setViewcnt(viewcnt);
		       dto.setWdate(wdate);
		       dto.setGrpno(grpno);
		       dto.setIndent(indent);
		       dto.setAnsnum(ansnum);
		       
		       list.add(dto);                     // ����ҿ� �ϳ��� ��ü�� ����
		       
		     }
		   }catch(Exception e){
		     e.printStackTrace();
		   }finally{
		     DBClose.close(con, pstmt, rs);
		   }
		   
		   return list;
		 }
	
	 public int create(BbsDTO dto){
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
		    int cnt = 0;             // return �� ���ڵ� ����
		    
		    sql = new StringBuffer();
		    sql.append(" INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno)");
		    sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), ?, ?, ?, ?, sysdate,");
		    sql.append(" (SELECT NVL(MAX(bbsno), 0) + 1 as grpno FROM bbs))");
		   
		    try{
		     con = DBOpen.getConnection();//���ᰴü
		      pstmt = con.prepareStatement(sql.toString());//���۰�ü
		      pstmt.setString(1, dto.getWname());
		      pstmt.setString(2, dto.getTitle());
		      pstmt.setString(3, dto.getContent());
		      pstmt.setString(4, dto.getPasswd());
		      
		      cnt = pstmt.executeUpdate(); // 0 or 1
		    }catch(Exception e){
		      System.out.println(e.toString());
		    }finally{
		      DBClose.close(con, pstmt);
		    }
		    
		    return cnt;
		  }
 
  
}*/

package model.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import utility.DBClose;
import utility.DBOpen;

public class BbsDAO {
	  /** 
	  * �˻��� ���ڵ� ������ ����  
	  * @param col �˻� �÷� 
	  * @param word �˻��� 
	  * @return �˻��� ���ڵ� ���� 
	  */ 
	    public int total(String col, String word){
	       int total=0;
	       Connection con=null;
	       PreparedStatement pstmt=null;
	       ResultSet rs = null;
	       StringBuffer sql = new StringBuffer();
	       sql.append(" SELECT count(*) FROM bbs ");
	       
	       if(word.trim().length()>0)
	        sql.append(" WHERE "+col+" Like '%'|| ? ||'%'");
	       
	       try {
	           con = DBOpen.getConnection();
	           pstmt = con.prepareStatement(sql.toString());
	           
	           if(word.trim().length()>0)  
	              pstmt.setString(1, word);
	           
	           rs = pstmt.executeQuery();
	           
	           if(rs.next()){
	             total = rs.getInt(1);
	           }
	           
	       } catch (Exception e) {
	           e.printStackTrace();
	       } finally{
	           DBClose.close(con, pstmt, rs);
	       }
	       
	       
	       return total;
	   }
	 
	
	/**
	  * �亯�� ���� ��ȸ
	  * @param bbsno ��ȸ�� �� ��ȣ
	  * @return dto -bbsno,title,grpno,indent,ansnum
	  */
	 public BbsDTO readReply(int bbsno){
	   Connection con = DBOpen.getConnection();
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	   BbsDTO dto = null;        // �ϳ��� �ۿ� �ش�
	   
	   sql = new StringBuffer();
	   sql.append(" SELECT bbsno,title,grpno,indent,ansnum ");
	   sql.append(" FROM bbs");
	   sql.append(" WHERE bbsno = ?");
	  
	   try{
	     pstmt = con.prepareStatement(sql.toString());
	     pstmt.setInt(1, bbsno);
	     
	     rs = pstmt.executeQuery();
	     
	     if(rs.next() == true){
	       String title = rs.getString("title"); 
	       int grpno = rs.getInt("grpno");
	       int indent = rs.getInt("indent");
	       int ansnum = rs.getInt("ansnum");
	       
	       dto = new BbsDTO();         // �ϳ��� ���ڵ带 �ϳ��� ��ü�� ��ȯ
	       dto.setBbsno(bbsno);
	       dto.setTitle(title);
	       dto.setGrpno(grpno);
	       dto.setIndent(indent);
	       dto.setAnsnum(ansnum);
	     
	     }
	   }catch(Exception e){
	     e.printStackTrace();
	   }finally{
	     DBClose.close(con, pstmt, rs);
	   }
	   
	   return dto;
	 }
	 
	  

	/** 
	   * �亯 ���, ����� ���ڵ� ���� ����: 0 , 1 
	   *  
	   * @param dto 
	   *          ������ ��ü 
	   * @return ����� ���ڵ� �� 
	   */ 
	  public int reply(BbsDTO dto) { 
	    Connection con = DBOpen.getConnection(); // DBMS ���� 
	    PreparedStatement pstmt = null; 
	    int cnt = 0; 

	    try { 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" INSERT INTO bbs(bbsno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum)"); 
	      sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), ?, ?, ?, ?, 0, sysdate, ?, ?, ?)"); 

	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setString(1, dto.getWname()); 
	      pstmt.setString(2, dto.getTitle()); 
	      pstmt.setString(3, dto.getContent()); 
	      pstmt.setString(4, dto.getPasswd()); 
	      pstmt.setInt(5, dto.getGrpno()); // �θ��Ǳ׷��ȣ 
	      pstmt.setInt(6, dto.getIndent()+1); 
	      pstmt.setInt(7, dto.getAnsnum()+1); 

	      cnt = pstmt.executeUpdate(); 
	    } catch (Exception e) { 
	      System.out.println(e.toString()); 
	    } finally { 
	      DBClose.close(con, pstmt); 
	    } 

	    return cnt; 
	  } 

	  /** 
	   * �亯 ���� ���� 
	   * @param grpno �׷� ��ȣ 
	   * @param ansnum �亯 ���� 
	   */ 
	  public void addAnsnum(int grpno, int ansnum){ 
	    Connection con = DBOpen.getConnection();  // DBMS ���� 
	    PreparedStatement pstmt = null; 
	     
	    try{ 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" UPDATE bbs"); 
	      sql.append(" SET ansnum = ansnum + 1"); 
	      sql.append(" WHERE grpno=? AND ansnum > ?"); 

	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setInt(1, grpno); 
	      pstmt.setInt(2, ansnum); 

	      pstmt.executeUpdate(); 
	    }catch(Exception e){ 
	      System.out.println(e.toString()); 
	    }finally{ 
	      DBClose.close(con, pstmt); 
	    } 
	     
	  }   

	
	  /**
	   * ���� �����մϴ�.
	   * @param ������ �� ��ȣ
	   * @return ������ ���ڵ� ����
	   */
	  public int delete(int bbsno){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	    int cnt = 0;             // return �� ���ڵ� ����
	    
	    sql = new StringBuffer();
	    sql.append(" DELETE FROM bbs");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	      
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
	  }
	
	 /**
	   * �޸� �����մϴ�.
	   * @param vo ������ �����Ͱ� �ִ� ��ü
	   * @return ����� ���ڵ� ����
	   */
	  public int update(BbsDTO dto){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	    int cnt = 0;             // return �� ���ڵ� ����
	    
	    sql = new StringBuffer();
	    sql.append(" UPDATE bbs");
	    sql.append(" SET wname=?, title=?, content=?");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getWname());
	      pstmt.setString(2, dto.getTitle());
	      pstmt.setString(3, dto.getContent());
	      pstmt.setInt(4, dto.getBbsno());
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
	  }
	 
	  
	
	/**
	   * �н����带 �˻��մϴ�.
	   * @param bbsno �� ��ȣ
	   * @param passwd �н����� 
	   * @return 0: �н����� ��ġ���� ����, 1: �н����� ��ġ
	   */
	  public int checkPasswd(int bbsno, String passwd){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	    int cnt = 0;             // ���ڵ� ����
	    
	    sql = new StringBuffer();
	    sql.append(" SELECT COUNT(bbsno) as cnt");
	    sql.append(" FROM bbs");
	    sql.append(" WHERE bbsno=? AND passwd=?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      pstmt.setString(2, passwd);
	      
	      rs = pstmt.executeQuery();
	      
	      if(rs.next() == true){
	        cnt = rs.getInt(1);
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt, rs);
	    }
	    
	    return cnt;
	  }
	 
	/**
	   * ��ȸ
	   * @param bbsno ��ȸ�� �� ��ȣ
	   * @return
	   */
	  public BbsDTO read(int bbsno){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	    BbsDTO dto = null;        // �ϳ��� �ۿ� �ش�
	    
	    sql = new StringBuffer();
	    sql.append(" SELECT bbsno, wname, title, content, viewcnt, wdate");
	    sql.append(" FROM bbs");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      
	      rs = pstmt.executeQuery();
	      
	      if(rs.next() == true){
	        String title = rs.getString("title");
	        String content = rs.getString("content");
	        String wname = rs.getString("wname");
	        int viewcnt = rs.getInt("viewcnt");
	        String wdate = rs.getString("wdate");
	        
	        dto = new BbsDTO();         // �ϳ��� ���ڵ带 �ϳ��� ��ü�� ��ȯ
	        dto.setBbsno(bbsno);
	        dto.setWname(wname);
	        dto.setTitle(title);
	        dto.setContent(content);
	        dto.setViewcnt(viewcnt);
	        dto.setWdate(wdate);
	      
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt, rs);
	    }
	    
	    return dto;
	  }
	 
	  /**
	   * ��ȸ�� ����
	   * @param memono ��ȸ�� ������ �� ��ȣ
	   */
	  public void increaseViewcnt(int bbsno){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	    
	    sql = new StringBuffer();
	    sql.append(" UPDATE bbs");
	    sql.append(" SET viewcnt = viewcnt + 1");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      
	      pstmt.executeUpdate();
	      
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	  } 
	 /**
	  * ���  
	  * @param col(�˻��÷�-wname,title,content,total),word(�˻���-����Է°�)
	  * @return List ���
	  */
	 public List<BbsDTO> list(String col, String word,int sno, int eno){
	   Connection con = DBOpen.getConnection();
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	   List<BbsDTO> list = null;
	   System.out.print(word);
	   sql = new StringBuffer();
	   sql.append(" SELECT bbsno, wname, title, viewcnt, wdate,grpno,indent,ansnum, r ");
	   sql.append(" FROM ( ");
	   sql.append(" 	SELECT bbsno, wname, title, viewcnt, wdate,grpno,indent,ansnum, rownum as r  ");
	   sql.append(" 	FROM (  ");
	   sql.append(" 		  SELECT bbsno, wname, title, viewcnt, wdate, grpno, indent,ansnum ");
	   sql.append(" 		  FROM bbs   ");
	   
	   if(word.trim().length()>0) //검색어가 존재한다는 의미
		   sql.append(" WHERE "+col+" Like '%'|| ? ||'%' ");
	   
	   sql.append(" ORDER BY grpno DESC, ansnum ");
	   sql.append("     ) ");
	   sql.append(" )where r>=? and r<=? ");
	   
	   try{
		 int i=0;
	     pstmt = con.prepareStatement(sql.toString());
	     
	     if(word.trim().length()>0)
	    	 pstmt.setString(++i, word);
	     
	     pstmt.setInt(++i, sno);
	     pstmt.setInt(++i, eno);
	     
	     rs = pstmt.executeQuery();
	     list = new ArrayList<BbsDTO>();
	     
	     while(rs.next() == true){
	       int bbsno = rs.getInt("bbsno");    // �÷� -> ������ ��ȯ, DBMS -> JAVA
	       String wname = rs.getString("wname");
	       String title = rs.getString("title");
	       int viewcnt = rs.getInt("viewcnt");
	       String wdate = rs.getString("wdate");
	       int grpno = rs.getInt("grpno");
	       int indent = rs.getInt("indent");
	       int ansnum = rs.getInt("ansnum");
	       
	       BbsDTO dto = new BbsDTO();         // �ϳ��� ���ڵ带 �ϳ��� ��ü�� ��ȯ
	       dto.setBbsno(bbsno);
	       dto.setWname(wname);
	       dto.setTitle(title);
	       dto.setViewcnt(viewcnt);
	       dto.setWdate(wdate);
	       dto.setGrpno(grpno);
	       dto.setIndent(indent);
	       dto.setAnsnum(ansnum);
	       
	       list.add(dto);                     // ����ҿ� �ϳ��� ��ü�� ����
	       
	     }
	   }catch(Exception e){
	     e.printStackTrace();
	   }finally{
	     DBClose.close(con, pstmt, rs);
	   }
	   
	   return list;
	 }

	/**
	   * �޸� ����մϴ�.
	   * @param vo ������ �����Ͱ� �ִ� ��ü
	   * @return ����� ���ڵ� ����
	   */
	  public int create(BbsDTO dto){
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String ���� ó�� �ӵ��� ������ ����.
	    int cnt = 0;             // return �� ���ڵ� ����
	    
	    sql = new StringBuffer();
	    sql.append(" INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno)");
	    sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), ?, ?, ?, ?,  sysdate,");
	    sql.append(" (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs))");
	    
	    try{
	      con = DBOpen.getConnection();
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getWname());
	      pstmt.setString(2, dto.getTitle());
	      pstmt.setString(3, dto.getContent());
	      pstmt.setString(4, dto.getPasswd());
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
	  }
}
