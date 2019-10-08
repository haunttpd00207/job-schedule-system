class CreateSuggests < ActiveRecord::Migration[5.2]
  def change
    create_table :suggests do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
