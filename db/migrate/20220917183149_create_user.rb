# frozen_string_literal: true

# Create Table for User
class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :postscounter

      t.timestamps
    end
  end
end
