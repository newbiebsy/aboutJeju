package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OwnerVO {
	String ono;
	String oid;
	String opw;
	String ofindpw;
	String oname;
	String ophone;

	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getOpw() {
		return opw;
	}

	public void setOpw(String opw) {
		this.opw = opw;
	}

	public String getOfindpw() {
		return ofindpw;
	}

	public void setOfindpw(String ofindpw) {
		this.ofindpw = ofindpw;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
	}

}
