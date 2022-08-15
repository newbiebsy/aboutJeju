package crawler;

import java.util.ArrayList;

public class CrawlerTest {
	public static void main(String[] args) {
		
		ProductCrawler test1 = new ProductCrawler();
		
		
		ArrayList<String> list1 = test1.getHotelName();
		ArrayList<String> list2 = test1.getHotelImage();
		
		for(String x : list1) {
			System.out.println(x);
		}
		
		System.out.println(list1.size());
		System.out.println(list2.size());
		
		
		// room 첫번째 이미지 가져오기
//		RoomCrawler test2 = new RoomCrawler();
//		
//		ArrayList<String> list3 = test2.getRoomImage1("https://www.goodchoice.kr/product/detail?ano=67563&adcno=2&sel_date=2022-07-06&sel_date2=2022-07-07");
//		
//		for(String x : list3) {
//			System.out.println("roomimage1 : "+x);
//		}
//		System.out.println("roomimage1 : "+list3.size());
//		System.out.println("---------------------------------------------");
//		
//		// room 두번째 이미지 가져오기
//		RoomCrawler test3 = new RoomCrawler();
//		
//		ArrayList<String> list4 = test3.getRoomImage2("https://www.goodchoice.kr/product/detail?ano=67563&adcno=2&sel_date=2022-07-06&sel_date2=2022-07-07");
//		
//		for(String x : list4) {
//			System.out.println("roomimage2 : "+x);
//		}
//		System.out.println("roomimage2 : "+list4.size());
//		
//		RoomCrawler test4 = new RoomCrawler();
//		
//		ArrayList<String> list5 = test4.getRoomName("https://www.goodchoice.kr/product/detail?ano=68550&adcno=2&sel_date=2022-07-06&sel_date2=2022-07-07");
//		
//		for(String x : list5) {
//			System.out.println(x);
//		}
//		System.out.println(list5.size());
		
		RoomCrawler test5 = new RoomCrawler();
		
		ArrayList<String> list6 = test5.getRoomInfo("https://www.goodchoice.kr/product/detail?ano=65825&adcno=2&sel_date=2022-07-06&sel_date2=2022-07-07");
		
		for(String x : list6) {
			System.out.println(x);
		}
		System.out.println(list6.size());
		
		
		
	} // main() end
	
}
