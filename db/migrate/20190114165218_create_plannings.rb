# frozen_string_literal: true

class CreatePlannings < ActiveRecord::Migration[5.2]
  def change
    create_table :plannings do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
