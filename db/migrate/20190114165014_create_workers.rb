# frozen_string_literal: true

class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :first_name, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
