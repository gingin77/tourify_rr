class User < ApplicationRecord
  has_many :tours, dependent: :destroy
  has_many :stops, dependent: :destroy
  belongs_to :organization

  has_secure_password
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username, scope: :organization_id
end
