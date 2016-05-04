class User < ActiveRecord::Base
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :projects, through: :rewards
  has_many :owned_projects, class_name: "Project"

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

end
