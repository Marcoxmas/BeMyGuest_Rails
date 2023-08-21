Given("I am logged in as an admin user") do
  @admin = User.create!(email: "admin@example.com", password: "password", user_type: 'admin', confirmed_at: Time.now)
  visit new_user_session_path
  fill_in "Email", with: @admin.email
  fill_in "Password", with: "password"
  click_button "Log In"
end

When("I am on the owner's profile page") do
    visit user_path(@owner)
end

When("I click on one {string} button") do |button_text|
    button = page.find("button[data-house-id='#{@house.id}']", text: button_text)
    button.click
end