package vo;

public class RoomDetailVO {

	int rdno;
	int rno;
	String rimage;

	public RoomDetailVO(int rdno, int rno, String rimage) {
		super();
		this.rdno = rdno;
		this.rno = rno;
		this.rimage = rimage;
	}

	public int getRdno() {
		return rdno;
	}

	public void setRdno(int rdno) {
		this.rdno = rdno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRimage() {
		return rimage;
	}

	public void setRimage(String rimage) {
		this.rimage = rimage;
	}

}