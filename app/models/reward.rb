class Reward < ActiveRecord::Base
  has_many :pledges
  belongs_to :project ,inverse_of: :rewards

  validates :name, :amount,  presence: true
  validates_presence_of :project
end
