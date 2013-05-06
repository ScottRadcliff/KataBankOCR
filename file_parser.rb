require_relative("account_number")
class FileParser

  def initialize(file)
    @file = file
  end

  def parse_account_numbers
    start_line = 0
    end_line = 2
    account_number_section = []
    lines = @file.readlines
    while end_line < lines.count + 1
      account_number_section.push lines[start_line..end_line]
      start_line = start_line + 3
      end_line = end_line + 3
    end
    return account_number_section
  end


  def convert_account_number(string)
    digits = []
    a = string.lines.to_a
    start_point = 0
    end_point = 3
    9.times do
      str = ""
      str << a[0][start_point...end_point]
      str << a[1][start_point...end_point]
      str << a[2][start_point...end_point]
      digits.push str
      start_point = end_point
      end_point = end_point + 3
    end
    account_number = AccountNumber.convert(digits)
  end

end
