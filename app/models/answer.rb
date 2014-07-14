class Answer < ActiveRecord::Base
  # Relationships
  belongs_to :question
end
