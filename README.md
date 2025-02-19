<p align="center"><a href="https://github.com/charles-chadwick/PBreeze" target="_blank"><img src="https://avatars.githubusercontent.com/u/12351112?u=b14a224ecb363ff1c09b0f0c0d9e1aa54b989527&v=4" alt="Laravel Logo"></a></p>

## About PatientBreeze
Just a basic patient scheduling project. 

## Installation

**Clone this Repo!** 

    git@github.com:charles-chadwick/PBreeze.git

**Install Composer, NPM, and Sail**

    composer install
    npm install

**Set up Sail**

You'll need [Docker](https://www.docker.com/) installed on your system.  

Theoretically, you **should** be able to just run:

    php ./vendor/bin/sail up -d

to get everything built and running. If that doesn't work, try this, then try the above command again: 

    php artisan sail:install

Finally, import **database/pb.sql** into Docker. 
You'll have to do this via PHPMyAdmin or some other DBMS tool. I personally use [Navicat](https://www.navicat.com).
There is a file called **docs/pbreeze.ndm2** which will open in that program and will show you the schema. Actual
migrations will be created in time. 

If you get any CLI errors, make sure there's a **user** with an ID of 1. If you still are getting errors, try opening
app/Providers/AppServiceProvider.php and commenting out this line in the boot() method first:

    Auth::loginUsingId(1);

Then make sure to uncomment it when you are trying to run the application. 
