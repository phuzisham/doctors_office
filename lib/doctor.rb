
class Doctor
  attr_reader(:name, :specialty)
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    returned_doctors = DB.exec('SELECT * FROM doctors;')
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      doctors.push(Doctor.new({:name => name, :specialty => specialty}))
    end
    doctors
  end

  def save
    DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}')")
  end

end