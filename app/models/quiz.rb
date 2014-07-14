class Quiz < ActiveRecord::Base
  # Relationships
  has_many :questions
end
