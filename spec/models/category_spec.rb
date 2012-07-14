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

require 'spec_helper'

describe Category do
	let(:user) { FactoryGirl.create(:user) }
  before do
    @category = Category.new(name: "uncategorized", description: "default")
  end

  subject {@category}
  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe "when name is not present" do
    before { @category.name = " " }
    it { should_not be_valid }
  end

  describe "post associations" do
  	before { @category.save }
  	let!(:older_post) do 
      FactoryGirl.create(:post, category_id: @category.id, created_at: 1.day.ago)
    end
    let!(:newer_post) do
      FactoryGirl.create(:post, category_id: @category.id, created_at: 1.hour.ago)
    end

    it "should have the right posts in the right order" do
      @category.posts.should == [newer_post, older_post]
    end
  end
end
