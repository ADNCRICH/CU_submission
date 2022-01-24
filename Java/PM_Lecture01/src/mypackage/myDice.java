package mypackage;

public class myDice {
	final static int MAX = 6;
	private int value;

	public myDice() {
		this.value = 1;
	}

	public myDice(int v) {
		this.value = v;
	}

	public int roll() {
		return (int) (Math.random() * MAX) + 1;
	}

	public int getValue() {
		return this.value;
	}

	public void setValue(int x) {
		if (x < 1)
			x = 1;
		if (x > MAX)
			x = MAX;
		this.value = x;
	}

	public String toString() {
		return "This is " + this.value;
	}

	public boolean equals(Object o) {
		myDice otherDice = (myDice) o;
		if (this.value == otherDice.value)
			return true;
		else
			return false;
	}

}
