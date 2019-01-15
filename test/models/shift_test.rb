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

  #
  # Associations
  #

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
#  start_date  :date
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
