class AddReferencesForUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :tours, :organization, foreign_key: true
    add_reference :tours, :user, foreign_key: true
    add_reference :stops, :tour, foreign_key: true
    add_reference :stops, :user, foreign_key: true
  end
end
