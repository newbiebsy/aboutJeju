package aboutjeju;

import dao.OwnerDAO;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		OwnerDAO dao = new OwnerDAO();

		for (int i = 0; i <= 8; i++) {
			for (int j = 0; j <= 9; j++) {
				dao.insertOne("aaa" + i + j);
			}
		}

	}

}
