package logic;

import java.util.Scanner;

public class FoodOrder {

	// Fields: description, price, chicken, vegetable, extraChicken, extraRice
	// START CODE HERE
	private String description;
	private int price;
	private boolean hasChicken;
	private boolean hasVegetable;
	private boolean hasExtraChicken;
	private boolean hasExtraRice;

	// END CODE HERE

	// Constructor
	// START CODE HERE
	public FoodOrder() {
		this.description = "Hainanese Chicken rice";
		this.hasChicken = true;
		this.hasVegetable = true;
		this.hasExtraChicken = false;
		this.hasExtraRice = false;
	}
	// END CODE HERE

	// Methods
	// START CODE HERE
	public String getDescription() {
		return this.description;
	}

	public int getPrice() {
		return this.price;
	}

	public void calculatePrice() {
		this.price = 40;
		if (!this.hasChicken)
			this.price -= 10;
		if (this.hasExtraChicken)
			this.price += 10;
		if (this.hasExtraRice)
			this.price += 5;
	}

	public void setHasChicken(boolean x) {
		this.hasChicken = x;
		calculatePrice();
	}

	public void setHasVegetable(boolean x) {
		this.hasVegetable = x;
		calculatePrice();
	}

	public void setHasExtraChicken(boolean x) {
		this.hasExtraChicken = x;
		calculatePrice();
	}

	public void setHasExtraRice(boolean x) {
		this.hasExtraRice = x;
		calculatePrice();
	}
	// END CODE HERE

	@Override
	public String toString() {
		// START CODE HERE

		return "That would be " + String.valueOf(this.price) + " bath. Thanks!\n" + String.valueOf(this.hasChicken);
		// END CODE HERE
	}

	@Override
	public boolean equals(Object other) {
		// START CODE HERE
		return false;
		// END CODE HERE
	}

	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);
		FoodOrder foodOrder = new FoodOrder();
		System.out.println("Hi, Welcome to Kao-Mun-Gai food stall!");
		System.out.println("We only sell " + foodOrder.getDescription());
		System.out.println("Would you like your meal with chicken? (Yes/No)");
		String customerInput = keyboard.next();
		if (customerInput.equals("No")) {
			foodOrder.setHasChicken(false);
			System.out.println("Okay...");
		} else if (customerInput.equals("Yes")) {
			foodOrder.setHasChicken(true);
		}
		System.out.println("Would you like your meal with vegetable? (Yes/No)");
		customerInput = keyboard.next();
		if (customerInput.equals("No")) {
			foodOrder.setHasVegetable(false);
		} else if (customerInput.equals("Yes")) {
			foodOrder.setHasVegetable(true);
		}
		System.out.println("Extra chicken? (Yes/No)");
		customerInput = keyboard.next();
		if (customerInput.equals("Yes")) {
			foodOrder.setHasExtraChicken(true);
			System.out.println("Good Choice!");
		} else if (customerInput.equals("No")) {
			foodOrder.setHasExtraChicken(false);
		}
		System.out.println("Extra Rice? (Yes/No)");
		customerInput = keyboard.next();
		if (customerInput.equals("Yes")) {
			foodOrder.setHasExtraRice(true);
		} else if (customerInput.equals("No")) {
			foodOrder.setHasExtraRice(false);
		}

		System.out.println(foodOrder);

		// Uncomment the following lines to test equals method
		// FoodOrder testOrder = new FoodOrder();
		// testOrder.setHasChicken(false);
		// testOrder.setHasExtraChicken(false);
		// testOrder.setHasExtraRice(true);
		// FoodOrder testOrder2 = new FoodOrder();
		// testOrder2.setHasChicken(false);
		// testOrder2.setHasExtraChicken(false);
		// testOrder2.setHasExtraRice(true);
		// System.out.println("Equal:" + testOrder.equals(testOrder2));
	}

}
/*

Yes
Yes
Yes
Yes

*/