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
  # test '#foo' do
  # end
end

# == Schema Information
#
# Table name: plannings
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
