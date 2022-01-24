package main;

public class ABC {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i = 0, j = 0, k = 0;
		for(i=0;i<16;i++)
			for(j=0;j<16;j++)
				for(k=0;k<16;k++) {
					if(i*i +j*j +k*k == 200)
						System.out.println(i+" "+j+" "+k);
				}
	}

}
