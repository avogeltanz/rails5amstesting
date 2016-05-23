class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Prototype
end
