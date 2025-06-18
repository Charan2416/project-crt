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
        System.out.println("Name: " + name);
        System.out.println("Customer ID: " + cid);
        System.out.println("Account Number: " + accno);
        System.out.println("Branch: " + branch);
        System.out.println("Bank: " + bank);
    }

    public void deposit(int amount) {
        if (amount > 0) {
            inibal += amount;
            System.out.println("Amount deposited successfully.");
        } else {
            System.out.println("Invalid deposit amount.");
        }
    }

    public void withdraw(int pin, int amount) {
        if (pin == mypin) {
            if (amount <= inibal) {
                inibal -= amount;
                System.out.println("Withdrawal successful.");
            } else {
                System.out.println("Insufficient Balance.");
            }
        } else {
            System.out.println("Incorrect PIN.");
        }
    }

    public void checkBalance(int pin) {
        if (pin == mypin) {
            System.out.println("Current Balance: ₹" + inibal);
        } else {
            System.out.println("Incorrect PIN.");
        }
    }

    public void changePin(int pin, Scanner sc) {
        if (pin == mypin) {
            System.out.print("Enter new PIN: ");
            int newpin = sc.nextInt();
            mypin = newpin;
            System.out.println("PIN changed successfully.");
        } else {
            System.out.println("Incorrect current PIN.");
        }
    }
}

public class AtmApp {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter your name: ");
        String name = sc.nextLine();
        System.out.print("Enter branch: ");
        String branch = sc.nextLine();
        System.out.print("Enter bank: ");
        String bank = sc.nextLine();
        System.out.print("Enter Customer ID: ");
        int cid = sc.nextInt();
        System.out.print("Enter Account Number: ");
        int accno = sc.nextInt();

        Customer c = new Customer(name, cid, accno, branch, bank);
        int choice;
        do {
            System.out.println("\n------ ATM Menu ------");
            System.out.println("1. Display Account Info");
            System.out.println("2. Deposit");
            System.out.println("3. Withdraw");
            System.out.println("4. Check Balance");
            System.out.println("5. Change PIN");
            System.out.println("6. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();

            switch (choice) {
                case 1:
                    c.display();
                    break;
                case 2:
                    System.out.print("Enter amount to deposit: ");
                    int depositAmt = sc.nextInt();
                    c.deposit(depositAmt);
                    break;
                case 3:
                    System.out.print("Enter PIN: ");
                    int wpin = sc.nextInt();
                    System.out.print("Enter amount to withdraw: ");
                    int withdrawAmt = sc.nextInt();
                    c.withdraw(wpin, withdrawAmt);
                    break;
                case 4:
                    System.out.print("Enter PIN: ");
                    int bpin = sc.nextInt();
                    c.checkBalance(bpin);
                    break;
                case 5:
                    System.out.print("Enter current PIN: ");
                    int cpin = sc.nextInt();
                    c.changePin(cpin, sc);
                    break;
                case 6:
                    System.out.println("Thank you for using ATM.");
                    break;
                default:
                    System.out.println("Invalid option.");
            }
        } while (choice != 6);

        sc.close();
    }
}
