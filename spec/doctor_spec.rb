require('spec_helper')

describe(Doctor) do
  describe(".all") do
    it("is empty at first") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you doctors name") do
      doc = Doctor.new(:name => 'Frank Smith', :specialty => 'GP', :id => 1)
      expect(doc.name()).to(eq("Frank Smith"))
    end
  end

  describe("#specialty") do
    it("tells you doctors specialty") do
      doc = Doctor.new(:name => 'Frank Smith', :specialty => 'GP', :id => 1)
      expect(doc.specialty()).to(eq("GP"))
    end
  end

  describe("#id") do
    it("tells you doctors id") do
      doc = Doctor.new(:name => 'Frank Smith', :specialty => 'GP', :id => 1)
      expect(doc.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('will add a doctor to the database') do
      new_doc = Doctor.new(:name => 'Frank Smith', :specialty => 'GP', :id => nil)
      new_doc.save
      expect(Doctor.all()).to(eq([new_doc]))
    end
  end

  describe("#==") do
    it("if a doctor has the same name") do
      doc1 = Doctor.new({:name => "Ed Snowden", :specialty => 'GP', :id => nil})
      doc2 = Doctor.new({:name => "Ed Snowden", :specialty => 'GP', :id => nil})
      expect(doc1).to(eq(doc2))
    end
  end

  describe('.find') do
    it("will find a doctor_id based on a name") do
      new_doc = Doctor.new(:name => 'Frank Smith', :specialty => 'GP', :id => nil)
      new_doc.save()
      expect(Doctor.find(new_doc.name)).to(eq(new_doc.id))
    end
  end
end
