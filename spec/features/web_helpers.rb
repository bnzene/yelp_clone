def create_default_user
  @user = User.create(email: 'test@test.com', password: 'abc123')
end

def create_default_restaurant
  @restaurant = Restaurant.create(name: 'KFC', description: 'Deep fried goodness', user: @user)
end

def sign_in_default_user
  visit '/restaurants'
  click_link('Sign in')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'abc123')
  click_button('Log in')
end

def sign_up_user_1
  visit '/restaurants'
  click_link('Sign up')
  fill_in('Email', with: 'user1@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_user_2
  visit '/restaurants'
  click_link('Sign up')
  fill_in('Email', with: 'user2@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in_user_2
  visit '/restaurants'
  click_link('Sign in')
  fill_in('Email', with: 'user2@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign in')
end
