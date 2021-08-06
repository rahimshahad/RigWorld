class Rig < ApplicationRecord
    has_many :reviews
    has_many :companies, through: :reviews
    belongs_to :company
end
