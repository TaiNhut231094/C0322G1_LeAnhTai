package controllers;

import services.CustomerService;
import services.impl.*;
import exception.CheckException;

import java.util.Scanner;

public class FuramaController {
    public static Scanner scanner = new Scanner(System.in);

    public static void displayMainMenu() {
        int choose = 0;
        while (true) {
        System.out.println("1.\tEmployee Management");
        System.out.println("2.\tCustomer Management");
        System.out.println("3.\tFacility Management ");
        System.out.println("4.\tBooking Management");
        System.out.println("5.\tPromotion Management");
        System.out.println("6.\tExit");
        System.out.print("Choose Option: ");
            choose = CheckException.checkParseInt();
            switch (choose) {
                case 1:
                    displayEmployeeMenu();
                    break;
                case 2:
                    displayCustomerMenu();
                    break;
                case 3:
                    displayFacilityMenu();
                    break;
                case 4:
                    displayBookingMenu();
                    break;
                case 5:
                    displayPromotionMenu();
                case 6:
                    System.exit(0);
                default:
                    System.out.print("Dịch vụ bạn chọn không có trong hệ thống xin vui lòng chọn lại: ");
            }
        }
    }

    public static void displayEmployeeMenu() {
        EmployeeServiceImpl employeeService = new EmployeeServiceImpl();
        int chooseEmployee = 0;
        while (true) {
        System.out.println("1.\tDisplay list employees");
        System.out.println("2.\tAdd new employee");
        System.out.println("3.\tEdit employee");
        System.out.println("4.\tReturn main menu");
        System.out.print("Choose Option: ");
            chooseEmployee = CheckException.checkParseInt();
            switch (chooseEmployee) {
                case 1:
                    employeeService.display();
                    break;
                case 2:
                    employeeService.addNew();
                    break;
                case 3:
                    employeeService.edit();
                    break;
                case 4:
                    displayMainMenu();
                default:
                    System.out.println("Dịch vụ bạn chọn không có trong hệ thống xin vui lòng chọn lại");
            }
        }
    }

    public static void displayCustomerMenu() {
        CustomerService customerService = new CustomerServiceImpl();
        int choose = 0;
        while (true) {
        System.out.println("1.\tDisplay list customers");
        System.out.println("2.\tAdd new customer");
        System.out.println("3.\tEdit customer");
        System.out.println("4.\tReturn main menu");
        System.out.print("Choose Option: ");
            choose = CheckException.checkParseInt();
            switch (choose) {
                case 1:
                    customerService.display();
                    break;
                case 2:
                    customerService.addNew();
                    break;
                case 3:
                    customerService.edit();
                    break;
                case 4:
                    displayMainMenu();
                default:
                    System.out.println("Dịch vụ bạn chọn không có trong hệ thống xin vui lòng chọn lại: ");
            }
        }
    }

    public static void displayFacilityMenu() {
        FacilityServiceImpl facilityService = new FacilityServiceImpl();
        int choose = 0;
        while (true) {
        System.out.println("1.\tDisplay list facility");
        System.out.println("2.\tAdd new facility");
        System.out.println("3.\tDisplay list facility maintenance");
        System.out.println("4.\tReturn main menu");
        System.out.print("Choose Option: ");
            choose = Integer.parseInt(scanner.nextLine());
            switch (choose) {
                case 1:
                    facilityService.display();
                    break;
                case 2:
                    addNewFacilityMenu();
                    break;
                case 4:
                    displayMainMenu();
                default:
                    System.out.println("Dịch vụ bạn chọn không có trong hệ thống xin vui lòng chọn lại: ");
            }
        }
    }

    public static void addNewFacilityMenu() {
        FacilityServiceImpl facilityService = new FacilityServiceImpl();

        int choose = 0;
        while (true) {
        System.out.println("1.\tAdd new Villa");
        System.out.println("2.\tAdd new House");
        System.out.println("3.\tAdd Room");
        System.out.println("4.\tBack to menu");
        System.out.print("Choose Option: ");
            choose = Integer.parseInt(scanner.nextLine());
            switch (choose) {
                case 1:
                    facilityService.addNewVilla();
                    displayFacilityMenu();
                    break;
                case 2:
                    facilityService.addNewHouse();
                    displayFacilityMenu();
                    break;
                case 3:
                    facilityService.addNewRoom();
                    displayFacilityMenu();
                    break;
                case 4:
                    displayMainMenu();
                default:
                    System.out.println("Dịch vụ bạn chọn không có trong hệ thống xin vui lòng chọn lại: ");
            }
        }
    }

    public static void displayBookingMenu() {
        BookingServiceImpl bookingService = new BookingServiceImpl();
        ContractServiceImpl contractService = new ContractServiceImpl();

        int choose = 0;
        while (true) {
            System.out.println("2.\tDisplay list booking");
        System.out.println("1.\tAdd new booking");
        System.out.println("3.\tCreate new contracts");
        System.out.println("4.\tDisplay list contracts");
        System.out.println("5.\tEdit contracts ");
        System.out.println("6.\tReturn main menu");
        System.out.print("Choose Option: ");
            choose = Integer.parseInt(scanner.nextLine());
            switch (choose) {
                case 1:
                    bookingService.addNew();
                    break;
                case 2:
                    bookingService.display();
                    break;
                case 3:
                    contractService.creatNew();
                    break;
                case 4:
                    contractService.displayList();
                    break;
                case 5:
                    contractService.edit();
                    break;
                case 6:
                    displayMainMenu();
                default:
                    System.out.println("Dịch vụ bạn chọn không có trong hệ thống xin vui lòng chọn lại: ");
            }

        }
    }

    public static void displayPromotionMenu() {
        PromotionServiceImpl promotionService = new PromotionServiceImpl();

        int choose = 0;
        while (true) {
        System.out.println("1.\tDisplay list customers use service");
        System.out.println("2.\tDisplay list customers get voucher");
        System.out.println("3.\tReturn main menu");
        System.out.print("Choose Option: ");
            choose = Integer.parseInt(scanner.nextLine());
            switch (choose) {
                case 1:
                    promotionService.displayUseService();
                    break;
                case 2:
                    promotionService.displayGetVoucher();
                    break;
                case 3:
                    displayMainMenu();
                default:
                    System.out.println("Dịch vụ bạn chọn không có trong hệ thống xin vui lòng chọn lại: ");
            }

        }
    }
}