class Company < ApplicationRecord
    has_many :rigs
    has_many :oilfields, through: :rigs

    has_secure_password
end
