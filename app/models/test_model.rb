class TestModel
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :id, :one, :two, :three, :four

  def self.find(id)
    found = nil
    self.all.each do |tm|
      if tm.id === id.to_i
        found = tm
      end
    end
    found
  end

  def self.all
    YAML.load_file(File.expand_path("#{Dir.pwd}/app/models/prototypes/#{self.new.class.name.pluralize.underscore.downcase}.yml", __dir__))
  end

  def test_sub_models
    TestSubModel.all
  end
end
