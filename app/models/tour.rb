class Tour < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  has_many :stops, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description
end
