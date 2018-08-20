class Challenge < ApplicationRecord
	belongs_to :team
	belongs_to :challenging_team, class_name: 'Team'
end
