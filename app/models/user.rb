class User < ApplicationRecord
  include Clearance::User

  has_many :choiceboards
  has_many :options
end
