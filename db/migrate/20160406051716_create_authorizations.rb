class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :uid
      t.string :provider
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
