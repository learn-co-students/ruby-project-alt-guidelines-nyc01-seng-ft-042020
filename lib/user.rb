class User < ActiveRecord::Base
    has_many :enrollments
    has_many :tutoring_centers, through: :enrollments

    def self.tty_prompt
        TTY::Prompt.new
    end

end 

# As a user, I want to be able to enroll at a tutoring center. (create)
# As a user, I want to be able to search by city and see list of tutoring centers. (read)
# As a user, I want to be able to change my enrollment status. (update)
# As a user, I want to be able to withdraw my enrollment at tutoring center. (delete)

######################################################################

    def self.new_user

        system "clear"
        puts "Hi there, and welcome!"
        puts ""

        name = self.tty_prompt.ask("What's your name? (First Name, Last Name)")
        system "clear"
        puts ""

        grade = self.tty_prompt.ask("What grade are you in? (9, 10, 11, or 12)")
        system "clear"
        puts ""

        city = self.tty_prompt.ask("What city do you live in?")
        system "clear"
        puts ""

        state = self.tty_prompt.ask("What about your state?")
            system "clear"
            puts ""

    end 

######################################################################

def tutoring_center_enrollment
    TTY::Prompt.new.select("Please select a tutoring center that you want to enroll at") do |menu|
        TutoringCenter.all.map do |tutoring_center|
        # 
            menu.choice "#{tutoring_center.name}", -> {self.enroll(tutoring_center)}
        # 
        end
        # 
        menu.choice "Return"
        #  
    end
end

def enroll(tutoring_center)
    semester = TTY::Prompt.new.ask("Please enter which semester you'd like to begin. (Since you can register for only the Fall semester, simply enter: Fall")
    self.enroll_tutoring_center(tutoring_center, semester)
    system "clear"
    puts "Great! You're all set!"
end

def enroll_tutoring_center(tutoring_center, semester) 
    Enrollment.create(user_id: self.id, tc_id: tutoring_center.id, status: "Active", semester_of_enrollment_date: semester)
end

#