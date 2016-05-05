class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :pledges

  belongs_to :owner, class_name: "User"

  accepts_nested_attributes_for :rewards


  def date_left
    project_days_length = (self.end_date - Date.today).to_i
  end

  def total_moneh
    funds_raised = 0
    self.rewards.map do |reward|
      plebs = reward.pledges.length
      reward_amount = plebs * reward.amount
      funds_raised += reward_amount
    end
      return funds_raised
  end
end
