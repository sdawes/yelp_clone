require 'rails_helper'

feature '' do
  feature 'USERS' do
    context 'User not signed in and on the home page' do
      scenario 'should see a sign-in link and sign-up link' do
        visit('/')
        expect(page).to have_link('Sign in')
        expect(page).to have_link('Sign up')
      end

      scenario 'should not see sign-out link' do
        visit('/')
        expect(page).not_to have_link('Sign out')
      end
    end

    context 'User signed in on the home page' do
      before do
        visit('/')
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testpassword')
        fill_in('Password confirmation', with: 'testpassword')
        click_button('Sign up')
      end

      scenario 'should see sign-out link' do
        visit('/')
        expect(page).to have_link('Sign out')
      end

      scenario 'should not see a sign-in link and sign-up link' do
        visit('/')
        expect(page).not_to have_link('Sign in')
        expect(page).not_to have_link('Sign up')
      end
    end
  end
end
