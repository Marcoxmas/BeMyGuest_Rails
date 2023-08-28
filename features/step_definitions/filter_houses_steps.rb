Given ("there are houses with different availability dates") do
    @owner = User.create!(email: "owner@example.com", password: "password", confirmed_at: Time.now)
    @house1 = House.create!(user_id: @owner.id, photos: [fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'ex_foto_appartamento.jpg'), 'image/jpeg')], data_in: '2023-10-18', data_out: '2023-10-19')
    @house2 = House.create!(user_id: @owner.id, photos: [fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'ex_foto_appartamento.jpg'), 'image/jpeg')], data_in: '2023-11-18', data_out: '2023-11-19')
    @house3 = House.create!(user_id: @owner.id, photos: [fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'ex_foto_appartamento.jpg'), 'image/jpeg')], data_in: '2023-12-18', data_out: '2023-12-19')
end

When ("I am on the search results page") do
    visit houses_path
end

When("I select a start date and an end date for availability") do
    fill_in "data_in" , with:"2023-10-18"
    fill_in "data_out" , with:"2023-11-19"
end

When("I click on the {string} button") do |button_text|
    click_button button_text 
end

Then("I should see only the houses that are available within the selected dates") do
    expect(page).to have_link("Mostra questa casa", href: house_path(@house1))
    expect(page).to have_link("Mostra questa casa", href: house_path(@house2))
end

Then("I should not see houses that are not available within the selected dates") do
    expect(page).not_to have_link("Mostra questa casa", href: house_path(@house3))
end

