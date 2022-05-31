package aboutjeju;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class RoomCrawler {
	// 호텔 url (여기어때 이용)
	String hotel = "https://www.goodchoice.kr/product/result?sort=ACCURACY&keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84&type=&sel_date=2022-07-06&sel_date2=2022-07-07&adcno%5B%5D=2&min_price=&max_price=";
	// 모텔 url (여기어때 이용)
	String motel = "https://www.goodchoice.kr/product/result?sort=ACCURACY&keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84&type=&sel_date=2022-07-06&sel_date2=2022-07-07&adcno%5B%5D=1&min_price=&max_price=";
	// 펜션 url (여기어때 이용)
	String cottage = "https://www.goodchoice.kr/product/result?sort=ACCURACY&keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84&type=&sel_date=2022-07-06&sel_date2=2022-07-07&adcno%5B%5D=3&min_price=&max_price=";
	// 게스트 하우스 url (여기어때 이용)
	String guestHouse = "https://www.goodchoice.kr/product/result?sort=ACCURACY&keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84&type=&sel_date=2022-07-06&sel_date2=2022-07-07&adcno%5B%5D=6&min_price=&max_price=";

	public RoomCrawler() {

	}

	// 각 숙소마다 url 가져오기
	public ArrayList<String> getProductUrl(String url) {
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(url).get();
			Elements contents = doc.select("#poduct_list_area").select("a[href$='07']");
			
			for(Element e : contents) {
				// a태그의 href 값만 가져오기
				String text = e.attr("href");
				list.add(text);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 방 이름 가져오기
	public ArrayList<String> getRoomName(String productUrl) {
		ArrayList<String> list = new ArrayList<String>();

		try {
			// 해당 url에 연결(connect)
			Document doc = Jsoup.connect(productUrl).get();
			// css 선택자 이용해서 원하는 값을 Elements 객체에 담기
			Elements contents = doc.select("div > .title");

			// Elements 객체에 담긴 Element 들을 for문 이용해서 list에 넣기
			for (Element e : contents) {
				// 호텔이름만 분리해서 가져오기
				list.add(e.text());
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 첫번째 이미지 가져오기
	public ArrayList<String> getRoomImage1(String productUrl) {

		ArrayList<String> list = new ArrayList<String>();

		try {
			// 해당 url에 연결(connect)
			Document doc = Jsoup.connect(productUrl).get();

			// css 선택자 이용해서 원하는 값을 Elements 객체에 담기
			Elements contents = doc.getElementsByClass("item on").select("li:nth-child(1)");

			// Elements 객체에 담긴 Element 들을 for문 이용해서 list에 넣기
			for (Element e : contents) {
				list.add(e.toString().split("data-src=\"")[1].split("\" alt")[0]);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 두번째 이미지 가져오기
	public ArrayList<String> getRoomImage2(String productUrl) {

		ArrayList<String> list = new ArrayList<String>();

		try {
			// 해당 url에 연결(connect)
			Document doc = Jsoup.connect(productUrl).get();

			// css 선택자 이용해서 원하는 값을 Elements 객체에 담기
			Elements contents = doc.getElementsByClass("item on").select("li:nth-child(2)");

			// Elements 객체에 담긴 Element 들을 for문 이용해서 list에 넣기
			for (Element e : contents) {
				list.add(e.toString().split("data-src=\"")[1].split("\" alt")[0]);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 숙소정보 가져오기
	public ArrayList<String> getRoomInfo(String productUrl) {

		ArrayList<String> list = new ArrayList<String>();

		try {
			// 해당 url에 연결(connect)
			Document doc = Jsoup.connect(productUrl).get();

			// css 선택자 이용해서 원하는 값을 Elements 객체에 담기
			Elements contents = doc.select(".default_info");

			// Elements 객체에 담긴 Element 들을 for문 이용해서 list에 넣기
			for (Element e : contents) {
				list.add(e.toString().replace("<div class=\"comment_mobile\">", "")
								.replace("<div class=\"map\" id=\"google_maps\">", "")
									.replace("<section class=\"default_info\"><!-- 사장님 한마디 & 추천이유 -->", "")
										.replace("<br>", "").replace("\\", "").replace("</section>", "")
											.replace("&gt;", ">").replace("</div>", "").replace("사장님 한마디 ", "사장님 한마디 \n   ")
												.replace("&amp;", "&"));
				
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 방마다 가격 가져오기 (모텔은 대실,숙박 2개라서 방개수보다 많은 가격을 구해오기 때문에 사용 주의..!)
	public ArrayList<String> getPrice(String productUrl){
		ArrayList<String> list = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(productUrl).get();
			Elements contents = doc.select(".price > div> p > b");
			
			for(Element e : contents) {
				list.add(e.text().replace(",", "").replace("원",""));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	} // getPrice() end
	
	
	// 숙소 리뷰(베스트리뷰x) 가져오기 (미완)
	public ArrayList<String> getReview(String productUrl){
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			Document doc = Jsoup.connect(productUrl).get();
			Elements contents = doc.select("div[class='txt']");
			
			// 리뷰 10개만 가져오기
			for(Element e : contents) {
				list.add(e.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
