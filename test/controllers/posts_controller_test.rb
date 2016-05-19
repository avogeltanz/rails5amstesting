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
    res_json = JSON.parse(response.body)
    assert_equal @post_one.title, res_json['title']
    assert_equal @post_one.description, res_json['description']
  end

  test "getting the second post" do
    # Act/When
    get post_url @post_two.id
    # Assert/Then
    assert_response :success
    res_json = JSON.parse(response.body)
    assert_equal @post_two.title, res_json['title']
    assert_equal @post_two.description, res_json['description']
  end
  
  test "finding a nonexistant post" do
    # Act/When
    get post_url 'fred'
    # Assert/Then
    assert_response :not_found
    assert_equal response.body, not_found('Post', 'fred')
  end

  test "getting all posts" do
    # Act/When
    get posts_url
    # Assert/Then
    assert_response :success
    res_json = JSON.parse(response.body)
    assert_equal 2, res_json.count
  end

  test "successfully creating a post" do
    # Act/When
    post posts_url, params: { title: "Created Title", description: "Created Description" }
    # Assert/Then
    assert_response :success
    res_json = JSON.parse(response.body)
    assert_equal "Created Title", res_json['title']
    assert_equal "Created Description", res_json['description'] 
  end

  test "a failed post creation" do
    # Act/When
    post posts_url, params: { title: "Created Title", description: "C" }
    # Assert/Then
    assert_response :unprocessable_entity
    assert_equal response.body, file_fixture('posts_create_422.json').read
  end

end
