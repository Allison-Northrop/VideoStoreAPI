class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  #potentially need to comment the below out for a while...
  validates :due_date, presence: true
end
