require('spec_helper')

describe(Doctor) do
  describe(".all") do
    it("is empty at first") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will add a doctor to the database') do
      new_doc = Doctor.new(:name => 'Frank Smith', :specialty => 'GP')
      new_doc.save
      expect(new_doc.name).to(eq('Frank Smith'))
    end
  end
end
