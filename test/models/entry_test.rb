require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  def setup
  @user = users(:michael)
  @retry = Retry.new(title: "title", body: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @retry.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @retry.valid?
  end

end
