class Recipe < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy

    validates :title, presence: true
    validates :ingredients, presence: true
    validates :instructions, presence: true
end
