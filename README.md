Jungle
=====================

## Overview 

A mini e-commerce application built with Rails 4.2. This app allows users to shop for their desired products and perform purchase transactions. Additionally, users may leave reviews and ratings for the products.

## Final Product

!["Screenshot of Jungle-index"](https://github.com/Nelson-Yu/jungle-rails/blob/master/docs/jungle-new-index.png)
!["Screenshot of Jungle-product"](https://github.com/Nelson-Yu/jungle-rails/blob/master/docs/jungle-new-products.png)
!["Screenshot of Jungle-cart"](https://github.com/Nelson-Yu/jungle-rails/blob/master/docs/jungle-new-cart.png)
!["Screenshot of Jungle-order"](https://github.com/Nelson-Yu/jungle-rails/blob/master/docs/jungle-new-order.png)


## Tech Stack

Back-end: 
* Ruby on Rails 

Front-end: 
* HTML5 
* SASS 
* ERB 

Database: 
* PostgreSQL

## Getting Started

1. Clone this project `git clone git@github.com:Nelson-Yu/jungle-rails.git jungle`
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Put your admin username and password into appropriate .env vars
8. Sign up for a Stripe account
9. Put Stripe (test) keys into appropriate .env vars
10. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* jQuery-Rails
* Turbolinks
* jbuilder
* sdoc
* bcrypt
* puma
* Bootstrap-SASS
* Font-Awesome-Rails
* Money-Rails
* Carrierwave
* rmagick
* faker