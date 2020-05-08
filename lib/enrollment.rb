class Enrollment < ActiveRecord::Base
    belongs_to :user
    belongs_to :tutoring_center

end

# 