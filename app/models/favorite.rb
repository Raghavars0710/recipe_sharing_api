class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    validates :user_id, presence: true, uniqueness: true
    validates :recipe_id, presence: true
end
