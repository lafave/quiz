class Question < ActiveRecord::Base
  # Relationships
  belongs_to :quiz
  has_many   :answers
end
