
class Doctor
  attr_reader(:name, :specialty, :id)
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_doctors = DB.exec('SELECT * FROM doctors;')
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      id = doctor.fetch('id')
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id.to_i}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def ==(another_doc)
    self.name().==(another_doc.name()).&(self.specialty().==(another_doc.specialty())).&(self.id().==(another_doc.id()))
  end

  def self.find(name)
    found_doc = nil
    Doctor.all().each() do |doctor|
      if doctor.name().==(name)
        found_doc = doctor.id
      end
    end
    found_doc
  end
end
