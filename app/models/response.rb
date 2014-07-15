class Response < ActiveRecord::Base
  # Relationships
  belongs_to :attempt
  belongs_to :answer
end
