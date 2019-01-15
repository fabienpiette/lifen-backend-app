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

  test 'invalid without paid' do
    worker = workers(:medic)
    worker.paid = nil

    assert_not @worker.valid?, 'worker is valid without a paid'
    assert_not_nil @worker.errors[:paid], 'no validation error for paid present'
  end

  #
  # Associations
  #
  test '#shifts' do
    assert_equal 2, @worker.shifts.size
  end

  #
  # Scopes
  #
  test '#medics' do
    assert_includes Worker.medics, workers(:medic)
    assert_not_includes Worker.medics, workers(:intern)
  end

  test '#intern' do
    assert_includes Worker.interns, workers(:intern)
    assert_not_includes Worker.interns, workers(:medic)
  end

  test '#interim' do
    assert_includes Worker.interims, workers(:interim)
    assert_not_includes Worker.interims, workers(:medic)
  end

  #
  # Public class methods
  #

  #
  # Public instance methods
  #
  test '#display_name' do
    assert_equal @worker.display_name, @worker.first_name
  end

  test '#commission' do
    assert_equal @worker.commission, 54.0
  end

  #
  # Protected instance methods
  #
  test '#total_shifts_price' do
    assert_equal @worker.send(:total_shifts_price), 1080
  end

  test '#weekend_shifts' do
    assert_equal 2, @worker.send(:weekend_shifts).size
  end

  test '#week_shifts' do
    assert_equal 0, @worker.send(:week_shifts).size
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
