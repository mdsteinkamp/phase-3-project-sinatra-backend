# Mock Life Insurance User Interface - Back End
This application uses Sinatra to build a back end API to be used with a React front end user interface. 


## Installation
The Sinatra back end must be started up first at https://github.com/mdsteinkamp/phase-3-project-sinatra-backend. In Terminal first run ```rake db:seed``` to seed database with info, then ```rake server```

Then pull the front end code at https://github.com/mdsteinkamp/phase-3-project-react-frontend/tree/main and in a new terminal window run ```npm start``` to open in a browser window. 

## Usage

* Schema - The database schema is set up with two tables: Clients and Policies with a One to Many association. 

* Seed - the server is seeded via ```rake db:seed``` with calls to the Faker library for names & personal info and some arrays for policy info. 

* A Ruby class is set up for each model with the required Active Record association

* The application controller has various routes set up to provide/update data requested from the front end on the database 