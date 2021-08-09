class Rig < ApplicationRecord
    has_many :reviews
    has_many :companies, through: :reviews
    belongs_to :company

    scope :deepest, -> { order(max_depth: :desc)}

    validates :name, :location, :classification, presence: true
    validates :min_depth, numericality: {greater_than_or_equal_to: 120, only_integer: true}
    validates :max_depth, numericality: {greater_than_or_equal_to: 120, less_than_or_equal_to: 35000, only_integer: true}
end
