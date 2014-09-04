# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

result_set = FederalRegister::Article.search(:conditions => {:term => "Accessibility"}).take(50)

result_set.each do |doc|
	Fedreg.create(type_of_doc: doc.type, title: doc.title, abstract: doc.abstract, pub_date: doc.publication_date)
end