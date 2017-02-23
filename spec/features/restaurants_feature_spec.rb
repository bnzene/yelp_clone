require 'rails_helper'

feature 'restaurants' do
  context 'user not logged in' do
    before do
      create_default_user
    end

    scenario 'User cannot create a restaurant' do
      visit '/'
      click_link 'Add a restaurant'
      save_and_open_page
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    context 'no restaurants have been added' do
      scenario 'should display a prompt to add a restaurant' do
        visit '/'
        expect(page).to have_content 'No restaurants yet'
        expect(page).to have_link 'Add a restaurant'
      end
    end

    scenario 'User cannot edit a restaurant' do
      create_default_restaurant
      visit '/'
      save_and_open_page
      click_link 'Edit KFC'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    scenario 'User cannot delete a restaurant' do
      create_default_restaurant
      visit '/'
      click_link 'Delete KFC'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end

  context 'user logged in' do
    before do
      visit('/')
      create_default_user
      create_default_restaurant
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    context 'restaurants have been added' do
      scenario 'display restaurants' do
        visit '/restaurants'
        expect(page).to have_content('KFC')
        expect(page).not_to have_content('No restaurants yet')
      end
    end

    context 'creating restaurants' do
      scenario 'prompts user to fill out a form, then displays the new restaurant' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'McDonalds'
        click_button 'Create Restaurant'
        expect(current_path).to eq '/restaurants'
        save_and_open_page
        expect(page).to have_content 'McDonalds'
      end

      context 'an invalid restaurant' do
        scenario 'does not let you submit a name that is too short' do
          visit '/restaurants'
          click_link 'Add a restaurant'
          fill_in 'Name', with: 'kf'
          click_button 'Create Restaurant'
          expect(page).not_to have_css 'h2', text: 'kf'
          expect(page).to have_content 'error'
        end
      end
    end

    context 'viewing restaurants' do
      scenario 'lets a user view a restaurant' do
        visit '/restaurants'
        click_link 'KFC'
        expect(page).to have_content 'KFC'
        expect(page).to have_content 'Deep fried goodness'
        expect(current_path).to eq "/restaurants/#{@restaurant.id}"
      end
    end

    context 'editing restaurants' do
      scenario 'let a user edit a restaurant' do
        visit '/restaurants'
        click_link 'Edit KFC'
        fill_in 'Name', with: 'Kentucky Fried Chicken'
        fill_in 'Description', with: 'Deep fried goodness'
        click_button 'Update Restaurant'
        click_link 'Kentucky Fried Chicken'
        expect(page).to have_content 'Kentucky Fried Chicken'
        expect(page).to have_content 'Deep fried goodness'
        expect(current_path).to eq "/restaurants/#{@restaurant.id}"
      end
    end

    context 'deleting restaurants' do
      scenario 'removes a restaurant when a user clicks a delete link' do
        visit '/restaurants'
        click_link 'Delete KFC'
        expect(page).not_to have_content 'KFC'
        expect(page).to have_content 'Restaurant deleted successfully'
      end
    end
  end
end
