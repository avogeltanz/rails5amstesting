class Post < ApplicationRecord
  validates_presence_of :title, :description
  validates_length_of :description, within: 5..40, too_long: 'pick a shorter description', too_short: 'pick a longer description'
end
