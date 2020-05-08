# User instances (5): 

angela = User.create(username: "angela123", name: "Angela A", grade: 12, city: "Edison", state: "New Jersey")
bob = User.create(username: "bob123", name: "Bob B", grade: 12, city: "Edison", state: "New Jersey")
charlie = User.create(username: "charlie123", name: "Charlie C", grade: 11, city: "Jersey City", state: "New Jersey")
diane = User.create(username: "diane123", name: "Diane D", grade: 11, city: "Jersey City", state: "New Jersey")
ed = User.create(username: "ed123", name: "Ed E", grade: 11, city: "Jersey City", state: "New Jersey")

# Tutoring Center instances (5): 

tc_one = TutoringCenter.create(name: "Super TC_One", city: "Edison", state: "New Jersey")
tc_two = TutoringCenter.create(name: "Super TC_Two", city: "Edison", state: "New Jersey")
tc_three = TutoringCenter.create(name: "Super TC_Three", city: "Jersey City", state: "New Jersey")
tc_four = TutoringCenter.create(name: "Super TC_Four", city: "Jersey City", state: "New Jersey")
tc_five = TutoringCenter.create(name: "Super TC_Five", city: "Jersey City", state: "New Jersey")

# Enrollment instances (5):

e_one = Enrollment.create(user_id: 001, tc_id: 100, status: "Active", semester_of_enrollment: "Fall")
e_two = Enrollment.create(user_id: 002, tc_id: 100, status: "Active", semester_of_enrollment: "Fall")
e_three = Enrollment.create(user_id: 003, tc_id: 200, status: "Active", semester_of_enrollment: "Fall")
e_four = Enrollment.create(user_id: 004, tc_id: 200, status: "Active", semester_of_enrollment: "Fall")
e_five = Enrollment.create(user_id: 005, tc_id: 200, status: "Inactive", semester_of_enrollment: "Fall")

# 