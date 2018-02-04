# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

food = Category.create!(name:"food")
housing = Category.create!(name:"housing")
wellness = Category.create!(name:"wellness")
mental_health = Category.create!(name:"mental health")
education = Category.create!(name:"education")
clothing = Category.create!(name:"clothing")


org1= Organization.create(name:"Denver Food Coalition", address: "501 E 17th Ave, Denver, CO 80203", state: "co", city:"denver")
org2=Organization.create(name:"Partners in Housing", address: "1773 17th st denver co 80202", state: "co", city:"denver")
org3=Organization.create(name:"Boulder Food Bank", address: "2905 Pearl St, Boulder, CO 80301", state: "co", city:"boulder")
org4=Organization.create(name:"Helping Hands", address: "505 pole line rd davis ca 95616", state: "ca", city:"davis")
org5=Organization.create(name:"Winters Friends of the Library", address:"454 Russell st. winters ca 95694", state: "ca", city:"winters")
org6=Organization.create(name:"Youth Radio", address: "2867 broadway ave oakland ca 94611", state: "ca", city:"oakland")
org7=Organization.create(name:"Davis Food Co-op", address: "620 G St, Davis, CA 95616", state: "ca", city:"davis")
org8=Organization.create(name:"Denver Healthcare", address: "1773 logan st denver co 80203", state: "co", city:"denver")


Need.create(name:"canned goods", organization_id: org1.id, category_id: food.id, amount:56)
Need.create(name:"volunteers", organization_id: org2.id, category_id: housing.id,  amount:34)
Need.create(name:"clothing", organization_id: org3.id, category_id: clothing.id,amount:76)
Need.create(name:" produce", organization_id: org4.id, category_id: food.id, amount:98)
Need.create(name:"dry goods", organization_id: org5.id ,category_id: food.id, amount:58)
Need.create(name:"toys", organization_id: org6.id, category_id: education.id, amount:64)
Need.create(name:"jackets", organization_id: org7.id, category_id: clothing.id, amount:87)
Need.create(name:"books", organization_id: org8.id, category_id: education.id, amount:87)
Need.create(name:"crisis support", organization_id: org8.id, category_id: mental_health.id, amount:66)
Need.create(name:"cannged goods", organization_id: org2.id, category_id: food.id,amount:23)
Need.create(name:"gifts", organization_id: org3.id, category_id: education.id,amount:55)
Need.create(name:"water", organization_id: org4.id, category_id: food.id,amount:45)
Need.create(name:"electronics", organization_id: org5.id, category_id: wellness.id,amount:34)
Need.create(name:"toys", organization_id: org6.id, category_id: education.id,amount:23)
Need.create(name:"jackets", organization_id: org7.id, category_id: clothing.id,amount:65)
Need.create(name:"books", organization_id: org8.id, category_id: education.id,amount:34)
