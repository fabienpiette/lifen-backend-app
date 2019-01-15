# frozen_string_literal: true


require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  #
  # Setups
  #
  def setup
    @shift = shifts(:medic)
  end

  #
  # Validations
  #
  test 'valid shift' do
    assert @shift.valid?
  end

  test 'invalid without start_date' do
    shift = shifts(:medic)
    shift.start_date = nil

    assert_not @shift.valid?, 'shift is valid without a start_date'
    assert_not_nil @shift.errors[:start_date], 'no validation error for start_date present'
  end

  #
  # Associations
  #
  test '#planning' do
    assert_not_nil @shift.planning
  end

  test '#worker' do
    assert_not_nil @shift.worker
  end

  #
  # Scopes
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
  #
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
