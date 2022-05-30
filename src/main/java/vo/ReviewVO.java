package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO {
	int reviewno;
	int bno;
	int ano;
	String title;
	String contents;
	int star;
	String date;
	String comment;


}