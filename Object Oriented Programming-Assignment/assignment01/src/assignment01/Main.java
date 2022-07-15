package assignment01;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
	
	ArrayList<Participant> participants = new ArrayList<>();
	
	public Main() {
		
		Participant s1 = new Participant("Johnny", 20_000);
		System.out.println(s1);
		Participant s2 = new Participant("Test", 100_000);
		System.out.println(s2);
		
		participants.add(s1);
		participants.add(s2);
		System.out.println(participants);
		
		System.out.println("\r\n"
				+ " _______      ___             _______  __   __  _______  ______    _______ \r\n"
				+ "|  _    |    |   |           |       ||  | |  ||   _   ||    _ |  |       |\r\n"
				+ "| |_|   |    |   |   ____    |  _____||  |_|  ||  |_|  ||   | ||  |    ___|\r\n"
				+ "|       |    |   |  |____|   | |_____ |       ||       ||   |_||_ |   |___ \r\n"
				+ "|  _   |  ___|   |           |_____  ||       ||       ||    __  ||    ___|\r\n"
				+ "| |_|   ||       |            _____| ||   _   ||   _   ||   |  | ||   |___ \r\n"
				+ "|_______||_______|           |_______||__| |__||__| |__||___|  |_||_______|\r\n"
				+ "");
		
		Scanner scan = new Scanner(System.in);
		int menu;
		do {
			System.out.println("+======================+");
			System.out.println("+Options               +");
			System.out.println("+======================+");
			System.out.println("+1. Start Sharing      +");
			System.out.println("+2. Update Participant +");
			System.out.println("+3. Delete Participant +");
			System.out.println("+4. Close App          +");
			System.out.println("+======================+");
			System.out.print("Choice >> ");
			menu = scan.nextInt();
			switch(menu) {
			case 1:
				Integer number;
				do {
					System.out.print("Input a number [0 - 100]: ");
					number = scan.nextInt(); scan.nextLine();
				}while(number < 0 || number > 100);
				break;
			case 2:
				break;
			case 3:
				break;
			case 4:
				System.exit(0);
				break;
			}
		}while(menu < 1 || menu > 4);
		
		scan.close();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
	}

}
