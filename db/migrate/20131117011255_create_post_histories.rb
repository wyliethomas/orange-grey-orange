class CreatePostHistories < ActiveRecord::Migration
  def change
    create_table :post_histories do |t|
      #save a copy of every page change
      t.column :title,                          :string
      t.column :template_id,                    :integer
      t.column :post_id,                        :integer  
      t.column :type_id,                        :integer
      t.column :main_nav,                       :boolean  
      t.column :side_nav,                       :boolean  
      t.column :summary,                        :text
      t.column :content,                        :text
      t.column :status,                         :string
      t.column :sort,                           :string
      t.column :user_id,                        :integer

      t.timestamps
    end
  end
end
