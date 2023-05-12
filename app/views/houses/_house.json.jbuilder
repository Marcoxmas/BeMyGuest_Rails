json.extract! house, :id, :user_id, :tipologia, :superficie, :n_bagni, :n_camere, :n_cucine, :n_soggiorni, :n_singoli, :n_doppi, :n_culle, :n_divani, :allergie, :animali, :desc_casa, :desc_quartiere, :data_in, :data_out, :place_id, :created_at, :updated_at
json.url house_url(house, format: :json)
