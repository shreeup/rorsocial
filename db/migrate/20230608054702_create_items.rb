class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.text :text

      t.timestamps
    end
  end
end
