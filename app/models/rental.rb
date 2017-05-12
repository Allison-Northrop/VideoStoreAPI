class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  #potentially need to comment the below out for a while...
  validates :due_date, presence: true

  after_initialize :set_defaults, unless: :persisted?

  private
  def set_defaults
    self.returned = false if self.returned.nil?
  end
end
