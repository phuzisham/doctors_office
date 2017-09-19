require('spec_helper')

describe(Patient) do
  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('will return a patients name') do
      new_patient = Patient.new(:name => 'Frank Smith', :birthdate => '1985-09-18', :doctor_id => 1)
      expect(new_patient.name).to(eq('Frank Smith'))
    end
  end

  describe('#birthdate') do
    it('will return a patients birthdate') do
      new_patient = Patient.new(:name => 'Frank Smith', :birthdate => '1985-09-18', :doctor_id => 1)
      expect(new_patient.birthdate).to(eq('1985-09-18'))
    end
  end

  describe('#doctor_id') do
    it('will return a patients doctor_id') do
      new_patient = Patient.new(:name => 'Frank Smith', :birthdate => '1985-09-18', :doctor_id => 1)
      expect(new_patient.doctor_id).to(eq(1))
    end
  end


  describe('#save') do
    it('will add a patient to the database') do
      new_patient = Patient.new(:name => 'Frank Smith', :birthdate => '1985-09-18', :doctor_id => 1)
      new_patient.save
      expect(Patient.all()).to(eq([new_patient]))
    end
  end

  describe("#==") do
    it("if a patient has the same name") do
      patient1 = Patient.new(:name => 'Frank Smith', :birthdate => '1985-09-18', :doctor_id => 1)
      patient2 = Patient.new(:name => 'Frank Smith', :birthdate => '1985-09-18', :doctor_id => 1)
      expect(patient1).to(eq(patient2))
    end
  end

  describe('.find') do
    it('will find a list of patients for a specified doctor') do
      new_doc = Doctor.new(:name => 'Frank Smith', :specialty => 'GP', :id => nil)
      new_doc.save()
      patient1 = Patient.new(:name => 'Frank Smith', :birthdate => '1985-09-18', :doctor_id => new_doc.id)
      patient2 = Patient.new(:name => 'Bob Carlton', :birthdate => '1985-09-18', :doctor_id => new_doc.id)
      patient3 = Patient.new(:name => 'Bill Builder', :birthdate => '1985-09-18', :doctor_id => 5)
      patient1.save()
      patient2.save()
      patient3.save()
      expect(Patient.find(new_doc.id)).to(eq([patient1, patient2]))
    end
  end

end
