require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'

describe "application pages" do
  subject { page }
  describe "not signed in" do
    before { visit root_path }

    # it "should have a link sign in" do
    #   page.should have_link("Sign up", :href => new_user_registration_path)
    it { should have_link("Login", :href => new_user_session_path) }
    it { should have_link("Sign up", :href => new_user_registration_path) }

  end

  describe "signed in" do

  end
end