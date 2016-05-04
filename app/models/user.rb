class User < ActiveRecord::Base
  has_many :pledges, foreign_key: 'backer_id'
  has_many :rewards, through: :pledges
  has_many :projects, through: :rewards
  has_many :owned_projects, class_name: "Project", foreign_key: 'owner_id'

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

end
