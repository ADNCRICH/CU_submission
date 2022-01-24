package main;

public class FlowChart {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x = 0, y = 0, z = 0, n = 5;
		while (x <= n) {
			y = 0;
			while (y <= x)
				y += 1;
			x += 1;z+=y;
			
		}
		System.out.println(x+" "+y+" "+z+5);
	}

}
