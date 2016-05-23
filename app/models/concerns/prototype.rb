module Prototype
  extend ActiveSupport::Concern

  module ClassMethods

    def prototype(fixture, id='no_id')
      self.new(YAML.load_file(File.expand_path("../proto/#{self.new.class.name.downcase}.yml", __dir__))[fixture].tap {|tp| tp['id'] = id})
    end

  end
  
end
