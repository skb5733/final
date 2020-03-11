# Set up for the application and database. DO NOT CHANGE. #############################
require "sequel"                                                                      #
connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB = Sequel.connect(connection_string)                                                #
#######################################################################################

# Database schema - this should reflect your domain model
DB.create_table! :parks do
  primary_key :id
  String :park_name
  String :location
  String :lat
  String :long
end

DB.create_table! :users do
  primary_key :id
  String :name
  String :email
  String :password
end

DB.create_table! :reviews do
  primary_key :id
  foreign_key :park_id
  foreign_key :user_id
  Integer :rating
  String :comments, text: true
end

# Insert initial (seed) data
parks_table = DB.from(:parks)

parks_table.insert(park_name: "Arches National Park",
                    location: "Moab, UT",
                    lat: "38.7331",
                    long: "-109.5925")

parks_table.insert(park_name: "Bryce Canyon National Park",
                    location: "Bryce, UT",
                    lat: "37.5930",
                    long: "-112.1871")

parks_table.insert(park_name: "Canyonlands National Park",
                    location: "Moab, UT",
                    lat: "38.3269",
                    long: "-109.8783")

parks_table.insert(park_name: "Capitol Reef National Park",
                    location: "Torrey, UT",
                    lat: "38.3670",
                    long: "-111.2615")

parks_table.insert(park_name: "Zion National Park",
                    location: "Springdale, UT",
                    lat: "37.2982",
                    long: "-113.0263")