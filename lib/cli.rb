class CommandLineInterface
    #welcome greeting
    def greeting
        puts "Welcome to the Assignment Portal!"
    end

    #runs application
    def run 
        self.line_break
        greeting
        puts "Are you a student or a teacher?"
        puts "Type in 'student' or 'teacher' to begin. Type in 'exit' to leave."
        self.line_break
        type_of_user = gets.chomp.downcase
        until type_of_user == "student" || type_of_user == "teacher" || type_of_user == "exit"  
            puts "Invalid response. Type in 'student' or 'teacher' to begin. Type in 'exit' to leave."
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

    #student user welcome message
    def student_user 
        puts "Type in your full name to begin:"
        self.line_break
        student_user = gets.chomp.titleize
        if Student.find_by(name: student_user)
            puts "Welcome #{student_user.titleize}!"
            self.line_break
            self.student_tasks(student_user)
        else 
            puts "Invalid response. You are not authorized to access the portal.", "Please contact student services for additional support. Have a great day!"
        end
    end

    #student user tasks
    def student_tasks(student_user) 
        puts "What would you like to do today? Please select a command:", "1: View All Assignments", "2: View Assignments by Teacher", "3: Exit"
        self.line_break
        student_task = gets.chomp
        until student_task == "1" || student_task == "2" || student_task == "3"
            puts "Invalid response. Please select a command:", "1: View All Assignments", "2: View Assignments by Teacher", "3: Exit"
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

    # lists all assignments
    def student_all_assignment(student_user) 
        s = Student.find_by(name: student_user)
        s.assignments.each do |assignment|
            puts assignment.task 
        end
        self.student_main_menu(student_user)
    end

    # transition method to select teacher
    def student_assignment_by_teacher(student_user) 
        puts "Please select a command:", "1: Select a teacher", "2: Return to Main Menu", "3: Exit"
        self.line_break
        input = gets.chomp
        until input == "1" || input == "2" || input == "3"
            puts "Invalid response. Please select a command:", "1: View Assignments by Teacher", "2: Return to Main Menu", "3: Exit" 
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

    # lists assignment by teacher
    def assignment_by_teacher(student_user)
        self.all_teachers(student_user)
        self.line_break
        student_input = gets.chomp.titleize
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
        puts "Please select a command:", "1: Return to Main Menu", "2: Exit" 
        self.line_break
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. Please select a command:", "1: Return to Main Menu", "2: Exit" 
            input = gets.chomp
        end
        if input == "1"
            self.student_tasks(student_user)
        elsif input == "2"
            puts "Have a great day!"
        end
    end

    ## Teacher Methods

    #teacher user welcome message
    def teacher_user 
        puts "Type in your full name to begin:"
        self.line_break
        teacher_user = gets.chomp.titleize
        if Teacher.find_by(name: teacher_user)
            puts "Welcome #{teacher_user.titleize}!"
            self.teacher_tasks(teacher_user)
        else 
            puts "You are not authorized to access the portal. Please contact your administrator for additional support. Have a great day!"
        end
    end

    #teacher user tasks
    def teacher_tasks(teacher_user) 
        puts "What would you like to do today? Please select a command:", "1: View All Assignment Tasks", "2: Create New Assignment", "3: Update Assignment", "4: Delete Assignment", "5: Exit"
        self.line_break
        teacher_task = gets.chomp
        until teacher_task == "1" || teacher_task == "2" || teacher_task == "3" || teacher_task == "4" || teacher_task == "5"
            puts "Invalid response. Please select a command:", "1: View All Assignment Tasks", "2: Create New Assignment", "3: Update Assignment", "4: Delete Assignment", "5: Exit"
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

    # lists all assignments
    def teacher_all_assignment_tasks(teacher_user) 
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
        puts "Please select a command:", "1: Create assignment for individual student", "2: Mass create assignment for all students", "3: Return to Main Menu"
        self.line_break
        input = gets.chomp
        until input == "1" || input == "2" || input == "3"
            puts "Invalid response. Please select a command:", "1: Create assignment for individual student", "2: Mass create assignment for all students", "3: Return to Main Menu"
            input = gets.chomp
        end
        if input == "1"
            self.create_assignment_single_student(teacher_user)
        elsif input == "2"
            self.create_assignment_mass(teacher_user)
        elsif input == "3"
            self.teacher_tasks(teacher_user)
        end
        self.teacher_main_menu(teacher_user)
    end

    #create assignment for one student
    def create_assignment_single_student(teacher_user) 
        puts "To begin, type in your new assignment task below:"
        self.line_break
        task_input = gets.chomp
        puts "To select a student, type in the full name of the student based on the list below:"
        self.all_students(teacher_user)
        self.line_break
        task_student = gets.chomp.titleize
        s = Student.find_by(name: task_student)
        t = Teacher.find_by(name: teacher_user)
        Assignment.create(task: task_input, student_id: s.id, teacher_id: t.id)
        puts "Assignment Created!" 
        self.teacher_main_menu(teacher_user)
    end

    #create assignments for all
    def create_assignment_mass(teacher_user) 
        puts "To begin, type in your new assignment task below:"
        self.line_break
        task_input = gets.chomp
        t = Teacher.find_by(name: teacher_user)
        Student.all.each do |pupil|
            Assignment.create(task: task_input, student_id: pupil.id, teacher_id: t.id)
        end
        puts "Assignment Created!" 
        self.teacher_main_menu(teacher_user)
    end

    #updates a single assignment
    def teacher_update_assignment(teacher_user) 
        puts "To begin, type in the task you would like to update exactly as it was written when assigned:"
        self.line_break
        task_input = gets.chomp
        puts "Type in below what you would like to update the task to say:"
        self.line_break
        new_task_input = gets.chomp
        assignment = Assignment.find_by(task: task_input)
        assignment.update(task: new_task_input)
        puts "Assignment Updated!" 
        self.teacher_main_menu(teacher_user)
    end

    #deletes a single assignment
    def teacher_delete_assignment(teacher_user) 
        puts "To begin, type in the task you would like to delete exactly as it was written when assigned:"
        self.line_break
        task_input = gets.chomp
        assignment = Assignment.find_by(task: task_input)
        assignment.delete
        puts "Assignment Deleted!"
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
        puts "Please select a command:", "1: Return to Main Menu", "2: Exit"
        self.line_break
        input = gets.chomp
        until input == "1" || input == "2"
            puts "Invalid response. Please select a command:", "1: Return to Main Menu", "2: Exit"
            input = gets.chomp
        end
        if input == "1"
            self.teacher_tasks(teacher_user)
        elsif input == "2"
            puts "Have a great day!"
        end
    end

    # breaker
    def line_break
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

end

