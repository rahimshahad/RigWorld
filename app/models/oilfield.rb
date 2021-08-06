class Oilfield < ApplicationRecord
    has_many :rigs
    has_many :companies, through: :rigs
end
