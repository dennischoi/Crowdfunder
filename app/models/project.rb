class Project < ActiveRecord::Base
  has_many :rewards, inverse_of: :project
  has_many :pledges, through: :rewards
  has_many :backers, through: :pledges

  belongs_to :owner, class_name: "User"

  accepts_nested_attributes_for :rewards

  validates :owner_id, :name, :end_date, :funding_goal, presence: true

  validate :not_before_today
  validate :within_sixty_days?

  def not_before_today
    errors.add(:end_date, "you can't set end date to today or earlier") unless (end_date <=> Date.today) == 1
  end

  def within_sixty_days?
    errors.add(:end_date, "you can't set end date to today or earlier") unless (end_date <=> Date.today+60.days) == -1
  end

  def date_left
    project_days_length = (self.end_date - Date.today).to_i
  end

  def total_moneh
    funds_raised = 0
    self.rewards.map do |reward|
      total_pledge = reward.pledges.length
      reward_amount = total_pledge * reward.amount
      funds_raised += reward_amount
    end
      return funds_raised
  end
end
