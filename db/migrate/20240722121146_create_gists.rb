class CreateGists < ActiveRecord::Migration[7.1]
  def change
    create_table :gists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.string :gist_url

      t.timestamps
    end
  end
end
