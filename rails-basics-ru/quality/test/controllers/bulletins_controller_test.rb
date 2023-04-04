# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'it gets index' do
    get bulletins_url
    assert_response :success
  end

  test 'it contais all bulletins on index page' do
    get bulletins_url

    assert_select 'h1', 'Bulletins'

    assert_select 'ol' do |lists|
      lists.each do
        assert_select 'li' do |elements|
          elements.each_with_index do |_bulletin, i|
            assert_select 'a', bulletins("bulletin_#{i + 1}".to_sym).title
          end
        end
      end
    end
  end

  test 'it shows every bulletin' do
    bulletins.each do |bulletin|
      get bulletin_url(bulletin.id)
      assert_response :success
      assert_select 'h1', bulletin.title
      assert_select 'p', bulletin.body
    end
  end
end
