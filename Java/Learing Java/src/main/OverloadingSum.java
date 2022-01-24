package main;

import java.util.Scanner;

public class OverloadingSum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int n, a, b = 0, c = 0;
		n = sc.nextInt();
		a = sc.nextInt();
		if (n > 1)
			b = sc.nextInt();
		if (n > 2)
			c = sc.nextInt();
		int r = (n == 1) ? sum(a) : (n == 2) ? sum(a, b) : sum(a, b, c);
		System.out.println(r);
	}

	public static int sum(int a) {
		int s = 0;
		for (int i = 0; i <= a; i++)
			s += i;
		return s;
	}

	public static int sum(int a, int b) {
		int s = 0;
		for (int i = 1; i <= b; i++)
			s += i;
		return s;
	}

	public static int sum(int a, int b, int c) {
		int s = 0;
		for (int i = a; i <= b; i += c)
			s += i;
		return s;
	}

}
