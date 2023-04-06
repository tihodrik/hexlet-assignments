# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  completed   :boolean          default(FALSE), not null
#  creator     :string           not null
#  description :text
#  name        :string           not null
#  performer   :string
#  status      :string           default("new"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates :completed, inclusion: [true, false]
end
