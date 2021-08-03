class Oilfield < ApplicationRecord
    has_many :rigs
    has_many :companies, through: :rigs
    belongs_to :category
end
