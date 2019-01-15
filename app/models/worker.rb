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

  #
  # Protected instance methods
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
