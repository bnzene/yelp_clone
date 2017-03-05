# Yelp Clone

Brief for this project: TDD a clone of Yelp in a week using Rails. This was also my first time using Devise, Omniauth, Facebook integration and AWS.

### Using this project on your local machine

First run ```bundle install``` in the command line to install all the dependencies.

Users must be signed in to add, edit or review restaurants in the database. To use or edit the app, then, you'll need to create a development and a test database. I used PSQL, and to set up the databases on the command line (without entering PSQL first), enter:
```
bin/rails createdb yelp_clone_development
```
```
bin/rails createdb yelp_clone_test
```
Next, run rake db:migrate to generate the migrations. All going well, you should be able to enter ```bin/rails s``` on the commmand line, visit localhost:3000 in your browser of choice and see the app in action.

## Testing

* To run the test suite, navigate to the root of the directory in the command line, type in ```rspec``` and hit Enter.

## Built With

* [Ruby onRails](http://rubyonrails.org/) - Web framework
* [Devise](https://github.com/plataformatec/devise) - Authentication for Rails
* [Omniauth](https://github.com/omniauth/omniauth) - Authentication library for web applications
* [Facebook for Developers](https://developers.facebook.com/) - enable user login with Facebook
* [Amazon Web Services](https://aws.amazon.com/) - Cloud-based storage
