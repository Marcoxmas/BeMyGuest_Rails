class CreateProvides < ActiveRecord::Migration[7.0]
  def change
    create_table :provides do |t|
      t.integer :house_id
      t.integer :service_id

      t.timestamps
    end
  end
end
