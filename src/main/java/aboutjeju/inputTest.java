package aboutjeju;

import java.util.ArrayList;

import dao.AccomodationDAO;
import dao.OwnerDAO;
import vo.AccomodationVO;
import vo.OwnerVO;

public class inputTest {
	public static void main(String[] args) {
		AccomodationDAO dao = new AccomodationDAO();
		AccomodationVO vo = new AccomodationVO();
		
		ProductCrawler pro = new ProductCrawler();
		
	
		ArrayList<String> name = pro.getGuestHouseName();
		ArrayList<String> image = pro.getGuestHouseImage();
		
		for(int i=0;i<name.size();i++) {
			vo.setOno("0000000"+(256+i));
			vo.setAname(name.get(i));
			vo.setAimage(image.get(i));
			vo.setAtype("게스트하우스");
			dao.addOne(vo);
			
		}
		System.out.println(name.size()+":"+image.size());
		
//		OwnerDAO ownerDao = new OwnerDAO();
//		OwnerVO ownerVo = new OwnerVO();
//		
//		for(int i=0;i<100;i++) {
//			ownerVo.setOno("0000000"+(256+i));
//			ownerVo.setOid("testb"+(256+i));
//			ownerVo.setOpw("bbbbbb");
//			ownerVo.setOfindpw("비밀번호찾기질문정답");
//			ownerVo.setOname("백뭐시기테스트용");
//			ownerVo.setOphone("0109999"+(1100+i));
//			
//			ownerDao.addOne(ownerVo);
//		}
	}

}
