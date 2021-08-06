class Review < ApplicationRecord
    belongs_to :company 
    belongs_to :rig
end
