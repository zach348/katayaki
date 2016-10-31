# README

README
Authors: Zachary Cutler

Ruby version: 2.3.1

System dependencies:

brew install imagemagick
brew install phantomjs
brew install npm
gem install bundler
bundle
npm install


To run the app locally:

run two concurrent processes for the rails and webpack servers ('npm start' and 'rails s' from the project's root directory)
visit localhost:3000


Configuration

You will need Amazon S3 keys and a resource bucket name in an .env file that correspond to a resource you have configured with AWS in order to utilize the cloud-based profile picture feature.

Further details can be found in Fog and Carrierwave documentation.


Database creation

rake db:create && rake db:migrate to set up tables

Database initialization
rails db:seed to seed the database
How to run the test suite

run test suite with rake


#Katayaki
Katayaki is a Rails-based community platform that aggregates and anonymizes feedback on character goals chosen by the user. Users join or create online “circles” meant to mirror face-to-face communities and set goals within them.
