# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post, inverse_of: :comments

  validates :body, :author, presence: true
end
