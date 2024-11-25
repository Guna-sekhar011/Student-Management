package com.avinsystems;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class StudentManagement {
  public static class Student {
    private String name;

    private int rollNo;

    private List<Integer> marks;

    public Student(final String name, final int rollNo, final List<Integer> marks) {
      this.name = name;
      this.rollNo = rollNo;
      this.marks = marks;
    }

    public Student() {
    }

    public String getName() {
      return this.name;
    }

    public int getRollNo() {
      return this.rollNo;
    }

    public List<Integer> getMarks() {
      return this.marks;
    }

    public String getStudent() {
      return ((((("Name: " + this.name) + ", RollNo: ") + Integer.valueOf(this.rollNo)) + ", Marks: ") + this.marks);
    }
  }

  public static void main(final String[] args) {
    final ArrayList<StudentManagement.Student> students = new ArrayList<StudentManagement.Student>();
    final Scanner scan = new Scanner(System.in);
    final boolean exit = false;
    while (true) {
      {
        InputOutput.<String>println("1. Add a student");
        InputOutput.<String>println("2. View all students");
        InputOutput.<String>println("3. Search for a student by roll number");
        InputOutput.<String>println("4. Calculate the average marks for a student");
        InputOutput.<String>println("5. Exit");
        InputOutput.<String>println("Choose an option: ");
        final int choice = scan.nextInt();
        scan.nextLine();
        switch (choice) {
          case 1:
            InputOutput.<String>println("Enter student name: ");
            final String name = scan.nextLine();
            InputOutput.<String>println("Enter roll number: ");
            final int rollNo = scan.nextInt();
            scan.nextLine();
            InputOutput.<String>println("Enter marks (comma-separated): ");
            final String studentMarks = scan.nextLine();
            final ArrayList<Integer> marks = new ArrayList<Integer>();
            final String[] arr = studentMarks.split(",");
            for (final String mark : arr) {
              marks.add(Integer.valueOf(Integer.parseInt(mark)));
            }
            StudentManagement.Student _student = new StudentManagement.Student(name, rollNo, marks);
            students.add(_student);
            InputOutput.<String>println("Student added successfully");
            break;
          case 2:
            boolean _isEmpty = students.isEmpty();
            if (_isEmpty) {
              InputOutput.<String>println("No Students found");
            } else {
              final StudentManagement.Student std = new StudentManagement.Student();
              InputOutput.<String>println("Students records: ");
              for (final StudentManagement.Student student : students) {
                InputOutput.<String>println(std.getStudent());
              }
            }
            break;
        }
      }
    }
  }
}
