# frozen_string_literal: true


require 'test_helper'

class PlanningTest < ActiveSupport::TestCase
  #
  # Setups
  #
  def setup
    @planning = plannings(:one)
  end

  #
  # Validations
  #
  test 'valid planning' do
    assert @planning.valid?
  end

  test 'invalid without name' do
    planning = plannings(:one)
    planning.name = nil

    assert_not @planning.valid?, 'planning is valid without a name'
    assert_not_nil @planning.errors[:name], 'no validation error for name present'
  end

  #
  # Associations
  #
  test '#shifts' do
    assert_equal 4, @planning.shifts.size
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
  # test '#foo' do
  # end
end

# == Schema Information
#
# Table name: plannings
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
