package main;

import java.util.Scanner;

public class Month {

	public static void itomonth(int x) {
		// TODO Auto-generated method stub
		switch (x) {
		case 1:
			System.out.println("Jan");
			break;
		case 2:
			System.out.println("Feb");
			break;
		case 3:
			System.out.println("Mar");
			break;
		case 4:
			System.out.println("Apr");
			break;
		case 5:
			System.out.println("May");
			break;
		case 6:
			System.out.println("Jun");
			break;
		case 7:
			System.out.println("Jul");
			break;
		case 8:
			System.out.println("Aug");
			break;
		case 9:
			System.out.println("Sep");
			break;
		case 10:
			System.out.println("Oct");
			break;
		case 11:
			System.out.println("Nov");
			break;
		case 12:
			System.out.println("Dec");
			break;
		default:
			System.out.println("wat");
			return;
		}
	}

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		itomonth(s.nextInt());
	}

}
