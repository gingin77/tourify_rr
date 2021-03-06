class Admin < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username, scope: :organization_id
end
