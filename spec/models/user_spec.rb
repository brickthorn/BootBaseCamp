require 'spec_helper'

describe User do

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_me) }
  it { should have_many(:projects)}

  it "needs to have valid user attribute" do
    lambda { User.create(:email => "brick@gmail.com") }.should_not change(User, :count)
  end

  context "valid email address" do
    it "should not accept invalid email addresses" do
      ["tom", "foo@bar", "foo@bar-com"].each do |email|
        lambda { User.create(:email => email, :password => "foobar", :password_confirmation => "foobar" ) }.should_not change(User, :count)
      end
    end

    it "should store the correct email attributein the DB" do
      user = User.create(:email => "brick@gmail.com", :password => "foobar", :password_confirmation => "foobar")
      user_db = User.find_by_email("brick@gmail.com")
      user.should == user_db
      user.email.should == user_db.email
    end

    it "should not allow a duplicate user email" do
      User.create(:email => "brick@gmail.com", :password => "foobar", :password_confirmation => "foobar")
      User.create(:email => "brick@gmail.com", :password => "foobar", :password_confirmation => "foobar").should_not be_valid
    end
  end

  # context "valid password" do
  #   it "should "
  #   lambda { User.create(:email => email, :password => "foobar", :password_confirmation => "foobar" ) }.should_not change(User, :count)
  # end




end
