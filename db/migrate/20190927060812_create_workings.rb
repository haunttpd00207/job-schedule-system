class CreateWorkings < ActiveRecord::Migration[5.2]
  def change
    create_table :workings do |t|
      t.references :user, foreign_key: true
      t.datetime :checkin
      t.datetime :checkout
      t.text :content

      t.timestamps
    end
  end
end
