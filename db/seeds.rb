dcvb = Organization.create!(name: "DCVB", display_name: "DURHAM, NC", org_photo: "https://static1.squarespace.com/static/56eff436c2ea5144e9b6dce0/5861b28bbe6594106ff76705/5861b2aa03596eeb527fe719/1482883865229/Downtown-Durham-NC.jpg", description: "Welcome to Durham, an entrepreneurial city with rich history and diverse culture.", url: "https://www.durham-nc.com/", content_credit: "Durham Convention & Visitors Bureau")

dcvb_user = User.create!(username: "dcvbadmin", password: "bullcity", organization: dcvb)

main_tour = Tour.create!(name: "Downtown Durham History Walk", description: "Learn unique facts while exploring national landmarks, historic buildings, and local businesses.", distance: 1.2, time_in_mins: 60, organization: dcvb, user: dcvb_user, main_tour_photo: "https://jaredpattersonblog.files.wordpress.com/2017/10/dsc_0009.jpg")

# tourify_owner = Admin.create!(username: "tourify_owner", password: "bullcity")

# User below was used in rails c to test if dependent destroy was functioning
# dcvb_user2 = User.create!(username: "altdcvb", password: "bullcity1", organization: dcvb)
