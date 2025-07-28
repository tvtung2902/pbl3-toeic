package com.pbl3.libs;

import java.util.ArrayList;
import com.pbl3.model.QuestionModel;

public class Count {
	public static Result count(ArrayList<Pair<QuestionModel, String>> pairs) {
		int scoreListening = 0;
		int scoreReading = 0;
		int rightAnswerListening = 0;
		int rightAnswerReading = 0;
		int wrongAnswer = 0;
		int skip = 0;
		for (int i = 0; i < pairs.size(); i++) {  
				// neu co chon dap an: getSecond != null
				if (pairs.get(i) != null && pairs.get(i).getSecond() != null) {
					// neu chon dung dap an
					if (pairs.get(i).getFirst().getAnswerCorrect().equals(pairs.get(i).getSecond())) {
						// neu nghe
						if (i <= 99) {
							rightAnswerListening++;
						}
						// neu doc
						else {
							rightAnswerReading++;
						}
					}
					// neu chon sai dap an
					else {
						wrongAnswer++;
					}
				}
				// neu bo qua
				else {
					skip++;
				}
		}

		System.out.println("so cau dung listening: " + rightAnswerListening + "so cau dung reading:  "
				+ rightAnswerReading + "so cau sai: " + wrongAnswer + " so cau bo qua: " + skip);
		//
		if ((0 <= rightAnswerListening) && (rightAnswerListening <= 6)) {
			scoreListening += 5;
		} else if (7 <= rightAnswerListening && (rightAnswerListening <= 25)) {
			scoreListening += (rightAnswerListening - 5) * 5;
		} else if (26 <= rightAnswerListening && (rightAnswerListening <= 34)) {
			scoreListening += (rightAnswerListening - 4) * 5;
		} else if (35 <= rightAnswerListening && (rightAnswerListening <= 43)) {
			scoreListening += (rightAnswerListening - 3) * 5;
		} else if (44 <= rightAnswerListening && (rightAnswerListening <= 46)) {
			scoreListening += (rightAnswerListening - 2) * 5;
		} else if (rightAnswerListening == 47) {
			scoreListening += (rightAnswerListening - 1) * 5;
		} else if (48 <= rightAnswerListening && (rightAnswerListening <= 52)) {
			scoreListening += (rightAnswerListening) * 5;
		} else if (53 <= rightAnswerListening && (rightAnswerListening <= 55)) {
			scoreListening += (rightAnswerListening + 1) * 5;
		} else if (56 <= rightAnswerListening && (rightAnswerListening <= 58)) {
			scoreListening += (rightAnswerListening + 2) * 5;
		} else if (59 <= rightAnswerListening && (rightAnswerListening <= 63)) {
			scoreListening += (rightAnswerListening + 3) * 5;
		} else if (64 <= rightAnswerListening && (rightAnswerListening <= 66)) {
			scoreListening += (rightAnswerListening + 4) * 5;
		} else if (67 <= rightAnswerListening && (rightAnswerListening <= 69)) {
			scoreListening += (rightAnswerListening + 5) * 5;
		} else if (70 <= rightAnswerListening && (rightAnswerListening <= 76)) {
			scoreListening += (rightAnswerListening + 6) * 5;
		} else if (77 <= rightAnswerListening && (rightAnswerListening <= 79)) {
			scoreListening += (rightAnswerListening + 7) * 5;
		} else if (80 <= rightAnswerListening && (rightAnswerListening <= 82)) {
			scoreListening += (rightAnswerListening + 8) * 5;
		} else if (83 <= rightAnswerListening && (rightAnswerListening <= 89)) {
			scoreListening += (rightAnswerListening + 9) * 5;
		} else if (90 <= rightAnswerListening && (rightAnswerListening <= 100)) {
			scoreListening += 495;
		}
		//
		System.out.println("diem listening: " + scoreListening);

		//
		if ((0 <= rightAnswerReading) && (rightAnswerReading <= 15)) {
			scoreReading += 5;
		} else if (16 <= rightAnswerReading && (rightAnswerReading <= 24)) {
			scoreReading += (rightAnswerReading - 14) * 5;
		} else if (25 <= rightAnswerReading && (rightAnswerReading <= 27)) {
			scoreReading += (rightAnswerReading - 13) * 5;
		} else if (28 <= rightAnswerReading && (rightAnswerReading <= 32)) {
			scoreReading += (rightAnswerReading - 12) * 5;
		} else if (33 <= rightAnswerReading && (rightAnswerReading <= 37)) {
			scoreReading += (rightAnswerReading - 11) * 5;
		} else if (38 <= rightAnswerReading && (rightAnswerReading <= 40)) {
			scoreReading += (rightAnswerReading - 10) * 5;
		} else if (41 <= rightAnswerReading && (rightAnswerReading <= 45)) {
			scoreReading += (rightAnswerReading - 9) * 5;
		} else if (46 <= rightAnswerReading && (rightAnswerReading <= 48)) {
			scoreReading += (rightAnswerReading - 8) * 5;
		} else if (49 <= rightAnswerReading && (rightAnswerReading <= 55)) {
			scoreReading += (rightAnswerReading - 7) * 5;
		} else if (56 <= rightAnswerReading && (rightAnswerReading <= 60)) {
			scoreReading += (rightAnswerReading - 6) * 5;
		} else if (61 <= rightAnswerReading && (rightAnswerReading <= 63)) {
			scoreReading += (rightAnswerReading - 5) * 5;
		} else if (64 <= rightAnswerReading && (rightAnswerReading <= 66)) {
			scoreReading += (rightAnswerReading - 4) * 5;
		} else if (67 <= rightAnswerReading && (rightAnswerReading <= 71)) {
			scoreReading += (rightAnswerReading - 3) * 5;
		} else if (72 <= rightAnswerReading && (rightAnswerReading <= 76)) {
			scoreReading += (rightAnswerReading - 2) * 5;
		} else if (77 <= rightAnswerReading && (rightAnswerReading <= 88)) {
			scoreReading += (rightAnswerReading - 1) * 5;
		} else if (89 <= rightAnswerReading && (rightAnswerReading <= 91)) {
			scoreReading += (rightAnswerReading - 0) * 5;
		} else if (92 <= rightAnswerReading && (rightAnswerReading <= 93)) {
			scoreReading += (rightAnswerListening + 1) * 5;
		} else if (94 <= rightAnswerReading && (rightAnswerReading <= 96)) {
			scoreReading += (rightAnswerReading + 2) * 5;
		} else if (97 <= rightAnswerReading && (rightAnswerReading <= 100)) {
			scoreReading += 495;
		}
		System.out.println("diem reading: " + scoreReading);
		Result result = new Result(scoreListening, scoreReading, rightAnswerListening, rightAnswerReading, wrongAnswer, skip);
		return result;

	}
}
