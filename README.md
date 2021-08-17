# Luigi's Lūʻau Specialty Shop

## [https://github.com/dqveha/luigi-luau-shop](https://github.com/dqveha/luigi-luau-shop)

#### By Dave Lindqvist

---

##

This is the tenth independent project (Ruby, Week 4 & 5) assigned by Epicodus designed to be a two-part series. This first week is assessing the implementation of Ruby on Rails, creating a database to include a one-to-many relationship between 'Products' and 'Reviews.' The second week is assessing the implementation of user authentication and authorization. The core emphases are incorporating scopes, validations, callbacks, seeding, and flash messages to the project.

For a visual relationship representation of the database:

## ![luigi_specialty_database](https://github.com/dqveha/luigi-luau-shop/blob/main/database-visual.png?raw=true)

## Technologies Used

1. Docker
2. Ruby 2.6.5 + RubyGems
3. RSpec & Capybara
4. Rails v5.2.4
5. PostgreSQL
6. BCrypt

## Installation Instructions

1. Open your terminal
2. Clone this repo to your desktop:

```
https://github.com/dqveha/luigi-luau-shop.git
```

3. Open the `luigi-luau-shop` directory using Visual Studio Code
4. Run command `docker-compose up --build` in your terminal
5. To set up the server-side database, type `docker-compose run web bundle exec rake db:create` in your terminal
6. Type `docker-compose run web bundle exec rake db:migrate`
7. To use seed fake products, reviews and accounts, type in the terminal `docker-compose run web bundle exec rake db:seed`
8. Open the webpage by visiting this URL in the browser:

```
http://localhost:3000/
```

9. You can create an account by clicking the 'Sign Up' link on the top right corner
10. If you would like the account created to have admin authorization, type in `docker ps` in your terminal
11. Copy the database container ID and open up Postgres by typing in your terminal:

```
docker exec -it -u postgres [CONTAINER_ID] psql
```

12. Within the terminal, type: `\c luigi_specialty_development`
13. Then type `SELECT * FROM users`
14. Find the account ID you created, then set admin to `true` by typing in your terminal:

```
UPDATE users SET admin = true WHERE id = [ID];
```

15. To run RSpec and see if the tests are passing, type into the terminal:

```
docker-compose run web bundle exec rspec
```

## Bugs:

1. No bugs currently found. Please let me know if you do!

## Plans for improvement:

1. Create management portal
2. Make partials for redundant pages

---

### License is GPLv3 and I make no claim to copyright.
