class Attempt < ActiveRecord::Base
  # Relationships
  belongs_to :user,      counter_cache: true
  has_one    :quiz
  has_many   :responses, dependent: :destroy
end
