require_relative("../file_parser.rb")

describe FileParser do
  
  before :each do 
    @parser = FileParser.new(File.new("entries.txt"))  
  end

  it "takes a file and split account numbers" do
    expect(@parser.extract_account_numbers.size).to eql 3
  end

  it "converts an account number to digits" do
    expect(@parser.convert_account_number(set_up_string)).to eql("000000000") 
  end

  it "converts all 1's to an account number" do
    str  = <<-eos
                           
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |
  eos
    expect(@parser.convert_account_number(str)).to eql("111111111")
  end

  it "converts all 2's to an account number" do
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
 _| _| _| _| _| _| _| _| _|
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
  eos
    expect(@parser.convert_account_number(str)).to eql("222222222")
  end

  it "converts all 3's to an account number" do
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
 _| _| _| _| _| _| _| _| _|
 _| _| _| _| _| _| _| _| _|
  eos
    expect(@parser.convert_account_number(str)).to eql("333333333")
  end

  it "converts all 4's to an account number" do
    str = <<-eos
                           
|_||_||_||_||_||_||_||_||_| 
  |  |  |  |  |  |  |  |  | 
  eos
    expect(@parser.convert_account_number(str)).to eql("444444444")
  end

  it "converts all 5's to an account number" do
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
 _| _| _| _| _| _| _| _| _|
 
  eos
    expect(@parser.convert_account_number(str)).to eql("555555555")
  end
  
  it "converts all 6's to an account number" do
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
|_||_||_||_||_||_||_||_||_|
  eos
    expect(@parser.convert_account_number(str)).to eql("666666666")
  end

  it "converts all 7's to an account number" do
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |
  eos
    expect(@parser.convert_account_number(str)).to eql("777777777")
  end

  it "converts all 8's to an account number" do
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
|_||_||_||_||_||_||_||_||_|
  eos
    expect(@parser.convert_account_number(str)).to eql("888888888")
  end

  it "converts all 9's to an account number" do
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
 _| _| _| _| _| _| _| _| _|
  eos
    expect(@parser.convert_account_number(str)).to eql("999999999")
  end

  it "converts mixed numbers to an account number" do
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
 _||_| _||_| _||_| _||_| _|
  eos
    expect(@parser.convert_account_number(str)).to eql("989898989")
  end



  def set_up_string
    str = <<-eos
 _  _  _  _  _  _  _  _  _ 
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|
  eos
  end
end
