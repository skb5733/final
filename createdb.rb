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
  String :forecast
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
  String :comments, text: true
end

# Insert initial (seed) data
parks_table = DB.from(:parks)

parks_table.insert(park_name: "Arches National Park",
                    forecast: "80 degrees and Sunny",
                    location: "Moab, UT")

parks_table.insert(park_name: "Bryce Canyon National Park", 
                    forecast: "65 degrees and Sunny",
                    location: "Kellogg Global Hub")

parks_table.insert(park_name: "Canyonlands National Park", 
                    forecast: "75 degrees and Sunny",
                    location: "Moab, UT")

parks_table.insert(park_name: "Capitol Reef National Park", 
                    forecast: "60 degrees and Sunny",
                    location: "Torrey, UT")

parks_table.insert(park_name: "Zion National Park", 
                    forecast: "70 degrees and Sunny",
                    location: "Springdale, UT")