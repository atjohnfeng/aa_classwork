require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    background :each do 
        visit new_user_path
    end
    scenario 'has a new user page' do
        expect(page).to have_content('Register')
        expect(page).to have_content('Sign Up')
    end
    scenario 'takes in a username and password' do
        expect(page).to have_content('Username')
        expect(page).to have_content('Password')
    end

    feature 'signing up a user' do 
        scenario 'shows username on the homepage after signup' do
            fill_in 'Username', with: 'goalman'
            fill_in 'Password', with: 'abcdef'
            click_button 'Register'
            save_and_open_page
            expect(page).to have_content('goalman')
        end
    end
end

feature 'logging in' do
    background :each do 
        visit new_session_path
    end
    let(:user) {User.new(username: 'goalman', password: 'abcdef')}
    scenario 'shows username on homepage after login' do
        fill_in 'Username', with: 'goalman'
        fill_in 'Password', with: 'abcdef'
        click_button 'Login'
        save_and_open_page
        expect(page).to have_content('goalman')
    end
end

feature 'logging out' do
    let(:user) {User.new(username: 'goalman', password: 'abcdef')}
    background :each do 
        visit new_session_path
    end

    scenario 'begins with logged out state' do
        expect(page).to have_content('Login')
    end
    scenario 'doesn\'t show username on homepage after logout' do
        fill_in 'Username', with: 'goalman'
        fill_in 'Password', with: 'abcdef'
        click_button 'Login'
        save_and_open_page
        click_button 'Logout'
        save_and_open_page
        expect(page).not_to have_content('goalman')
    end
end
