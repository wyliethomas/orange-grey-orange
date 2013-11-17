class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.column :name,                     :string
      t.column :status,                   :string
      t.column :sort,                     :string

      t.timestamps
    end
  end
end
