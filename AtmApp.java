import java.util.Scanner;

class Customer {
    String name;
    int cid;
    int accno;
    String branch;
    String bank;
    int inibal = 0;
    int mypin = 5566;

    public Customer(String name, int cid, int accno, String branch, String bank) {
        this.name = name;
        this.cid = cid;
        this.accno = accno;
        this.branch = branch;
        this.bank = bank;
    }

    public void display() {
        System.out.println("Name is " + this.name);
        System.out.println("Cid is " + this.cid);
        System.out.println("AccNo is " + this.accno);
        System.out.println("Branch is " + this.branch);
        System.out.println("Bank is " + this.bank);
    }

    public void deposit(int amount) {
        if (amount > 0) {
            inibal += amount;
        }
        System.out.println("Deposit successfully!");
    }

    public void withdraw(int pin, int amount) {
        if (pin == mypin && amount <= inibal) {
            inibal -= amount;
            System.out.println("Withdrawal Successful. Remaining Balance: " + inibal);
        } else {
            System.out.println("Insufficient Balance or Incorrect Pin");
        }
    }

    public void checkBalance(int pin) {
        if (pin == mypin) {
            System.out.println("Balance is: " + inibal);
        } else {
            System.out.println("Sorry Incorrect Pin");
        }
    }

    Scanner sc = new Scanner(System.in);

    public void changePin(int pin) {
        if (pin == mypin) {
            System.out.print("Enter your new pin: ");
            int newpin = sc.nextInt();
            if (newpin == mypin) {
                System.out.println("New PIN cannot be the same as the old PIN.");
            } else {
                mypin = newpin;
                System.out.println("PIN changed successfully to: " + mypin);
            }
        } else {
            System.out.println("Incorrect current PIN.");
        }
    }
}

public class AtmApp {
    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter your name: ");
        String name = sc.nextLine();

        System.out.print("Enter branch: ");
        String branch = sc.nextLine();

        System.out.print("Enter bank: ");
        String bank = sc.nextLine();

        System.out.print("Enter cid: ");
        int cid = sc.nextInt();

        System.out.print("Enter accno: ");
        int accno = sc.nextInt();

        Customer c1 = new Customer(name, cid, accno, branch, bank);
        c1.display();

        c1.deposit(50000);
        c1.withdraw(5566, 25000);
        c1.checkBalance(5566);
        c1.changePin(5566);
        c1.checkBalance(8899); // Intentional wrong pin for demo

        sc.close();
    }
}
output:
Enter your name: Charan
Enter branch: NPL
Enter bank: SBI
Enter cid: 221
Enter accno: 22 022
Name is Charan
Cid is 221
AccNo is 2022
Branch is NPL
Bank is SBI
Deposit successfully!
Withdrawal Successful. Remaining Balance: 25000
Balance is: 25000
Enter your new pin: 8899
PIN changed successfully to: 8899
Balance is: 25000
