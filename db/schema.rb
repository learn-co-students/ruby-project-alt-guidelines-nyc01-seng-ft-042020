ActiveRecord::Schema.define do

    create_table "users", force: :cascade do |t|
        t.string "username"
        t.string "name"
        t.integer "grade"
        t.string "city"
        t.string "state"
    end

    create_table "tutoring centers", force: :cascade do |t|
      t.string "name"
      t.string "city"
      t.string "state"
    end
  
    create_table "enrollments", force: :cascade do |t|
      t.integer "user_id"
      t.integer "tc_id"
      t.string "status"
      t.string "semester_of_enrollment_date"
    end
  
  end

  # 