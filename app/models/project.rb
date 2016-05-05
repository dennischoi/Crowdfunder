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
end
