class Company < ApplicationRecord
    has_many :reviews
    has_many :rigs
    has_many :reviewed_rigs, through: :reviews, source: :rig

    has_secure_password
end
