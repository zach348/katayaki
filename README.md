# README

![Build Status](https://codeship.com/projects/5aecb580-6c95-0134-2387-2643ab6f7762/status?branch=master)
![Coverage Status](https://coveralls.io/repos/zach348/katayaki/badge.png)

#Self
Self is a Rails-based community platform that aggregates and anonymizes feedback on character goals chosen by the user. Users join or create online “circles” meant to mirror face-to-face communities and set goals within them.

Authors: Zachary Cutler  
Ruby version: 2.3.1  

##System dependencies:

-```brew install imagemagick```  
-```brew install phantomjs```  
-```brew install npm```  
-```gem install bundler```  
-```bundle```  
-```npm install```  


##To run the app locally:

run two concurrent processes for the rails and webpack servers ('npm start' and 'rails s' from the project's root directory)
visit localhost:3000


###Configuration

You will need Amazon S3 keys and a resource bucket name in an .env file that correspond to a resource you have configured with AWS in order to utilize the cloud-based profile picture feature. You will also need an API key for the merriam webster collegiate web dicitonary interface.

Further details can be found in Fog, Carrierwave, and MW API documentation.


###Database creation

rake db:create && rake db:migrate to set up tables

###Database initialization

rake db:seed to seed the database with initial goals

###Test Suite

run test suite with rake


##Heroku Deployment

-configure Amazon S3 environment vars  
-configure MW environment vars  
-in order to use email features (impact notifications, confirmation emails, etc.) in production, you will need to set up a mailgun account and configure actionmailer/heroku environment vars appropriately; in development you can install the mailcatcher gem [independent of the Gemfile] to test email delivery

####Buildpacks
-ensure that node buildpack precedes ruby buildbpack  

####Database setup:

-```heroku run rake db:migrate```  
-```heroku run rake db:seed```  
-to reset the production db, run: ```heroku pg:reset```
