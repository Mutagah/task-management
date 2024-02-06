class Task < ApplicationRecord
    validates :name,presence: true

    validates :status,presence: true ,inclusion: { in: %w(Pending Completed Cancelled),
    message: "%{value} is not a valid status" }
end
