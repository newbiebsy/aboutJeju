package aboutjeju;

import java.util.ArrayList;

import dao.AccomodationDAO;
import vo.AccomodationVO;

public class DaoTest {
	public static void main(String[] args) {
		
		 
		
		AccomodationDAO dao = new AccomodationDAO();
		ArrayList<AccomodationVO> list = dao.selectSort("호텔",12 ,"starsort");
		
		for(AccomodationVO vo : list) {
			System.out.println(vo.getAno()+ ":"+vo.getAname()+":"+vo.getAtype());
			
		}
	}
}
