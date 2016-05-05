class Pledge < ActiveRecord::Base
  belongs_to :backer, class_name: "User"
  belongs_to :reward

  # validate :is_current_user, user: current_user
  validates :backer_id, :reward_id, presence: true


  # def is_current_user(current_user)
  #   errors.add(:backer_id, "you are not who you claim to be! Hacker!") unless backer_id == current_user.id
  # end

end
