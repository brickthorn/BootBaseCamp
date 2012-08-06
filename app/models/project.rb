class Project < ActiveRecord::Base
  attr_accessible :private, :title

  before_create :initialize_private

  validates_presence_of :user_id, :title

  belongs_to :user

  def initialize_private
    self.private = true
  end
end
