Given("there is a house with an owner") do
    @owner = User.create!(email: "owner@example.com", password: "password", confirmed_at: Time.now)
    @house = House.create!(user_id: @owner.id, photos: [fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'ex_foto_appartamento.jpg'), 'image/jpeg')], data_in: '2023-10-18', data_out: '2023-10-19')
end

Given("I am logged in as another user") do
    @user = User.create!(email: "another@example.com", password: "password", confirmed_at: Time.now)
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Log In"
end

Given("I have a house of my own") do
    @myhouse = House.create!(user_id: @user.id, photos: [fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'ex_foto_appartamento.jpg'), 'image/jpeg')], data_in: '2023-10-18', data_out: '2023-10-19')
end

When("I am on the house details page") do
    visit house_path(@house)
end

When("I click on the {string} link") do |link_text|
    click_link link_text
end

Then("I should see {string}") do |message|
    expect(page).to have_content(message)
end