require 'test_helper'

class LegacyModelTest < ActiveSupport::TestCase
  setup do
    # this can be put in a rake task etc
    records = LegacyModel.find_all_records('pro_token_prs_rating', :dev_legacydb).take 5
    # convert db to yaml file for fixture
    count = 1
    @collection = []
    records.each do |record|
      tmp_hash = Hash.new
      # this gives it a name for fixture purposes
      tmp_hash["r#{count}"] = record.attributes
      # this cleans it up so that it can be a proper fixture
      @collection << "#{tmp_hash.to_yaml}".gsub(/\s\s!\s'':|---\n/, '')
      count = count + 1
    end
  end

  test "putting out the yaml collection" do
    puts @collection
  end 
end
