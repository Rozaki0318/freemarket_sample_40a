require 'csv'

CSV.read("db/category.csv", headers: false).each do |row|
  Category.create!(
    id: row[0],
    name: row[1],
    depth: row[2],
    size_pulldown: row[3],
  )
end
