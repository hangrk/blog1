require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
      let(:user) { FactoryGirl.create(:user) }
      let(:category) { FactoryGirl.create(:category) }

    before do
      FactoryGirl.create(:post, user: user, category_id: category.id, content: "Lorem")
      FactoryGirl.create(:post, user: user, category_id: category.id, content: "Ipsum")
      visit root_path
    end

    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home' ) }
    it { should_not have_selector('a', text: 'Account') }
    it { should_not have_selector('a', text: 'edit') }
    it { should_not have_selector('a', text: 'delete') }

    describe "for signed-in users" do
      before do
        sign_in user
        visit root_path
      end

      it { should have_selector('a', text: 'Account') }
      it { should have_selector('a', text: 'Blog') }
      it { should have_selector('a', text: 'edit') }
      it { should have_selector('a', text: 'delete') }
    end

  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end
end