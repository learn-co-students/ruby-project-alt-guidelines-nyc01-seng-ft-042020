class CommandLineInterface
    def greeting
        puts "Welcome to the Assignment Portal!"
    end

    def run
        greeting
        puts "Are you a student or a teacher?"
        puts "Type in 'student' or 'teacher' to begin. Otherwise type in 'exit' to leave."
        type_of_user = gets.chomp.downcase
        until type_of_user == "student" || type_of_user == "teacher" || type_of_user == "exit"  
            puts "Invalid response. Type in 'student' or 'teacher' to begin. Otherwise type in 'exit' to leave."
            type_of_user = gets.chomp.downcase
        end
        if type_of_user == "student"
            self.student_user
        elsif type_of_user == "teacher"
            self.teacher_user
        elsif type_of_user == "exit"
            puts "Have a great day!"
        end
    end

    def student_user #student user welcome message
        puts "Type in your full name to begin:"
        student_user = gets.chomp.titleize
        if Student.find_by(name: student_user)
            puts "Welcome #{student_user.titleize}!"
            self.student_tasks(student_user)
        else 
            puts "You are not authorized to access the portal.", "Please contact student services for additional support. Have a great day!"
        end
    end

    def student_tasks(student_user) #student user tasks
        puts "What would you like to do today? Please type in the corresponding letter", "1: View All Assignments", "2: View Assignments by Teacher", "3: View Grades for All Assignments", "4: View Grades by Teacher", "5: exit"
        student_task = gets.chomp
        until student_task == "1" || student_task == "2" || student_task == "3" || student_task == "4" || student_task == "5"
            puts "Invalid response. Please type in the corresponding letter", "1: View All Assignments", "2: View Assignments by Teacher", "3: View Grades for All Assignments", "4: View Grades by Teacher", "5: exit"
            student_task = gets.chomp
        end
        if student_task == "1"
            self.student_all_assignment(student_user)
        # elsif student_task == "2"
        #     self.student_assignment_by_teacher
        # elsif student_task == "3"
        #     self.student_grades_all_assignment
        # elsif student_task == "4"
        #     self.student_grade_by_teacher
        elsif student_task == "5"
            puts "Have a great day!"
        end
    end

    def student_all_assignment(student_user) # lists all assignments
        s = Student.find_by(name: student_user)
        s.assignments.each do |assignment|
            puts assignment.task 
        end
        puts "Please type in 1 to return to main menu or 2 to exit"
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. Please type in 1 to return to main menu or 2 to exit"
            input = gets.chomp
        end
        if input == "1"
            self.student_tasks(student_user)
        elsif input == "2"
            puts "Have a great day!"
        end
    end

    def teacher_user #teacher user welcome message
        puts "Type in your full name to begin:"
        teacher_user = gets.chomp.titleize
        if Teacher.find_by(name: teacher_user)
            puts "Welcome #{teacher_user.titleize}!"
            self.teacher_tasks(teacher_user)
        else 
            puts "You are not authorized to access the portal. Please contact your administrator for additional support. Have a great day!"
        end
    end

    def teacher_tasks(teacher_user) #teacher user tasks
        puts "What would you like to do today? Please type in the corresponding letter", "1: View All Assignment Tasks", "2: Create New Assignment", "3: Update Assignment", "4: Delete Assignment", "5: Update Grade", "6: Delete Grade", "7: Exit"
        teacher_task = gets.chomp
        until teacher_task == "1" || teacher_task == "2" || teacher_task == "3" || teacher_task == "4" || teacher_task == "5" || teacher_task == "6" || teacher_task == "7"
            puts "Invalid response. Please type in the corresponding letter", "1: View All Assignment Tasks", "2: Create New Assignment", "3: Update Assignment", "4: Delete Assignment", "5: Update Grade", "6: Delete Grade", "7: Exit"
            teacher_task = gets.chomp
        end
        if teacher_task == "1"
            self.teacher_all_assignment_tasks(teacher_user)
        # elsif teacher_task == "2"
        #     self.teacher_create_assignment
        # elsif teacher_task == "3"
        #     self.teacher_update_assignment
        # elsif teacher_task == "4"
        #     self.teacher_delete_assignment
        # elsif teacher_task == "5"
        #     self.teacher_update_grade
        # elsif teacher_task == "6"
        #     self.teacher_delete_grade
        elsif teacher_task == "7"
            puts "Have a great day!"
        end
    end

    def teacher_all_assignment_tasks(teacher_user) # lists all assignments ##need to list single for each task!!!!!!
        t = Teacher.find_by(name: teacher_user)
        t.assignments.select do |assignment|
            puts assignment.task
        end
        puts "Please type in 1 to return to main menu or 2 to exit"
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. Please type in 1 to return to main menu or 2 to exit"
            input = gets.chomp
        end
        if input == "1"
            self.teacher_tasks(teacher_user)
        elsif input == "2"
            puts "Have a great day!"
        end
    end

end

