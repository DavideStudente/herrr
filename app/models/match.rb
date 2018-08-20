class Match < ApplicationRecord
#	validate :must_have_challenge

	belongs_to :team
	belongs_to :matching_team, class_name: 'Team'

	def must_have_challenge # 1..*
		errors.add(:base, 'Must have been challenged first') if !team.challenging_teams.to_a.include?(matching_team) 
	end
end
