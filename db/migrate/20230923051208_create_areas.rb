class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|

      # 地域名（空はNG)
      t.string "name", null: false
      t.timestamps
    end
  end
end
