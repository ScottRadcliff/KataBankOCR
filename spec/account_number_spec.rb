require_relative("../account_number.rb")

describe AccountNumber do
 
  describe "checksum" do
    it "creates a checksum for 777777777" do
      expect(AccountNumber.checksum("777777777")).to eql(7)
    end

    it "creates a checksum for 555555555" do
      expect(AccountNumber.checksum("555555555")).to eql(5)
    end
     
    it "creates a checksum for 123456789" do
      expect(AccountNumber.checksum("123456789")).to eql(0)
    end
  end
end
