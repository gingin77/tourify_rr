class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :username,
                null: false,
                unique: true,
                length: { maximum: 20 }
      t.string :password_digest,
                null: false,
                length: { maximum: 20 }
      t.timestamps
    end
  end
end
