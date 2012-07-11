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

require 'spec_helper'

describe Post do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  before { @post = user.posts.build(title: "Lorem is", content: "Lorem ipsum", category_id: category.id) }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:views) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:category_id) }
  it { should respond_to(:category) }
  its(:user) { should == user }
	its(:category) { should == category }
  
  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Post.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @post.title = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @post.content = nil }
    it { should_not be_valid }
  end
end
