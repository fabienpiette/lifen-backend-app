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

  #
  # Associations
  #

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
