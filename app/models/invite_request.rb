class InviteRequest < ApplicationRecord
	belongs_to :gamer
    belongs_to :team
end
