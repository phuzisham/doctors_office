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
  @name = params.fetch('docName')
  @specialty = params.fetch('specialty')
  new_doc = Doctor.new({:name => @name, :specialty => @specialty, :id => nil})
  new_doc.save()
  erb(:docSuccess)
end

post('/new/patient') do
  @name = params.fetch('patientName')
  @birthdate = params.fetch('birthdate')
  @doctor_id = params.fetch('doctor_id')
  new_patient = Patient.new({:name => @name, :birthdate => @birthdate, :doctor_id => @doctor_id})
  new_patient.save()
  erb(:patientSuccess)
end
