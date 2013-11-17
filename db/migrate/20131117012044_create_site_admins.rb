class CreateSiteAdmins < ActiveRecord::Migration
  def change
    create_table :site_admins do |t|
      t.column :first_name,               :string
      t.column :last_name,                :string
      t.column :email,                    :string
      t.column :password_hash,            :string
      t.column :password_salt,            :string

      t.timestamps
    end
  end
end
