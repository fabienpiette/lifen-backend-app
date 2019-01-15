# frozen_string_literal: true

class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.date :start_date, null: false

      t.belongs_to :user, index: true
      t.belongs_to :planning, index: true

      t.timestamps
    end
  end
end
