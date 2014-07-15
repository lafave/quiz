class Response < ActiveRecord::Base
  # Relationships
  belongs_to :attempt
  has_one    :answer, inverse_of: false
end
