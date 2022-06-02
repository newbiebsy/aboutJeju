package aboutjeju;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup; // << Jsoup 라이브러리 다운 받고 lib에 추가 (https://jsoup.org 에서 다운 가능)
						
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ProductCrawler {
	// 호텔 url (여기어때 이용)
	String hotel = "https://www.goodchoice.kr/product/result?sort=ACCURACY&keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84&type=&sel_date=2022-07-06&sel_date2=2022-07-07&adcno%5B%5D=2&min_price=&max_price=";
	// 모텔 url (여기어때 이용)
	String motel = "https://www.goodchoice.kr/product/result?sort=ACCURACY&keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84&type=&sel_date=2022-07-06&sel_date2=2022-07-07&adcno%5B%5D=1&min_price=&max_price=";
	// 펜션 url (여기어때 이용)
	String cottage = "https://www.goodchoice.kr/product/result?sort=ACCURACY&keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84&type=&sel_date=2022-07-06&sel_date2=2022-07-07&adcno%5B%5D=3&min_price=&max_price=";
	// 게스트 하우스 url (여기어때 이용)
	String guestHouse = "https://www.goodchoice.kr/product/result?sort=ACCURACY&keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84&type=&sel_date=2022-07-06&sel_date2=2022-07-07&adcno%5B%5D=6&min_price=&max_price=";

	
	
	public ProductCrawler() {
		
	}

	// hotel 이름 ArrayList로 반환
	public ArrayList<String> getHotelName(){
		
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			// 해당 url에 연결(connect)
			Document doc = Jsoup.connect(hotel).get();
			// css 선택자 이용해서 원하는 값을 Elements 객체에 담기
			Elements contents = doc.select(".lazy");
			
			// Elements 객체에 담긴 Element 들을 for문 이용해서 list에 넣기 
			for(Element e : contents) {
				// 호텔이름만 분리해서 가져오기
				list.add(e.toString().replace("\"", "").replace(">","").split("alt=")[1]
																			.replace("&amp;", "&"));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// hotel 대표이미지 ArrayList로 반환
	public ArrayList<String> getHotelImage(){
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(hotel).get();
			Elements contents = doc.select(".lazy");
			
			for(Element e : contents) {
				// 호텔 이미지 가져오기
				list.add(e.toString().split("data-original=\"")[1].split("\" src")[0]);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// motel 이름 ArrayList로 반환
	public ArrayList<String> getMotelName(){
		
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			// 해당 url에 연결(connect)
			Document doc = Jsoup.connect(motel).get();
			// css 선택자 이용해서 원하는 값을 Elements 객체에 담기
			Elements contents = doc.select(".lazy");
			
			// Elements 객체에 담긴 Element 들을 for문 이용해서 list에 넣기 
			for(Element e : contents) {
				// 모텔이름만 분리해서 가져오기
				list.add(e.toString().replace("\"", "").replace(">","").split("alt=")[1]
													.replace("호텔", "모텔").replace("&amp;", "&"));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	// motel 대표이미지 ArrayList로 반환
	public ArrayList<String> getMotelImage(){
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(motel).get();
			Elements contents = doc.select(".lazy");
			
			for(Element e : contents) {
				// 모텔 이미지 가져오기
				list.add(e.toString().split("data-original=\"")[1].split("\" src")[0]);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 펜션 이름 
	public ArrayList<String> getCottageName(){
		
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(cottage).get();
			Elements contents = doc.select(".lazy");
			
			for(Element e : contents) {
				
				list.add(e.toString().replace("\"", "").replace(">","").split("alt=")[1]
																		.replace("&amp;", "&"));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 펜션 이미지
	public ArrayList<String> getCottageImage(){
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(cottage).get();
			Elements contents = doc.select(".lazy");
			
			for(Element e : contents) {
				
				list.add(e.toString().split("data-original=\"")[1].split("\" src")[0]);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 게스트하우스 이름 
	public ArrayList<String> getGuestHouseName(){
		
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(guestHouse).get();
			Elements contents = doc.select(".lazy");
			
			for(Element e : contents) {
				
				list.add(e.toString().replace("\"", "").replace(">","").split("alt=")[1]
																		.replace("&amp;", "&"));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 게스트하우스 이미지
	public ArrayList<String> getGuestHouseImage(){
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(guestHouse).get();
			Elements contents = doc.select(".lazy");
			
			for(Element e : contents) {
				
				list.add(e.toString().split("data-original=\"")[1].split("\" src")[0]);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

	





}

