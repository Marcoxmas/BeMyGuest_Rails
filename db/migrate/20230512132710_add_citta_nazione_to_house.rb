class AddCittaNazioneToHouse < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :citta, :string
    add_column :houses, :nazione, :string
  end
end
