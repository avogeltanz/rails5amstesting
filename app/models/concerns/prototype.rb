module Prototype
  extend ActiveSupport::Concern

  module ClassMethods

    def prototype(fixture, id='no_id')
      temp_proto = YAML.load_file(File.expand_path("../prototypes/#{self.new.class.name.pluralize.underscore.downcase}.yml", __dir__))[fixture]
      unless temp_proto.class == Array
        self.new(temp_proto.tap {|tp| tp['id'] ||= id if self.instance_methods.include?(:id=)})
      else
        [].tap do |arr|
          temp_proto.each_with_index do |tp, index|
            arr << self.new(tp.tap {|t| t['id'] ||= index + 1 if self.instance_methods.include?(:id=)})
          end
        end
      end
    end

  end
  
end
