<!-- # Luigi's Lūʻau Specialty Shop

## [https://github.com/dqveha/luigi-luau-shop](https://github.com/dqveha/luigi-luau-shop)

#### By Dave Lindqvist

---

##

This is the tenth independent project (Ruby, Week 4) assigned by Epicodus that will be broken up into two weeks. This first week is assessing the implementation of Ruby on Rails, creating a database to include a one-to-many relationship between 'Products' and 'Reviews.' The main emphases are incorporating scopes, validations, callbacks, seeding, and flash messages to the project.

For a visual relationship representation of the database:

## ![luigi_specialty_database](https://github.com/dqveha/luigi-luau-shop/blob/main/database-visual.png?raw=true)

## Technologies Used

1. Docker
2. Ruby + RubyGems
3. RSpec & Capybara
4. Rails
5. PostgreSQL

## Installation Instructions

1. Open your terminal
2. Clone this repo to your desktop:

```
https://github.com/dqveha/luigi-luau-shop.git
```

3. Open the `luigi-luau-shop` directory using Visual Studio Code
4. Run command `docker-compose up --build` in your terminal
5. Find out your container ID within docker by typing in the terminal:

```
docker ps
```

6. Copy the container ID related to the database and load the database_backup.sql within the folder by typing in:

```
docker exec [container_ID] pg_dump -U postgres luigi_specialty_development < database_backup.sql
```

7. The user can open the webpage by visiting this URL in the browser:

```
http://localhost:3000/
```

8. To run RSpec and see if the tests are passing, type into the terminal:

```
docker-compose run web bundle exec rspec
```

## Bugs:

1. Unable to get before_save to work with Review class properly
2. Decimals do not list to the hundreths place if product's listing price is 1.1, 1.2, 1.3, etc.
3. When the country of origin is saved such as 'uS', the product's listing shows its country of origin as 'U S' with a space in between.

## Work in progress:

1. Will create separate pages, if desired, to feature three most recently added products and products with the most reviews
2. Creating a drop-down menu for the country of origin when adding a product
3. Improving overall layout using Bootstrap and CSS
4. Add tables to better organize the reviews and products

---

### License is GPLv3 and I make no claim to copyright. -->
