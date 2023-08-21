# features/step_definitions/house_steps.rb

Given("there is a user with email {string} and password {string}") do |email, password|
  User.create!(email: email, password: password, name: "example", confirmed_at: Time.now)
end

Given("I am logged in as {string}") do |email|
  visit new_user_session_path
  fill_in "Email", with: email
  fill_in "Password", with: "password"
  click_button "Log In"
end

When("I visit the new house page") do
  visit new_house_path
end

When("I fill in the house details") do
  # Fill in the house form fields here
  fill_in 'house_address', with: 'Via del Corso, 7, Roma RM, Italia'
  choose('house_tipologia_appartamento')
  fill_in 'superficie', with: '50'
  radio_button_no = find("#animali-no")
  radio_button_no.click
  fill_in 'house_desc_casa', with: 'esempio desc casa'
  fill_in 'house_desc_quartiere', with: 'esempio desc quartiere'
  attach_file('house_photos', Rails.root.join('test', 'fixtures', 'files', 'ex_foto_appartamento.jpg'))
  fill_in 'house_data_in', with: '2023-10-18'
  fill_in 'house_data_out', with: '2023-10-19'
end

When("I click the {string} button") do |button_text|
  click_button button_text
end

Then("I should see the message {string}") do |content|
  expect(page).to have_content(content)
end

