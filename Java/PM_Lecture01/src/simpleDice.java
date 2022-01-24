import mypackage.myDice;

public class simpleDice {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 10;
		myDice DiceA = new myDice();
		System.out.println(DiceA);
		setPassByReference(DiceA);
		System.out.println(DiceA);
	}
	
	public static void setPassByValue(int a) {
		a = 5;
	}
	public static void setPassByReference(myDice a) {
		a.setValue(5);
	}

}
