class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates_presence_of :user, :ticket
end
