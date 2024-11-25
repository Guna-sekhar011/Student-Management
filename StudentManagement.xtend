package com.avinsystems


import java.util.List
import java.util.ArrayList
import java.util.Scanner

class StudentManagement {
	
	static class Student{
		String name;
		int rollNo;
		List<Integer>marks ;
		new(String name,int rollNo,List<Integer>marks){
			this.name = name;
			this.rollNo=rollNo;
			this.marks=marks;
		}
		new(){
			
		}
		def String getName(){
			return name;
		}
		def int getRollNo(){
			return rollNo;
		}
		def List<Integer> getMarks(){
			return marks;
		}
		def String getStudent(){
			return "Name: "+ name +", RollNo: "+rollNo +", Marks: "+marks;
		}
		
	}
	
	def static void main(String[] args){
	
		val students = new ArrayList<Student>();
		val scan = new Scanner(System.in);
		
		while(true){
			println("1. Add a student");
			println("2. View all students");
			println("3. Search for a student by roll number");
			println("4. Calculate the average marks for a student");
			println("5. Exit");
			println("Choose an option: ");
			
			val choice = scan.nextInt();
			scan.nextLine();
			
			switch choice{
				case 1:{
					println("Enter student name: ");
					val name = scan.nextLine();
					println("Enter roll number: ");
					val rollNo = scan.nextInt();
					scan.nextLine();
					println("Enter marks (comma-separated): ");
					val studentMarks = scan.nextLine();
					val marks = new ArrayList<Integer>();
					val arr = studentMarks.split(",");
					for(String mark:arr){
						marks.add(Integer::parseInt(mark));
					}
					students.add(new Student(name,rollNo,marks))
					println("Student added successfully")
				}
				case 2: {
    				if (students.isEmpty) {
        			println("No Students found");
    				} else {
        				println("Students records: ");
        				for (Student student : students) {
            				println(student.getStudent()); 
        				}
    				}
    			}
    			case 3:{
    				if (students.isEmpty) {
        				println("No Students found");
    				} else {
        				println("Enter roll number to search: ");
        				val rollNoToSearch = scan.nextInt();
        				scan.nextLine();

        				var Student studentFound = null;
        				for (Student student : students) {
            				if (student.getRollNo() == rollNoToSearch) {
                				studentFound = student;
                			
            			}
        			}

        			if (studentFound !== null) {
            			println("Student found: ");
            			println(studentFound.getStudent());
        			} else {
            			println("No student found with roll number " + rollNoToSearch);
        				}
        			}
				}
				case 4: {
    				if (students.isEmpty) {
        				println("No Students found");
    				} else {
        				println("Enter roll number to calculate average marks: ");
        				val rollNoToSearch = scan.nextInt();
        				scan.nextLine();

        				var Student studentFound = null;
        				for (Student student : students) {
            				if (student.getRollNo() == rollNoToSearch) {
                				studentFound = student;
                				
            					}
        				}	

        			if (studentFound !== null) {
            			val marks = studentFound.getMarks();
            			if (!marks.isEmpty) {
                			var total = 0;
                			for (int mark : marks) {
                    			total += mark;
                			}			
                			val average = total / marks.size;
                			println("Average marks for " + studentFound.getName() + " (Roll No: " + rollNoToSearch + "): " + average);
            			} else {
                			println("No marks available for the student.");
            				}
        				} else {
            				println("No student found with roll number " + rollNoToSearch);
        				}	
    				}
				}
				case 5:{
					return;
				}
			}
		}
	}
	
}
