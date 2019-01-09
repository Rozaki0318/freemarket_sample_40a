# require 'csv'

# CSV.read("db/category.csv", headers: false).each do |row|
#   Category.create!(
#     id: row[0],
#     name: row[1],
#     depth: row[2],
#     size_pulldown: row[3],
#   )
# end

# CSV.read("db/brand.csv", headers: false).each do |row|
#   Brand.create!(
#     id: row[0],
#     name: row[1],
#   )
# end

# CSV.read("db/size.csv", headers: false).each do |row|
#   Size.create!(
#     id: row[0],
#     name: row[1],
#     parent: row[2],
#   )
# end
