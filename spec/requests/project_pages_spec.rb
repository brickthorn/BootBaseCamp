require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'


describe "project pages" do
  subject { page }
  let (:user1) { Fabricate(:user) }
  let (:user2) { Fabricate(:user) }


  describe "when signed out" do
    before { get root_path }
    specify { response.should redirect_to home_path }

    it "should redirect from the home page appropriately" do
      visit root_path
      page.should have_selector("title", :text => "Welcome!")
    end
  end

  describe "when signed in" do
    before do
      visit new_user_session_path
      fill_in "Email",    with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign in"
      get root_path
    end

    it "should redirect to articles index if user signed in" do
      response.should render_template :index
      page.should have_content('Projects')
    end

    it "should have a link to create a project" do
      page.should have_link("Add Project", :href => new_project_path)
    end

    describe "adding project" do
      before { click_link "Add Project" }

      it "should go to new project fill ins" do
        page.should have_selector("label", :text => "Project title")
      end

      describe "valid project" do
        before { fill_in "project_title", :with => "SternoCliedoMastoid Issues" }
        it "should accept field inputs" do
          click_button 'Create Project'
        end

        it "should increase the number of projects by 1" do
          lambda { click_button "Create Project" }.should change(Project, :count).by(1)
        end

        it "should return to the project index" do
          click_button "Create Project"
          response.should render_template :index
        end
      end

      describe "invalid project" do
        it "should return the form with an error message" do
          click_button 'Create Project'
        end

      end
    end
  end
end
