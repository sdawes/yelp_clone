require 'rails_helper'

  feature 'REVIEWS FEATURES' do
    before { Restaurant.create name: 'KFC' }

    scenario 'allows users to leave a review using a form' do
      sign_up_user
      create_kfc
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('so so')
    end
  end

  private

  def sign_up_user
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def create_kfc
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: "KFC"
    click_button 'Create Restaurant'
  end
