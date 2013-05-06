class AccountNumber
  def self.convert(collection)
    converted_number = ""
    collection.each do |number|
      converted_number << match(number) 
    end
    converted_number
  end


  def self.match(number)
    p number
    case number
    when " _ | ||_|"
      return "0"
    when "     |  |"
      return "1"
    when " _  _||_ "
      return "2"
    else
      return number
    end
  end
end
