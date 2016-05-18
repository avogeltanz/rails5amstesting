require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "creating a post" do
    # Arrange/Given
    post = Post.new    
    post.title = "Focus"    
    post.description = "Jared"
    # Act/When Assert/Then
    assert post.save
  end

  test "an invalid model" do
    # Arrange/Given
    post = Post.new    
    # Act/When 
    post.valid?
    # Assert/Then
    assert_equal post.errors[:title], ["can't be blank"]
    assert_equal post.errors[:description], ["can't be blank", "pick a longer description"]
  end

  test "a description that is too long" do
    # Arrange/Given
    post = Post.new    
    post.title = "Focus" 
    focuser = "Jared"
    3.times do
      focuser += focuser
    end   
    post.description = focuser + "!"
    # Act/When 
    post.valid?
    # Assert/Then
    assert_equal post.errors[:description], ["pick a shorter description"]
  end

end
