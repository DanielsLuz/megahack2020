# Desaglomera

**Demo on Heroku:** [megahack20-reserve](https://megahack20-reserve.herokuapp.com)

This is a project created for the MegaHack v3 2020. This is a web application to control how many people can
enter in a shopping food court and avoid people breaking the social distance. We used Ruby on Rails v6 for the all
application.

There are three personas that can use this APP:

1) **The customer**: someone that wants to eat in the shopping's food court.
2) **The shop attendant**: someone that works in one restaurant of the food court.
3) **The food court manager**: someone who is responsible for managing the available restaurants of the food court.

## Used libraries
* [MongoDB](https://www.mongodb.com/): document persistence for faster initial development
* [TailwindCSS](http://tailwindcss.com/): a utility-first CSS framework (not premade components)
* [Sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron): cron jobs used for notifying customers of their reservations

## Main actions
1- **The customer**:
  * Check possible time slots for reservation
  * Make an order from a listed restaurant
  * Will be notified 15 minutes before the reservation

2- **The shop attendant**:
  * List and edit the list of products
  * Mark an order as complete/delivered

3- **The food court manager**:
  * List and edit the list of restaurants
  * Manage opening/closing times
  * Set the amount of available tables in the food court
