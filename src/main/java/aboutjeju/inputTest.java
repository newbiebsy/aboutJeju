package aboutjeju;

import java.util.ArrayList;

import dao.AccomodationDAO;

public class inputTest {
	public static void main(String[] args) {
		AccomodationDAO dao = new AccomodationDAO();
		
		ProductCrawler pro = new ProductCrawler();
		
		ArrayList<String> name = pro.getCottageName();
		ArrayList<String> image =  pro.getCottageImage();
		
//		for(int i=0; i<name.size();i++) {
//			dao.addOne(0, "2", name.get(i), null, image.get(i), "게스트하우스", null, null);
//			
//		}
		
			dao.addOne(500, "2", "test2", null, "test2", "게스트하우스", null, null);
		
	}

}
