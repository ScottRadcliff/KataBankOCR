class AccountNumber
  
  # checksum calculation:
  # (d1+2*d2+3*d3 +..+9*d9) mod 11 = 0
  def self.checksum(string)
    (string[8].to_i+2*string[7].to_i+3*string[6].to_i+4*string[5].to_i+5*string[4].to_i+6*string[3].to_i+7*string[2].to_i+8*string[1].to_i+9*string[0].to_i) % 11
  end

  def self.convert(collection)
    converted_number = ""
    collection.each do |number|
      converted_number << match(number) 
    end
    puts converted_number
  end

private
  def self.match(number)
    case number
    when " _ | ||_|"
      return "0"
    when "     |  |"
      return "1"
    when " _  _||_ "
      return "2"
    when " _  _| _|"
      return "3"
    when "   |_|  |"
      return "4"
    when " _ |_  _|"
      return "5"
    when " _ |_ |_|"
      return "6"
    when " _   |  |"
      return "7"
    when " _ |_||_|"
      return "8"
    when " _ |_| _|"
      return "9"
    else
      return "no match"
    end
  end
end
