require('sinatra')
require('sinatra/reloader')
require('./lib/patient')
require('./lib/doctor')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

DB = PG.connect({:dbname => "doctor_office_test"})

get('/') do
  erb(:index)
end

get('/administrator') do
  erb(:administrator)
end

post('/new/doctor') do
  name = params.fetch('name')
  specialty = params.fetch('specialty')
  new_doc = Doctor.new({:name => name, :specialty => specialty, :id => nil})
  new_doc.save()
end
