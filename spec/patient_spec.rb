require('spec_helper')

describe(Patient) do
  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will add a patient to the database') do
      new_patient = Patient.new(:name => 'Frank Smith', :birthdate => '1985-09-18', :doctor_id => 1)
      new_patient.save
      expect(new_patient.name).to(eq('Frank Smith'))
    end
  end
end
