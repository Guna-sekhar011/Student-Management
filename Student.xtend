package com.avinsystems

import java.util.ArrayList
import java.util.List
import java.util.Scanner

class Student {
    val String name
    val int rollNumber
    val List<Integer> marks

    new(String name, int rollNumber, List<Integer> marks) {
        this.name = name
        this.rollNumber = rollNumber
        this.marks = marks
    }

    def String getName() {
        return name
    }

    def int getRollNumber() {
        return rollNumber
    }

    def List<Integer> getMarks() {
        return marks
    }

    override toString() '''
        Name: «name», Roll Number: «rollNumber», Marks: «marks»
    '''
}

class StudentManagement1 {
    def static void main(String[] args) {
        val students = new ArrayList<Student>()
        val scanner = new Scanner(System.in)

        while (true) {
            println('''

            Menu:
            1. Add a student
            2. View all students
            3. Search for a student by roll number
            4. Calculate the average marks for a student
            5. Exit

            ''')
            print("Choose an option: ")
            val choice = scanner.nextInt
            scanner.nextLine // Consume newline

            switch choice {
                case 1: addStudent(students, scanner)
                case 2: viewAllStudents(students)
                case 3: searchStudentByRollNumber(students, scanner)
                case 4: calculateAverageMarks(students, scanner)
                case 5: {
                    println("Exiting program. Goodbye!")
                    scanner.close
                    return
                }
                default: println("Invalid option. Please try again.")
            }
        }
    }

    def static void addStudent(List<Student> students, Scanner scanner) {
        print("Enter student name: ")
        val name = scanner.nextLine

        print("Enter roll number: ")
        val rollNumber = scanner.nextInt

        scanner.nextLine // Consume newline
        print("Enter marks (comma-separated): ")
        val marksInput = scanner.nextLine

        val marks = marksInput.split(",").map[Integer::valueOf(it.trim)]

        students.add(new Student(name, rollNumber, marks))
        println("Student added successfully!")
    }

    def static void viewAllStudents(List<Student> students) {
        if (students.isEmpty) {
            println("No students available.")
        } else {
            println("Student Records:")
            students.forEach[println(it)]
        }
    }

    def static void searchStudentByRollNumber(List<Student> students, Scanner scanner) {
        print("Enter roll number to search: ")
        val searchRollNumber = scanner.nextInt

        val foundStudent = students.findFirst[
            it.getRollNumber == searchRollNumber
        ]

        if (foundStudent != null) {
            println("Student Found: " + foundStudent)
        } else {
            println("Student not found.")
        }
    }

    def static void calculateAverageMarks(List<Student> students, Scanner scanner) {
        print("Enter roll number to calculate average marks: ")
        val avgRollNumber = scanner.nextInt

        val studentForAvg = students.findFirst[
            it.getRollNumber == avgRollNumber
        ]

        if (studentForAvg != null) {
            // Sum marks manually using a for loop
            var totalMarks = 0
            val marksList = studentForAvg.getMarks
            val numberOfMarks = marksList.size

            // Iterate over the marks and sum them up using correct syntax
            for (mark : marksList) {
                totalMarks += mark
            }
            
            // Calculate average
            val averageMarks = if (numberOfMarks > 0) totalMarks / numberOfMarks else 0
            println("Average marks for student " + studentForAvg.getName + ": " + averageMarks)
        } else {
            println("Student not found.")
        }
    }
}




