package utility;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

public class Utility {
	
	public static String getCodeValue(String key) { 
	    Hashtable codes = new Hashtable(); 

	    codes.put("A01", "회사원"); 
	    codes.put("A03", "전산관련직"); 
	    codes.put("A05", "연구전문직"); 
	    codes.put("A07", "각종학교학생"); 
	    codes.put("A09", "일반자영업"); 
	    codes.put("A11", "공무원"); 
	    codes.put("A13", "의료인"); 
	    codes.put("A15", "법조인"); 
	       codes.put("A17", "종교.언론/예술인"); 
	    codes.put("A19", "농업"); 
	    codes.put("A23", "축산업"); 
	    codes.put("A25", "수산업"); 
	    codes.put("A27", "광업"); 
	    codes.put("A30", "주부"); 
	    codes.put("A32", "무직"); 
	    codes.put("A99", "기타"); 
	     
	    Object value = codes.get(key); // A01 ~ A99가 추출 

	    return (String)(value); // 코드값에 해당하는 직업 리턴 
	  }
	
	public static void deleteFile(String upDir, String oldfile){
		File f=new File(upDir, oldfile);
		if(f.exists()){
			f.delete();
		}
	}
	
	/**
	 * 
	 * @return
	 */
    public static List<String> getDay(){
        List<String> list = new ArrayList<String>();
        
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        for(int j = 0; j < 3; j++){
            list.add(sd.format(cal.getTime()));
            cal.add(Calendar.DATE, -1);
        }
        
        return list;
    }
    /**
     * ��ϳ�¥�� ����,����,������¥�� ��
     * @param wdate - ��ϳ�¥
     * @return - true:����,����,������ ��ϳ�¥�� ����
     *           false:����,����,���� ��¥�� ��ϳ�¥�� �� �ٸ�
     */
    public static boolean compareDay(String wdate){
        boolean flag = false;
        List<String> list = getDay();
        if(wdate.equals(list.get(0)) 
           || wdate.equals(list.get(1))
           || wdate.equals(list.get(2))){
            flag = true;
        }
          
        return flag;
    }

	
	  public static String checkNull(String str){
		    String _str;  // ���� ����
		    
		    if (str == null){
		      _str = "";  // null�̸� ������ �Ҵ� 
		    }else{
		      _str = str; // null�� �ƴϸ� ���� ���ڿ� �Ҵ�
		    }
		    
		    return _str;
		  }

}
