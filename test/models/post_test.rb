require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "Barack", username: "Prez", email: "POTUS@whitehouse.gov")
    @post = @user.posts.build(title: "Every sighting of BigFoot ever.", content: "This is the truest thing about BigFoot ever said.")
  end
  
  test "post should be valid" do
    assert @post.valid?
  end
  
  test "user_id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end
  
  test "title should be present" do
    @post.title = ""
    assert_not @post.valid?
  end
  
  test "title should not be too long" do
    @post.title = "a" * 101
    assert_not @post.valid?
  end
  
  test "title should not be too short" do
    @post.title = "aaaa"
    assert_not @post.valid?
  end
  
  test "content should be present" do
    @post.content = ""
    assert_not @post.valid?
  end
  
  test "content should not be too long" do
    @post.content = "a" * 500
    assert_not @post.valid?
  end
  
  test "content should not be too short" do
    @post.content = "aaaa"
    assert_not @post.valid?
  end
  
end