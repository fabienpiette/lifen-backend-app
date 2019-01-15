# frozen_string_literal: true

require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  #
  # Setups
  #
  def setup
    @worker = workers(:medic)
  end

  #
  # Setups
  #
  test 'status must be in enumerize' do
    worker = workers(:medic)
    worker.status = :foo

    assert_not worker.valid?
  end

  #
  # Validations
  #
  test 'valid worker' do
    assert @worker.valid?
  end

  test 'invalid without status' do
    worker = workers(:medic)
    worker.status = nil

    assert_not @worker.valid?, 'worker is valid without a status'
    assert_not_nil @worker.errors[:status], 'no validation error for status present'
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
# Table name: workers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
