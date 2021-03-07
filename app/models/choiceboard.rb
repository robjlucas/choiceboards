class Choiceboard < ApplicationRecord
  belongs_to :user
  has_many :options, through: :choices
  has_many :choiceboards, through: :choices
end
