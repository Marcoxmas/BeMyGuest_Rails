class CreateEmailMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :email_messages do |t|
      t.string :sender
      t.string :dest
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
