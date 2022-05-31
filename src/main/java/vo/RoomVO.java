package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVO {
	int rno;
	int ano;
	String rtype;
	int rcount;
	int price;
	int discount;
	int rpeople;
}