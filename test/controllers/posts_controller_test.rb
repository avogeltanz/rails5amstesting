require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Arrange/Given
    @post_one = posts(:one)
    @post_two = posts(:two)
  end
  
  test "getting the first post" do
    # Act/When
    get post_url @post_one.id
    # Assert/Then
    assert_response :success
    assert_equal response.body, file_fixture('posts_first.json').read
  end

  test "getting the second post" do
    # Act/When
    get post_url @post_two.id
    # Assert/Then
    assert_response :success
    assert_equal response.body, file_fixture('posts_second.json').read
  end

  test "getting all posts" do
    # Act/When
    get posts_url
    # Assert/Then
    assert_response :success
    assert_equal response.body, file_fixture('posts_index.json').read
  end

  test "creating a post" do
    # Act/When
    post posts_url, params: { title: "Created Title", description: "Created Description" }
    # Assert/Then
    assert_response :success
    assert_equal response.body, file_fixture('posts_create.json').read
  end

  test "failed creation" do
    # Act/When
    post posts_url, params: { title: "Created Title", description: "C" }
    # Assert/Then
    assert_response :unprocessable_entity
    assert_equal response.body, file_fixture('posts_create_short_desc.json').read
  end

end
