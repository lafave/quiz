class Attempt < ActiveRecord::Base
  # Relationships
  belongs_to :user,      counter_cache: true
  belongs_to :quiz
  has_many   :responses, dependent: :destroy
end
