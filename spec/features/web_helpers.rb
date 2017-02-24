def create_default_user_1
  @user1 = User.create(email: 'user1@example.com', password: 'abc123')
end

def create_default_restaurant
  @restaurant = Restaurant.create(name: 'KFC', description: 'Deep fried goodness', user: @user1)
end

def log_in_default_user_1
  visit '/restaurants'
  click_link('Sign in')
  fill_in('Email', with: 'user1@example.com')
  fill_in('Password', with: 'abc123')
  click_button('Log in')
end

def sign_up_default_user_2
  visit '/restaurants'
  click_link('Sign up')
  fill_in('Email', with: 'user2@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def log_in_default_user_2
  visit '/restaurants'
  click_link('Sign in')
  fill_in('Email', with: 'user2@example.com')
  fill_in('Password', with: 'testtest')
  click_button('Log in')
end
