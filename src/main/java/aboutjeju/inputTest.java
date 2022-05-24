package aboutjeju;

import java.util.ArrayList;

import dao.AccomodationDAO;
import vo.AccomodationVO;

public class inputTest {
	public static void main(String[] args) {
		AccomodationDAO dao = new AccomodationDAO();
		AccomodationVO vo = new AccomodationVO();
		
		ProductCrawler pro = new ProductCrawler();
		
		ArrayList<String> name = pro.getCottageName();
		ArrayList<String> image =  pro.getCottageImage();
		
		for(int i=0; i<name.size();i++) {
//			0, "2", name.get(i), null, image.get(i), "게스트하우스", null, null
			vo.setOno("2");
			vo.setAname(name.get(i));
			vo.setAname(image.get(i));
			vo.setAtype("게스트하우스");
			dao.addOne(vo);
			
		}
		
		
	}

}
