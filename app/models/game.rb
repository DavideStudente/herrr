class Game < ApplicationRecord
 has_many :playings
  has_many :groups , through: :playings
end
