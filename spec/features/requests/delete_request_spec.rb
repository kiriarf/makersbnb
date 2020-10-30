feature "deleting requests" do
  scenario "host can deny a request" do
    sign_up_host
    add_space
    click_button('Sign Out')
    make_request
    visit('/')
    click_button('My Account')
    within("div#sent") do
      expect(page).to have_content("12 Ham Street")
    end
    visit('/')
    click_button('Sign Out')

    click_button('Sign In')
    fill_in 'username', with: 'CDog'
    fill_in 'password', with: 'ihatedogs'
    click_on('Submit')
    visit('/')
    click_button('My Account')
    within("div#received") do
      expect(page).to have_content("12 Ham Street")
    end
  end
end