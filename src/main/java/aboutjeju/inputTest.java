package aboutjeju;

import java.util.ArrayList;

import dao.AccomodationDAO;
import dao.OwnerDAO;
import dao.RoomDAO;
import dao.RoomDetailDAO;
import vo.AccomodationVO;
import vo.OwnerVO;
import vo.RoomDetailVO;
import vo.RoomVO;

public class inputTest {
	public static void main(String[] args) {
//		AccomodationDAO dao = new AccomodationDAO();
//		AccomodationVO vo = new AccomodationVO();

		ProductCrawler pro = new ProductCrawler();
		RoomCrawler room = new RoomCrawler();

		RoomDAO roomDao = new RoomDAO();
		RoomVO roomVo = new RoomVO();

		RoomDetailDAO roomDetailDao = new RoomDetailDAO();
		RoomDetailVO roomDetailVo = new RoomDetailVO();

		ArrayList<String> productUrl = room.getProductUrl(room.cottage);

		int test = 1926;
		for (int i = 0; i < productUrl.size(); i++) {
//			ArrayList<String> roomImage1 = room.getRoomImage1(productUrl.get(i));
			ArrayList<String> roomImage2 = room.getRoomImage2(productUrl.get(i));
			
			
//			System.out.println("roomImage1 size : "+roomImage1.size());
			System.out.println("roomImage2 size : "+roomImage2.size());
			for (int j = 0; j < roomImage2.size(); j++) {
				test+=1;
				roomDetailVo.setRno(test);
				roomDetailVo.setRimage(roomImage2.get(j));
				roomDetailDao.insertImage(roomDetailVo);
				
//				System.out.println(roomImage1.get(j));
				System.out.println(test);
				System.out.println(roomImage2.get(j));
				
			}
		}

		// roomdetail에 정보 넣음

		// room 테이블에 정보 넣음
//		for(int i=0;i<productUrl.size();i++) {
//			ArrayList<String> roomName = room.getRoomName(productUrl.get(i));
//			ArrayList<String> roomPrice = room.getPrice(productUrl.get(i));
//
////			if(roomName.size() < roomPrice.size()) {
////				int a = roomPrice.size() - roomName.size();
////				for(int z=0;z<a;z++) {
////					roomPrice.remove(z);
////				}
////			}
////			System.out.println("roomName size : "+roomPrice.size());
////			System.out.println("roomPrice size : "+roomPrice.size());
////			System.out.println("===========================");
//			for(int j=0; j<roomPrice.size();j++) {
//				int random = ((j+1)%2==0)? 2:4;
//				roomVo.setAno(i+261);
//				roomVo.setRtype(roomName.get(j));
//				roomVo.setRcount(4);
//				roomVo.setPrice(Integer.parseInt(roomPrice.get(j)));
//				roomVo.setRpeople(random);
//				roomDao.insertRoom(roomVo);
////				System.out.println(roomName.get(j));
////				System.out.println(roomPrice.get(j));
//			}
//			
//		}
//		System.out.println(productUrl.size());

//		ArrayList<String> name = pro.getGuestHouseName();
//		ArrayList<String> image = pro.getGuestHouseImage();
//		
//		String test = "0000000";
//		
//		for(int i=0;i<name.size();i++) {
////			if(i>47) {
////			test ="0000000";
////			}
//			vo.setOno(test+(i+258));
//			vo.setAname(name.get(i));
//			vo.setAimage(image.get(i));
//			vo.setAtype("게스트하우스");
//			dao.addOne(vo);
//			
//		}
//		System.out.println(name.size()+":"+image.size());

//		OwnerDAO ownerDao = new OwnerDAO();
//		OwnerVO ownerVo = new OwnerVO();
//		
//		for(int i=0;i<45;i++) {
//			ownerVo.setOno("0000000"+(356+i));
//			ownerVo.setOid("testb"+(356+i));
//			ownerVo.setOpw("bbbbbb");
//			ownerVo.setOfindpw("비밀번호찾기질문정답");
//			ownerVo.setOname("백뭐시기테스트용");
//			ownerVo.setOphone("0108888"+(4444+i));
//			
//			ownerDao.addOne(ownerVo);
//		}

	}

}
