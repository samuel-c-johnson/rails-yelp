# Yelp

## Description

This is a clone of the restaurant listings website Yelp, built using rails. Features include user sign up / sign in / sign out, list restaurants and review them. See more about my [design process](#design-process).


## Setup

Check that you have ruby installed

`ruby -v`

If not, install instructions can be found [here](https://www.ruby-lang.org/en/documentation/installation/).

Clone the repo on the command line by running

`git clone git@github.com:ewintram/rails-yelp.git`

Check that you have bundler installed

`bundler -v`

If not, install by running

`gem install bundler`

Install dependencies by running

`bundle`

Create the databases by running

`rake db:setup`

Migrate the table schema by running

`rake db:migrate`


## Usage

To launch the app, run

`rails s`


Navigate to `http://localhost:3000`

(screen grabs)


## Running tests

Testing is in RSpec and Capybara. To run the tests on the command line, run

`rspec`


## Authors

[Sam Johnson](https://github.com/samuel-c-johnson)

[Varun Madhukara](https://github.com/VarunCodes)

[Lan Pham](https://github.com/Albion31)

Eleanor Wintram


## Design process

*Database table structure*

![Database table structure](/public/yelp-database-structure.png "Database tables structure")

### User stories

*Step 1 - MVP*
```
As a user
So that our restaurant can be reviewed
I want to be able to create a new restaurant with a name and an optional description
```

```
As a user
So that I can modify my listing of a restaurant
I want to be able to edit it
```

```
As a user
So that I can remove my listing of a restaurant
I want to be able to delete it
```

```
As a reviewer
So that the restaurant can be reviewed
I want to be able to leave a rating out of five
```

```
As a reviewer
So that the restaurant can be reviewed
I want to be able to leave an optional comment
```

```
As a user
So I can determine which restaurant to visit
I want to access a list of restaurants with individual comments
```

```
As a user
If I want to provide a review
I must leave a rating out of 5
```

```
As a user
If I want list a restaurant
I must provide a name
```

*Step 2 - User login*

```
As a user
So that I can access the full functionality of the website
I want to be able to sign up
```

```
As a registered user
So that I can record my activity on the website
I want to be able to sign_in
```

```
As a registered user
So that I know that I am signed in
I want to see a tailored welcome message
```

```
As a user
So that I can identify the reviewer
I want to see the email address of the reviewer
```

*Step 3 - Setting limits on users*

```
As an administrator
To avoid anonymous listings
A restaurant must have a registered user associated to it
```

```
As a user
So that no one can delete or edit my listings
I want to be the only one who can edit/delete them
```

```
As an administrator
In order to avoid duplicate reviews by the same person
I want to limit users to one review per restaurant
```

```
As a reviewer
So that I can update my review
I can edit or delete my reviews
```

```
As a user
To avoid conflict of interest
I cannot review restaurants that I have created
```

### Still to implement

#### User stories

```
As a user
So that I can sign up more easily
I want to be able to log in through social media
```

```
As a user
So I can decide which restaurant to visit
I want to access a list of restaurants with average rating
```
