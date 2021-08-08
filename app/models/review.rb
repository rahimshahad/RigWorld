class Review < ApplicationRecord
    belongs_to :company 
    belongs_to :rig

    validates :content, presence: true
end
