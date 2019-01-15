# frozen_string_literal: true

class Planning < ApplicationRecord
  #
  # Validations
  #
  validates :name,
            presence: true

  #
  # Associations
  #
  has_many :shifts,
           class_name: 'Shift',
           foreign_key: 'planning_id',
           dependent: :destroy,
           inverse_of: :planning

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
    name
  end

  #
  # Protected instance methods
  #
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
