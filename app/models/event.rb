class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets
  validates_presence_of :name, :date, :description
end
