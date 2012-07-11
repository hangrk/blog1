# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Category < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :posts, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 50 }
end
