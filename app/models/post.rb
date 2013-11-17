class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :post
  belongs_to :template
  belongs_to :type
  belongs_to :site_admin
  has_many :posts

  after_save :backup

  scope :pages, where("type_id = 1")
  scope :blogs, where("type_id = 2")


  def backup
    #create a copy in the history
  end
end
