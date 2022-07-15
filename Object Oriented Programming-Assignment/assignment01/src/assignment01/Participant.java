package assignment01;

public class Participant {
	String name;
	Integer number;
	public Participant(String name, Integer number) {
		this.name = name;
		this.number = number;
	}
	
	public String toString() {
		return "Name: " + this.name + ", " + this.number;
	}

}
