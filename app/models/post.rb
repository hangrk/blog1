# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  content     :text
#  user_id     :integer
#  category_id :integer
#  views       :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  title       :string(255)
#

class Post < ActiveRecord::Base
  attr_accessible :title, :category_id, :content, :views
  belongs_to :user
  belongs_to :category

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates_presence_of :category

  default_scope order: 'posts.created_at DESC'
end
