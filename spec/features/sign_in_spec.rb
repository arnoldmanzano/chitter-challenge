require_relative 'web_helpers'

feature 'Signing in to Chitter' do
  include UserHelpers

  before do
    User.create(
      username: 'amanzano',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'arnold@myemail.com',
      name: 'Arnold Manzano')
  end

  scenario 'Signing in successfully' do
    sign_in
    expect(page).to have_content('Welcome amanzano')
  end

  scenario 'Invalid username or user does not exist' do
    sign_in(username: 'otheruser')
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Invalid username/password')
  end

  scenario 'Invalid password' do
    sign_in(password: 'wrong_password')
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Invalid username/password')
  end
end
