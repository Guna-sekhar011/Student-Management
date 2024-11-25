package com.avinsystems;


import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class StudentManagement {

    // Define the Student class
    static class Student {
        private String name;
        private int rollNumber;
        private List<Integer> marks;

        public Student(String name, int rollNumber, List<Integer> marks) {
            this.name = name;
            this.rollNumber = rollNumber;
            this.marks = marks;
        }

        public String getName() {
            return name;
        }

        public int getRollNumber() {
            return rollNumber;
        }

        public List<Integer> getMarks() {
            return marks;
        }

        @Override
        public String toString() {
            return "Name: " + name + ", Roll Number: " + rollNumber + ", Marks: " + marks;
        }
    }

    public static void main(String[] args) {
        List<Student> students = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\nMenu:");
            System.out.println("1. Add a student");
            System.out.println("2. View all students");
            System.out.println("3. Search for a student by roll number");
            System.out.println("4. Calculate the average marks for a student");
            System.out.println("5. Exit");
            System.out.print("Choose an option: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1 -> {
                    System.out.print("Enter student name: ");
                    String name = scanner.nextLine();
                    System.out.print("Enter roll number: ");
                    int rollNumber = scanner.nextInt();
                    scanner.nextLine(); // Consume newline
                    System.out.print("Enter marks (comma-separated): ");
                    String marksInput = scanner.nextLine();
                    List<Integer> marks = new ArrayList<>();
                    for (String mark : marksInput.split(",")) {
                        marks.add(Integer.parseInt(mark.trim()));
                    }
                    students.add(new Student(name, rollNumber, marks));
                    System.out.println("Student added successfully!");
                }
                case 2 -> {
                    if (students.isEmpty()) {
                        System.out.println("No students available.");
                    } else {
                        System.out.println("Student Records:");
                        for (Student student : students) {
                            System.out.println(student);
                        }
                    }
                }
                case 3 -> {
                    System.out.print("Enter roll number to search: ");
                    int searchRollNumber = scanner.nextInt();
                    Student foundStudent = students.stream()
                            .filter(student -> student.getRollNumber() == searchRollNumber)
                            .findFirst()
                            .orElse(null);
                    if (foundStudent != null) {
                        System.out.println("Student Found: " + foundStudent);
                    } else {
                        System.out.println("Student not found.");
                    }
                }
                case 4 -> {
                    System.out.print("Enter roll number to calculate average marks: ");
                    int avgRollNumber = scanner.nextInt();
                    Student studentForAvg = students.stream()
                            .filter(student -> student.getRollNumber() == avgRollNumber)
                            .findFirst()
                            .orElse(null);
                    if (studentForAvg != null) {
                        double averageMarks = studentForAvg.getMarks().stream()
                                .mapToInt(Integer::intValue)
                                .average()
                                .orElse(0.0);
                        System.out.println("Average marks for student " + studentForAvg.getName() + ": " + averageMarks);
                    } else {
                        System.out.println("Student not found.");
                    }
                }
                case 5 -> {
                    System.out.println("Exiting program. Goodbye!");
                    scanner.close();
                    return;
                }
                default -> System.out.println("Invalid option. Please try again.");
            }
        }
    }
}
