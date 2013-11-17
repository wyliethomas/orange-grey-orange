class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.column :name,                   :string

      t.timestamps
    end
  end
end
