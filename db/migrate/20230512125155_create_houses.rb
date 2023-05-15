class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :tipologia
      t.float :superficie
      t.integer :n_bagni
      t.integer :n_camere
      t.integer :n_cucine
      t.integer :n_soggiorni
      t.integer :n_singoli
      t.integer :n_doppi
      t.integer :n_culle
      t.integer :n_divani
      t.boolean :allergie
      t.string :animali
      t.text :desc_casa
      t.text :desc_quartiere
      t.date :data_in
      t.date :data_out
      t.string :place_id
      t.timestamps
    end
  end
end
