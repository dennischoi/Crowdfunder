class User < ActiveRecord::Base
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :projects, through: :rewards
  has_many :owned_projects, class_name: "Project"

end
