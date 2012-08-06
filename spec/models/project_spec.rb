require 'spec_helper'

describe Project do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:private) }
  it { should respond_to(:user_id) }
  it { should belong_to(:user) }
  it { should_not allow_mass_assignment_of(:user_id) }

  before { @user = User.create(:email => "foo@bar.com", :password => "foobar", :password_confirmation => "foobar") }

  it "defaults private to TRUE" do
    project =  @user.projects.create(:title => "not EMPTY")
    project.private.should eq TRUE
  end

end


# INTEGRATION TEST?
# it "assigns the user id to the current user" do
#   project =  Projects.create(:title => "not EMPTY")
#   project.user.should eq current_user
# end


# it "validates the existance of a title for each project" do
#   lambda { Project.create(:title => "", :private => TRUE) }.should_not change(Project, :count)
# end

# it "does not allow the user_id field to be accessible as a parameter" do
#   lambda { Project.create(:title => "not EMPTY", :user_id => 1) }.should raise_error
# end
