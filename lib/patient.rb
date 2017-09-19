class Patient
  attr_reader(:name, :birthdate, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def self.all
    returned_patients = DB.exec('SELECT * FROM patients;')
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch('name')
      birthdate = patient.fetch('birthdate')
      doctor_id = patient.fetch('doctor_id')
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id.to_i}))
    end
    patients
  end

  def save
    DB.exec("INSERT INTO patients (name, birthdate, doctor_id) VALUES ('#{@name}', '#{@birthdate}', '#{@doctor_id}')")
  end

  def ==(another_patient)
    self.name().==(another_patient.name()).&(self.birthdate().==(another_patient.birthdate())).&(self.doctor_id().==(another_patient.doctor_id()))
  end

  def self.find(id)
    found_patients = []
    Patient.all().each() do |patient|
      if patient.doctor_id().==(id)
        found_patients.push(patient)
      end
    end
    found_patients
  end

end
