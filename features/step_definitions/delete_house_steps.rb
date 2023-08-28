Given("I am logged in as a user") do
    @user = User.create!(email: "another@example.com", password: "password", confirmed_at: Time.now)
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Log In"
end

Given("I have added a house") do
    @house1 = House.create!(user_id: @user.id, photos: [fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'ex_foto_appartamento.jpg'), 'image/jpeg')], data_in: '2023-10-18', data_out: '2023-10-19')
end

When("I visit my profile page") do
    visit user_path(@user)
end

Then("I should see a confirmation message") do
    expect(page).to have_content("House was successfully deleted.")
end

Then("I should not see the deleted house on my profile page") do
    expect(page).not_to have_link("Mostra questa casa", href: house_path(@house1))
end

Then("the deleted house should not be in the database") do
    expect(House.exists?(@house1.id)).to be_falsey
end

    




