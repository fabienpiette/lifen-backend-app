# frozen_string_literal: true


class Shift < ApplicationRecord
  #
  # Validations
  #
  validates :start_date,
            presence: true

  #
  # Associations
  #
  belongs_to :planning,
             class_name: 'Planning',
             foreign_key: 'planning_id',
             inverse_of: :shifts

  belongs_to :worker,
             class_name: 'Worker',
             foreign_key: 'user_id',
             inverse_of: :shifts

  #
  # Through Associations
  #

  #
  # Callbacks
  #
  before_save :define_day_name

  #
  # Scopes
  #

  #
  # Supports
  #

  #
  # Public class methods
  #

  #
  # Public instance methods
  #

  #
  # Protected instance methods
  #
  protected

  def define_day_name
    self.day_name = start_date&.strftime('%A')&.downcase
  end
end

# == Schema Information
#
# Table name: shifts
#
#  id          :bigint(8)        not null, primary key
#  day_name    :string           not null
#  start_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  planning_id :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_shifts_on_planning_id  (planning_id)
#  index_shifts_on_user_id      (user_id)
#
