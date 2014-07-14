class Quiz < ActiveRecord::Base
  # Relationships
  has_many :questions, dependent: :destroy
end
