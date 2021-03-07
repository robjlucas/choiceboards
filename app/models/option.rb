class Option < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :choiceboards, as: :chooseable
end
