class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User", foreign_key: "user_id"
  belongs_to :booking
end
