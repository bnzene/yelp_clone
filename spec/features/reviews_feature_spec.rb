require 'rails_helper'

  feature 'reviewing' do
    scenario 'allows users to leave a review using a form' do
      create_default_user_1
      log_in_default_user_1
      create_default_restaurant
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('so so')
    end
  end
