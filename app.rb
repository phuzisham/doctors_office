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

get('/doctor') do
  erb(:doctor)
end

get('/patient') do
  erb(:patient)
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
  @doctor_name = params.fetch('doctor_name')
  doctor_id = Doctor.find(@doctor_name).to_i
  new_patient = Patient.new({:name => @name, :birthdate => @birthdate, :doctor_id => doctor_id})
  new_patient.save()
  erb(:patientSuccess)
end

get('/doctor/patients') do
  @name = params.fetch('docName')
  doc_id = Doctor.find(@name)
  @patients = Patient.find(doc_id)
  erb(:patientList)
end
