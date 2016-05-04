class Reward < ActiveRecord::Base
  has_many :pledges
  belongs_to :project
  
end
