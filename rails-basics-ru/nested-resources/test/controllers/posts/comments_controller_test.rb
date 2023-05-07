# frozen_string_literal: true

require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:without_comments)
    @comment = post_comments(:one)
    @attrs = {
      author: Faker::Movies::HarryPotter.character,
      body: Faker::ChuckNorris.fact
    }
  end

  test 'should show comments on post page' do
    post = posts(:one)
    get post_url post

    assert_select 'h1', 'One'
    assert_select 'p', post.comments.count + 2
  end

  test 'should render form for new comment on post page' do
    get post_url @post
    assert_select 'form', 1
  end

  test 'sould create comment' do
    assert_difference('PostComment.count', 1) do
      post post_comments_path(posts(:one)), params: { post_comment: @attrs }
    end

    comment = PostComment.find_by @attrs

    assert { comment }
    assert_redirected_to post_url(posts(:one))
  end

  test 'should get edit' do
    get edit_comment_path(@comment)
    assert_response :success
  end

  test 'should update comment' do
    patch comment_path(@comment), params: { post_comment: @attrs }

    @comment.reload

    assert { @comment.author == @attrs[:author] }
    assert_redirected_to post_url(@comment.post)
  end

  test 'should destroy comment' do
    assert_difference('PostComment.count', -1) do
      delete comment_path(@comment)
    end

    assert { !PostComment.exists?(@comment.id) }

    assert_redirected_to post_url(@comment.post)
  end
end
