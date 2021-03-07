class Choice < ApplicationRecord
  belongs_to :chooseable, polymorphic: true
end
