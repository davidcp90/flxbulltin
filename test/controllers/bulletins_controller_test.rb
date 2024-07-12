require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulletin = bulletins(:one)
  end

  test "should get index" do
    get bulletins_url, as: :json
    assert_response :success
  end

  test "should create bulletin" do
    assert_difference("Bulletin.count") do
      post bulletins_url, params: { bulletin: { ack_required: @bulletin.ack_required, author: @bulletin.author, content: @bulletin.content, cover_image: @bulletin.cover_image, created_at: @bulletin.created_at, publishing_date: @bulletin.publishing_date, send_email: @bulletin.send_email, slug: @bulletin.slug, summary: @bulletin.summary, title: @bulletin.title } }, as: :json
    end

    assert_response :created
  end

  test "should show bulletin" do
    get bulletin_url(@bulletin), as: :json
    assert_response :success
  end

  test "should update bulletin" do
    patch bulletin_url(@bulletin), params: { bulletin: { ack_required: @bulletin.ack_required, author: @bulletin.author, content: @bulletin.content, cover_image: @bulletin.cover_image, created_at: @bulletin.created_at, publishing_date: @bulletin.publishing_date, send_email: @bulletin.send_email, slug: @bulletin.slug, summary: @bulletin.summary, title: @bulletin.title } }, as: :json
    assert_response :success
  end

  test "should destroy bulletin" do
    assert_difference("Bulletin.count", -1) do
      delete bulletin_url(@bulletin), as: :json
    end

    assert_response :no_content
  end
end
