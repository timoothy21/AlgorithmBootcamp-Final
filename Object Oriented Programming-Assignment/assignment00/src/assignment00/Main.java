package assignment00;

import java.util.Scanner;

public class Main {

	public Main() {
		// TODO Auto-generated constructor stub
		System.out.println("\r\n"
				+ " /$$$$$$$     /$$$$$                        /$$$$$ /$$$$$$$  /$$$$$$$$        /$$       /$$          \r\n"
				+ "| $$__  $$   |__  $$                       |__  $$| $$__  $$|__  $$__/       | $$      | $$          \r\n"
				+ "| $$  \\ $$      | $$                          | $$| $$  \\ $$   | $$  /$$$$$$ | $$$$$$$ | $$  /$$$$$$ \r\n"
				+ "| $$$$$$$       | $$       /$$$$$$            | $$| $$$$$$$/   | $$ |____  $$| $$__  $$| $$ /$$__  $$\r\n"
				+ "| $$__  $$ /$$  | $$      |______/       /$$  | $$| $$____/    | $$  /$$$$$$$| $$  \\ $$| $$| $$$$$$$$\r\n"
				+ "| $$  \\ $$| $$  | $$                    | $$  | $$| $$         | $$ /$$__  $$| $$  | $$| $$| $$_____/\r\n"
				+ "| $$$$$$$/|  $$$$$$/                    |  $$$$$$/| $$         | $$|  $$$$$$$| $$$$$$$/| $$|  $$$$$$$\r\n"
				+ "|_______/  \\______/                      \\______/ |__/         |__/ \\_______/|_______/ |__/ \\_______/\r\n"
				+ "                                                                                                     \r\n"
				+ "");
		
		Scanner scan = new Scanner(System.in);
		int menu;
		do {
			System.out.println("1. Start The Simulation!!");
			System.out.println("2. Close App");
			System.out.print(">> ");
			menu = scan.nextInt(); scan.nextLine();
			switch(menu) {
			case 1:
				Integer number1;
				do {
					System.out.print("Input the first number [1 - 100](inclusive): ");
					number1 = scan.nextInt(); scan.nextLine();
				}while(!(number1 >= 1 && number1 <= 100));
				
				Integer number2;
				do {
					System.out.print("Input the second number [1 - 100](inclusive): ");
					number2 = scan.nextInt(); scan.nextLine();
				}while(!(number2 >= 1 && number2 <= 100));
				
				System.out.println("+==========================================================================================================================+");
				System.out.println("+   + (String type)  |  (Character Type)  |  * (Integer type)  |  / (Floating Type)  |  input 1 == input 2 (Boolean Type)  +");
				System.out.println("+==========================================================================================================================+");
				System.out.printf ("+ %8d + %-7d | %7c  %-9c | %11d        | %12.3f         | %20b               +\n", number1, number2, number1, number2, number1*number2, (float)number1/number2, (number1 == number2));
				System.out.println("+==========================================================================================================================+");
				System.out.println("Press enter to proceed..");
				scan.nextLine();
				
				System.out.println("+===========================================================+");
				System.out.printf("+Data Type : %-46s +\n", number1.getClass().getSimpleName());
				System.out.println("+===========================================================+");
				System.out.println("+     +     |     -     |     *     |     /     |     %     |");
				System.out.println("+===========================================================+");
				System.out.printf ("+ %6d    | %5d     | %6d    | %5d     | %5d     |\n", number1+number2, number1-number2, number1*number2, number1/number2, number1%number2);
				System.out.println("+===========================================================+");
				System.out.println("Press enter to proceed..");
				scan.nextLine();
				
				boolean p1 = false;	
				do {
					try {
						System.out.print("Give me value for p1 [true | false]: ");
						p1 = scan.nextBoolean(); scan.nextLine();
						break;
				    } catch (Exception e) {
				    	scan.nextLine();
				    }
				} while(!p1);
				
				boolean p2 = false;	
				do {
					try {
						System.out.print("Give me value for p2 [true | false]: ");
						p2 = scan.nextBoolean(); scan.nextLine();
						break;
				    } catch (Exception e) {
				    	scan.nextLine();
				    }
				} while(!p2);
				
				String s1 = String.valueOf(p1).toUpperCase();
				String s2 = String.valueOf(p2).toUpperCase();
				
				System.out.println("+========================================================================+");
				System.out.println("+Logical Table                                                           +");
				System.out.println("+========================================================================+");
				System.out.printf ("+ P1 = %s , P2 = %s                                                      +\n", s1.charAt(0), s2.charAt(0));
				System.out.println("+========================================================================+");
				System.out.println("+        !P1         |       !P2       |       &&       |       ||       +");
				System.out.println("+========================================================================+");
				System.out.printf ("+ %11b        | %9b       | %9b      | %9b      +\n", !p1, !p2, (p1&&p2), (p1||p2));
				System.out.println("+========================================================================+");
				break;
				
			case 2:
				System.out.println("thank you for using the apps!");
				System.exit(0);
				break;
			}
		}while(menu != 1 || menu != 2);
		scan.close();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
	}

}