class CommandLineInterface
    def greeting #welcome greeting
        puts "Welcome to the Assignment Portal!"
    end

    def run #runs application
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

    ## Student Methods

    def student_user #student user welcome message
        puts "Type in your full name to begin:"
        student_user = gets.chomp.titleize
        if Student.find_by(name: student_user)
            puts "Welcome #{student_user.titleize}!"
            self.student_tasks(student_user)
        else 
            puts "Invalid response. You are not authorized to access the portal.", "Please contact student services for additional support. Have a great day!"
        end
    end

    def student_tasks(student_user) #student user tasks
        puts "What would you like to do today? Please type in the corresponding letter", "1: View All Assignments", "2: View Assignments by Teacher", "3: Exit"
        student_task = gets.chomp
        until student_task == "1" || student_task == "2" || student_task == "3"
            puts "Invalid response. Please type in the corresponding letter", "1: View All Assignments", "2: View Assignments by Teacher", "3: Exit"
            student_task = gets.chomp
        end
        if student_task == "1"
            self.student_all_assignment(student_user)
        elsif student_task == "2"
            self.student_assignment_by_teacher(student_user)
        elsif student_task == "3"
            puts "Have a great day!"
        end
    end

    def student_all_assignment(student_user) # lists all assignments
        s = Student.find_by(name: student_user)
        s.assignments.each do |assignment|
            puts assignment.task 
        end
        self.student_main_menu(student_user)
    end

    def student_assignment_by_teacher(student_user) #transition method to select teacher
        puts "To select a teacher to view assignments for type in 1. To return to the main menu, type in 2. To exit, type in 3."
        input = gets.chomp
        until input == "1" || input == "2" || input == "3"
            puts "Invalid response. To return to the main menu, type in 1. To exit, type in 2."
            input = gets.chomp
        end
        if input == "1"
            self.assignment_by_teacher(student_user)
        elsif input == "2"
            self.student_tasks(student_user)
        elsif input == "3"
            puts "Have a great day!"
        end
    end

    def assignment_by_teacher(student_user) #select teacher
        puts "To select a teacher, type in the corresponding number below:", "1: Professor Dumbledore", "2: Professor Snape", "3: Professor Flitwick", "4: Professor Lupin", "5: Professor Slughorn"
        student_input = gets.chomp
        until student_input == "1" || student_input == "2" || student_input == "3" || student_input == "4" || student_input == "5"
            puts "Invalid response. Type in the number corresponding to the teacher below:", "1: Professor Dumbledore", "2: Professor Snape", "3: Professor Flitwick", "4: Professor Lupin", "5: Professor Slughorn"
            student_input = gets.chomp
        end
        if student_input == "1"
            teacher = "Albus Dumbledore"
            self.list_by_teacher(student_user, teacher)
        elsif student_input == "2"
            teacher == "Severus Snape"
            self.list_by_teacher(student_user, teacher)
        elsif student_input == "3"
            teacher = "Filius Flitwick"
            self.list_by_teacher(student_user, teacher)
        elsif student_input == "4"
            teacher = "Remus Lupin"
            self.list_by_teacher(student_user, teacher)
        elsif student_input == "5"
            teacher = "Horace Slughorn"
            self.list_by_teacher(student_user, teacher)
        end
        self.student_main_menu(student_user)
    end

    def list_by_teacher(student_user, teacher) #list assignments by teacher
        s = Student.find_by(name: student_user)
        t = Teacher.find_by(name: teacher)
        list = s.assignments.select do |assignment|
            assignment.teacher_id == t.id
        end      
        list.each do |assignment|
            puts assignment.task
        end
    end

    def student_main_menu(student_user) #returns student user to student main menu
        puts "To return to the main menu, type in 1. To exit, type in 2."
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. To return to the main menu, type in 1. To exit, type in 2."
            input = gets.chomp
        end
        if input == "1"
            self.student_tasks(student_user)
        elsif input == "2"
            puts "Have a great day!"
        end
    end

    ## Teacher Methods

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
        puts "What would you like to do today? Please type in the corresponding letter", "1: View All Assignment Tasks", "2: Create New Assignment", "3: Update Assignment", "4: Delete Assignment", "5: Exit"
        teacher_task = gets.chomp
        until teacher_task == "1" || teacher_task == "2" || teacher_task == "3" || teacher_task == "4" || teacher_task == "5"
            puts "Invalid response. Please type in the corresponding letter", "1: View All Assignment Tasks", "2: Create New Assignment", "3: Update Assignment", "4: Delete Assignment", "5: Exit"
            teacher_task = gets.chomp
        end
        if teacher_task == "1"
            self.teacher_all_assignment_tasks(teacher_user)
        elsif teacher_task == "2"
            self.teacher_create_assignment(teacher_user)
        elsif teacher_task == "3"
            self.teacher_update_assignment(teacher_user)
        elsif teacher_task == "4"
            self.teacher_delete_assignment(teacher_user)
        elsif teacher_task == "5"
           puts "Have a great day!"
        end
    end

    def teacher_all_assignment_tasks(teacher_user) # lists all assignments ##need to list single for each task!!!!!!
        t = Teacher.find_by(name: teacher_user)
        t.assignments.select do |assignment|
            puts assignment.task
        end
        self.teacher_main_menu(teacher_user)
    end

    def teacher_create_assignment(teacher_user) #transition method to creating assignments
        puts "To create an assignment, type in 1. To return to the main menu, type in 2."
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. To return to the main menu, type in 1. To exit, type in 2."
            input = gets.chomp
        end
        if input == "1"
            self.create_assignment(teacher_user)
        elsif input == "2"
            self.teacher_tasks(teacher_user)
        end
    end

    def create_assignment(teacher_user) #creates assignment for one student ###need to create assignment for many students
        puts "To begin, type in your new assignment task below"
        task_input = gets.chomp
        puts "Type in the corresponding number to assign the task to a student:", "1: Harry Potter", "2: Hermione Granger", "3: Ron Weasley", "4: Ginny Weasley", "5: Draco Malfoy"
        task_student = gets.chomp.titleize
        s = Student.find_by(task_student)
        t = Teacher.find_by(name: teacher_user)
        Assignment.create(task: task_input, student_id: s.id, teacher_id: t.id)
        puts "Assignment Created!" 
        self.teacher_main_menu(teacher_user)
    end

    def teacher_update_assignment(teacher_user) #updates a single assignment
        puts "To begin, type in the task you would like to update exactly as it was written when assigned"
        task_input = gets.chomp
        puts "Type in below what you would like to update the task to say:"
        new_task_input = gets.chomp
        assignment = Assignment.find_by(task: task_input)
        assignment.update(task: new_task_input)
        puts "Assignment Updated!" 
        self.teacher_main_menu(teacher_user)
    end

    def teacher_delete_assignment(teacher_user) #deletes a single assignment
        puts "To begin, type in the task you would like to delete exactly as it was written when assigned"
        task_input = gets.chomp
        assignment = Assignment.find_by(task: task_input)
        assignment.delete
        puts "Assignment Deleted!"
        self.teacher_main_menu(teacher_user)
    end

    def teacher_main_menu(teacher_user) #brings user back to teacher menu
        puts "To return to main menu, type in 1. To exit, type in 2."
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. To return to main menu, type in 1. To exit, type in 2."
            input = gets.chomp
        end
        if input == "1"
            self.teacher_tasks(teacher_user)
        elsif input == "2"
            puts "Have a great day!"
        end
    end

end

