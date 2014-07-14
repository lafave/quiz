class Question < ActiveRecord::Base
  # Relationships
  belongs_to :quiz,    counter_cache: true
  has_many   :answers, dependent: :destroy

  # Validations
  validates :answers, length: { :maximum => 4 }
  validates :quiz,    presence: true
end
