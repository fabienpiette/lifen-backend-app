# frozen_string_literal: true


class Worker < ApplicationRecord
  #
  # Enumerize
  #
  extend Enumerize
  enumerize :status, in: %i[medic intern interim]

  #
  # Validations
  #
  validates :status,
            :paid,
            presence: true

  #
  # Associations
  #
  has_many :shifts,
           class_name: 'Shift',
           foreign_key: 'user_id',
           dependent: :destroy,
           inverse_of: :worker

  #
  # Through Associations
  #

  #
  # Callbacks
  #

  #
  # Scopes
  #
  status.values.each do |value|
    scope value.gsub(/\d+/, '').pluralize, -> { where(status: value) }
  end

  #
  # Supports
  #

  #
  # Public class methods
  #

  #
  # Public instance methods
  #
  def display_name
    first_name
  end

  def commission
    total_shifts_price * 0.05
  end

  #
  # Protected instance methods
  #
  protected

  def total_shifts_price
    (paid * 2 * weekend_shifts.length) + (paid * week_shifts.length)
  end

  def weekend_shifts
    shifts.where(day_name: %w[saturday sunday])
  end

  def week_shifts
    shifts.where.not(day_name: %w[saturday sunday])
  end
end

# == Schema Information
#
# Table name: workers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string           not null
#  paid       :integer          default(0), not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
