module Pipeable
  extend ActiveSupport::Concern

  def |(other)
    other.call(self)
  end

  module ClassMethods

    def call(arg)
      new(arg)
    end

  end

end
