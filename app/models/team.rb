class Team < ApplicationRecord
  validates :name, length: {minimum: 3,maximum: 10},
                         presence: true, uniqueness: true


  has_one :boss, class_name: 'Gamer'

  has_many :invite_requests 
  has_many :invites, through: :invite_requests, source: :gamer
  
  has_many :matches
  has_many :matching_teams , through: :matches   
  
  has_many :challenges
  has_many :challenging_teams, through: :challenges 
  
  has_many :members
  has_many :gamers ,through: :members

  mount_uploader :avatar, TeamAvatarUploader

end
