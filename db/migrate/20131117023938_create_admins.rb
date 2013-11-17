class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.column :first_name,               :string
      t.column :last_name,                :string
      t.column :email,                    :string
      t.column :password_hash,            :string
      t.column :password_salt,            :string
      t.column :status,                   :string

      t.timestamps
    end
  end
end
