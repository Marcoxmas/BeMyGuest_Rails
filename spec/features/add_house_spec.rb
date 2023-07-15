# File: spec/features/add_house_spec.rb

require 'rails_helper'

RSpec.describe 'Aggiungi una casa', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    # Effettua l'accesso come utente
    sign_in user
  end

  it 'permette all\'utente di aggiungere una casa' do
    # Visita la pagina per aggiungere una casa
    visit new_house_path

    # Compila il form con i dettagli della casa
    fill_in 'Superficie in metri quadri', with: '100'
    # ... Compila gli altri campi del form

    # Carica almeno una foto
    attach_file 'Foto', Rails.root.join('spec', 'fixtures', 'sample_photo.jpg')

    # Compila il campo "Check in" con una data valida
    fill_in 'Check in', with: '2023-01-01'

    # Compila il campo "Check out" con una data valida
    fill_in 'Check out', with: '2023-01-07'

    # Seleziona una tipologia di casa (es. "Appartamento")
    choose 'Appartamento'

    # Seleziona il numero di camere da letto
    select '2', from: 'Camere da Letto'

    # ... Compila gli altri campi del form e seleziona le opzioni necessarie

    # Invia il form
    click_button 'Conferma e invia'

    # Verifica il comportamento dopo l'invio del form
    expect(page).to have_content('La casa è stata aggiunta con successo.')
    # ... Verifica altri dettagli della casa aggiunta

    # Verifica che la casa sia stata effettivamente salvata nel database
    # ... Verifica altri attributi della casa salvata
  end
end
