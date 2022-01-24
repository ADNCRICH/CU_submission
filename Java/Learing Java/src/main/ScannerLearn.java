package main;
import java.security.Principal;
import java.util.Scanner;

public class ScannerLearn {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		double a = s.nextDouble(), b = s.nextDouble();
		System.out.println(Math.sin(Math.toRadians(b))*a + " " + Math.cos(Math.toRadians(b))*a);
		
	}	
	

}
