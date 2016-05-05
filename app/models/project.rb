class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :pledges

  belongs_to :owner, class_name: "User"

  accepts_nested_attributes_for :rewards


  def date_left
    project_days_length = (self.end_date - Date.today).to_i
  end
end
