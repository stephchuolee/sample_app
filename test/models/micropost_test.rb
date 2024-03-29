require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:steph)
    # This code is not idiomatically correct:
    # @micropost = Micropost.new(content: "Lorem", user_id: @user.id)
    # This is correct:
    @micropost = @user.microposts.build(content: "Lorem")
  end
  
  test "should be valid" do
    # Sanity check
    assert @micropost.valid?
  end
  
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end
  
  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
  
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
