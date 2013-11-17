class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title,                          :string
      t.column :template_id,                    :integer
      t.column :post_id,                        :integer    #flag if a sub-page
      t.column :type_id,                        :integer
      t.column :featured,                       :boolean    #flag of its a featured page
      t.column :main_nav,                       :boolean    #flag if on the main nav
      t.column :side_nav,                       :boolean    #flag if on the side nav
      t.column :summary,                        :text
      t.column :content,                        :text
      t.column :status,                         :string
      t.column :sort,                           :string
      t.column :user_id,                        :integer

      t.timestamps
    end
  end
end
