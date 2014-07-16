# Instacohort

A simple Rails app which allows users to sign up and take a quiz testing their ability to match product descriptions with the appropriate product given multiple choices.

![](https://s3.amazonaws.com/uploads.hipchat.com/8718/20466/t7Bx79oTrcqsmQv/Screen%20Shot%202014-07-15%20at%204.28.08%20PM.png)
![](https://s3.amazonaws.com/uploads.hipchat.com/8718/20466/op2LolYTRD3axXD/Screen%20Shot%202014-07-15%20at%204.29.11%20PM.png)
![](https://s3.amazonaws.com/uploads.hipchat.com/8718/20466/DRNr6Ee7MS5Dfdl/Screen%20Shot%202014-07-15%20at%204.28.27%20PM.png)


#### Setup

###### PostgreSQL
**Description**: install gems, create db, run migrations, seed data into postgreSQL  
**Required services running**: postgreSQL

```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

#### Usage
**Description**: start server  
**Required services running**: postgreSQL

```
bundle exec rails s
```

#### Features
* Countdown timer changes color (green -> yellow -> red) as time runs out.
* In-quiz progress is shown.
* View results instantly and see how you did for every question.
* Think you can do better? Try again from any results screen (as long as it was your attempt!).
* Load pages quickly with indices on all foreign keys.
* Counter caches are used to limit database queries.
* Rest well at night knowing that there will only ever be more than one correct answer per question.
* 404 rescuing will save you from those 500 blues when you can't find the right document.