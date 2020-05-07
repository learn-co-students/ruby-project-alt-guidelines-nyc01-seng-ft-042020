class CommandLineInterface
    #welcome greeting
    def greeting
        puts "Welcome to the Assignment Portal!".colorize(:light_green)
    end

    #runs application
    def run 
        self.line_break
        greeting
        puts "Are you a student or a teacher?".colorize(:light_green)
        puts "Type in 'student' or 'teacher' to begin. Type in 'exit' to leave.".colorize(:light_green)
        self.line_break
        type_of_user = gets.chomp
        until type_of_user == "student" || type_of_user == "teacher" || type_of_user == "exit"  
            puts "Invalid response. Type in 'student' or 'teacher' to begin. Type in 'exit' to leave.".colorize(:yellow)
            type_of_user = gets.chomp.downcase
        end
        if type_of_user == "student"
            self.student_user
        elsif type_of_user == "teacher"
            self.teacher_user
        elsif type_of_user == "exit"
            puts "Have a great day!".colorize(:light_green)
        end
    end
    
    ## Student Methods

    #student user welcome message
    def student_user 
        self.line_break
        puts "Type in your full name to begin:".colorize(:light_green)
        self.line_break
        student_user = gets.chomp.titleize
        if Student.find_by(name: student_user)
            self.line_break
            puts "Welcome #{student_user.titleize}!".colorize(:light_magenta)
            self.student_tasks(student_user)
        else 
            puts "Invalid response. You are not authorized to access the portal.".colorize(:yellow), "Please contact student services for additional support. Have a great day!".colorize(:yellow)
            self.run
        end
    end

    #student user tasks
    def student_tasks(student_user) 
        puts "What would you like to do today? Please select a command:".colorize(:light_blue), "1: View All Assignments".colorize(:cyan), "2: View Assignments by Teacher".colorize(:cyan), "3: Exit".colorize(:cyan)
        self.line_break
        student_task = gets.chomp
        self.line_break
        until student_task == "1" || student_task == "2" || student_task == "3"
            puts "Invalid response. Please select a command:".colorize(:yellow), "1: View All Assignments".colorize(:cyan), "2: View Assignments by Teacher".colorize(:cyan), "3: Exit".colorize(:cyan)
            student_task = gets.chomp
        end
        if student_task == "1"
            self.student_all_assignment(student_user)
        elsif student_task == "2"
            self.student_assignment_by_teacher(student_user)
        elsif student_task == "3"
            puts "Have a great day!".colorize(:light_green)
        end
    end

    # lists all assignments
    def student_all_assignment(student_user) 
        puts "Here are all your assignments:".colorize(:magenta)
        s = Student.find_by(name: student_user)
        s.assignments.each do |assignment|
            puts assignment.task 
        end
        self.student_main_menu(student_user)
    end

    # transition method to select teacher
    def student_assignment_by_teacher(student_user) 
        puts "Please select a command:".colorize(:light_blue), "1: Select a teacher".colorize(:cyan), "2: Return to Main Menu".colorize(:cyan), "3: Exit".colorize(:cyan)
        self.line_break
        input = gets.chomp
        until input == "1" || input == "2" || input == "3"
            puts "Invalid response. Please select a command:".colorize(:yellow), "1: View Assignments by Teacher".colorize(:cyan), "2: Return to Main Menu".colorize(:cyan), "3: Exit".colorize(:cyan) 
            input = gets.chomp
        end
        if input == "1"
            self.assignment_by_teacher(student_user)
        elsif input == "2"
            self.student_tasks(student_user)
        elsif input == "3"
            puts "Have a great day!".colorize(:light_green)
        end
    end

    # lists assignment by teacher
    def assignment_by_teacher(student_user)
        self.line_break
        puts "Please select a teacher by typing out their full name below:".colorize(:light_blue)
        self.all_teachers(student_user)
        self.line_break
        student_input = gets.chomp.titleize
        self.line_break
        puts "Here are your assignments for Professor #{student_input}:".colorize(:magenta)
        s = Student.find_by(name: student_user)
        t = Teacher.find_by(name: student_input)
        list = s.assignments.select do |assignment|
            assignment.teacher_id == t.id
        end
        list.each do |assignment|
            puts assignment.task
        end
        self.student_main_menu(student_user)
    end

    #lists all teachers for student user
    def all_teachers(student_user)
        counter = 0 
        while counter <= Teacher.all.count 
            list = Teacher.all.map do |staff|
                staff.name
            end
            counter += 1
        end
        puts list
    end

    #returns student user to student main menu
    def student_main_menu(student_user) 
        self.line_break
        puts "Please select a command:".colorize(:light_blue), "1: Return to Main Menu".colorize(:cyan), "2: Exit".colorize(:cyan)
        self.line_break
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. Please select a command:".colorize(:yellow), "1: Return to Main Menu".colorize(:cyan), "2: Exit".colorize(:cyan) 
            input = gets.chomp
        end
        if input == "1"
            self.student_tasks(student_user)
        elsif input == "2"
            puts "Have a great day!".colorize(:light_green)
        end
    end

    ## Teacher Methods

    #teacher user welcome message
    def teacher_user 
        self.line_break
        puts "Type in your full name to begin:".colorize(:light_green)
        self.line_break
        teacher_user = gets.chomp.titleize
        self.line_break
        if Teacher.find_by(name: teacher_user)
            puts "Welcome #{teacher_user.titleize}!".colorize(:light_magenta)
            self.teacher_tasks(teacher_user)
        else 
            puts "You are not authorized to access the portal. Please contact your administrator for additional support. Have a great day!".colorize(:yellow)
            self.run
        end
    end

    #teacher user tasks
    def teacher_tasks(teacher_user) 
        self.line_break
        puts "What would you like to do today? Please select a command:".colorize(:light_blue), "1: View All Assignment Tasks".colorize(:cyan), "2: Create New Assignment".colorize(:cyan), "3: Update Assignment".colorize(:cyan), "4: Delete Assignment".colorize(:cyan), "5: Exit".colorize(:cyan)
        self.line_break
        teacher_task = gets.chomp
        until teacher_task == "1" || teacher_task == "2" || teacher_task == "3" || teacher_task == "4" || teacher_task == "5"
            puts "Invalid response. Please select a command:".colorize(:yellow), "1: View All Assignment Tasks".colorize(:cyan), "2: Create New Assignment".colorize(:cyan), "3: Update Assignment".colorize(:cyan), "4: Delete Assignment".colorize(:cyan), "5: Exit".colorize(:cyan)
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
           puts "Have a great day!".colorize(:light_green)
        end
    end

    # lists all assignments
    def teacher_all_assignment_tasks(teacher_user) 
        self.line_break
        puts "Here are all your assignments:".colorize(:light_magenta)
        t = Teacher.find_by(name: teacher_user)
        #puts t.assignments.select(:task).map(&:task).uniq
        list = t.assignments.select do |assignment|
            assignment.task
        end
        final_list = list.map do |hw|
            hw.task
        end.uniq
        puts final_list
        self.teacher_main_menu(teacher_user)
    end

    #transition method to create assignments
    def teacher_create_assignment(teacher_user) 
        self.line_break
        puts "Please select a command:".colorize(:light_blue), "1: Create assignment for individual student".colorize(:cyan), "2: Mass create assignment for all students".colorize(:cyan), "3: Return to Main Menu".colorize(:cyan), "4: Exit".colorize(:cyan)
        self.line_break
        input = gets.chomp
        until input == "1" || input == "2" || input == "3" || input == "4"
            puts "Invalid response. Please select a command:".colorize(:yellow), "1: Create assignment for individual student".colorize(:cyan), "2: Mass create assignment for all students".colorize(:cyan), "3: Return to Main Menu".colorize(:cyan), "4: Exit".colorize(:cyan)
            input = gets.chomp
        end
        if input == "1"
            self.create_assignment_single_student(teacher_user)
        elsif input == "2"
            self.create_assignment_mass(teacher_user)
        elsif input == "3"
            self.teacher_tasks(teacher_user)
        elsif input == "4"
            puts "Have a great day!".colorize(:light_green)
        end
    end

    #create assignment for one student
    def create_assignment_single_student(teacher_user) 
        self.line_break
        puts "To begin, type in your new assignment task below:".colorize(:cyan)
        self.line_break
        task_input = gets.chomp
        self.line_break
        puts "To select a student, type in the full name of the student based on the list below:".colorize(:cyan)
        self.all_students(teacher_user)
        self.line_break
        task_student = gets.chomp.titleize
        s = Student.find_by(name: task_student)
        t = Teacher.find_by(name: teacher_user)
        Assignment.create(task: task_input, student_id: s.id, teacher_id: t.id)
        self.line_break
        puts "Assignment Created!".colorize(:light_magenta)
        self.teacher_main_menu(teacher_user)
    end

    #create assignments for all
    def create_assignment_mass(teacher_user) 
        self.line_break
        puts "To begin, type in your new assignment task below:".colorize(:cyan)
        self.line_break
        task_input = gets.chomp
        t = Teacher.find_by(name: teacher_user)
        Student.all.each do |pupil|
            Assignment.create(task: task_input, student_id: pupil.id, teacher_id: t.id)
        end
        self.line_break
        puts "Assignment Created!".colorize(:light_magenta)
        self.teacher_main_menu(teacher_user)
    end

    #updates a single assignment
    def teacher_update_assignment(teacher_user) 
        self.line_break
        puts "To begin, type in the task you would like to update exactly as it was written when assigned:".colorize(:cyan)
        self.line_break
        task_input = gets.chomp
        self.line_break
        puts "Type in below what you would like to update the task to say:".colorize(:cyan)
        self.line_break
        new_task_input = gets.chomp
        assignment = Assignment.find_by(task: task_input)
        assignment.update(task: new_task_input)
        self.line_break
        puts "Assignment Updated!".colorize(:light_magenta)
        self.teacher_main_menu(teacher_user)
    end

    #deletes a single assignment
    def teacher_delete_assignment(teacher_user) 
        self.line_break
        puts "To begin, type in the task you would like to delete exactly as it was written when assigned:".colorize(:cyan)
        self.line_break
        task_input = gets.chomp
        assignment = Assignment.find_by(task: task_input)
        assignment.delete
        self.line_break
        puts "Assignment Deleted!".colorize(:light_magenta)
        self.teacher_main_menu(teacher_user)
    end

    #lists all students for teacher user
    def all_students(teacher_user)
        counter = 0 
        while counter <= Student.all.count 
            list = Student.all.map do |pupil|
                pupil.name
            end
            counter += 1
        end
        puts list
    end

    #brings teacher user back to teacher menu
    def teacher_main_menu(teacher_user) 
        self.line_break
        puts "Please select a command:".colorize(:light_blue), "1: Return to Main Menu".colorize(:cyan), "2: Exit".colorize(:cyan)
        self.line_break
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. Please select a command:".colorize(:yellow), "1: Return to Main Menu".colorize(:cyan), "2: Exit".colorize(:cyan)
            input = gets.chomp
        end
        if input == "1"
            self.teacher_tasks(teacher_user)
        elsif input == "2"
            puts "Have a great day!".colorize(:light_green)
        end
    end

    # breaker
    def line_break
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:light_black)
    end

end

