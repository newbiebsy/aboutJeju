package vo;

public class CustomerVO {
	int cno;
	String cid;
	String cpw;
	String cfindpw;
	String cname;
	String cphone;

	public CustomerVO(int cno, String cid, String cpw, String cfindpw, String cname, String cphone) {
		super();
		this.cno = cno;
		this.cid = cid;
		this.cpw = cpw;
		this.cfindpw = cfindpw;
		this.cname = cname;
		this.cphone = cphone;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCpw() {
		return cpw;
	}

	public void setCpw(String cpw) {
		this.cpw = cpw;
	}

	public String getCfindpw() {
		return cfindpw;
	}

	public void setCfindpw(String cfindpw) {
		this.cfindpw = cfindpw;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCphone() {
		return cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

}
