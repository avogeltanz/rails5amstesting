class TestSubModel
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :id, :one, :two, :three, :four

  def self.all
    YAML.load_file(File.expand_path("#{Dir.pwd}/app/models/prototypes/#{self.new.class.name.pluralize.underscore.downcase}.yml", __dir__))
  end
end
