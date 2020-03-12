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
  String :image
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
                    long: "-109.5925",
                    image: "https://www.wallpapers13.com/wp-content/uploads/2016/07/Arches-National-Park-Utah-HD-Desktop-Backgrounds-free-download-3840x2400-915x515.jpg")

parks_table.insert(park_name: "Bryce Canyon National Park",
                    location: "Bryce, UT",
                    lat: "37.5930",
                    long: "-112.1871",
                    image: "https://www.goodfreephotos.com/albums/united-states/utah/bryce-canyon-national-park/bryce-amphitheater-rock-formations-at-bryce-canyon-national-park-utah.jpg")

parks_table.insert(park_name: "Canyonlands National Park",
                    location: "Moab, UT",
                    lat: "38.3269",
                    long: "-109.8783",
                    image: "https://cdn.pixabay.com/photo/2017/08/05/14/40/canyonlands-national-park-2584120_960_720.jpg")

parks_table.insert(park_name: "Capitol Reef National Park",
                    location: "Torrey, UT",
                    lat: "38.3670",
                    long: "-111.2615",
                    image: "https://www.visitutah.com/media/1970/head_capitolreefnp_2_1300x586.jpg?quality=86")

parks_table.insert(park_name: "Zion National Park",
                    location: "Springdale, UT",
                    lat: "37.2982",
                    long: "-113.0263",
                    image: "https://i.pinimg.com/originals/43/b9/7e/43b97e24b3fb6fe168cc6a50d72e9178.jpg")