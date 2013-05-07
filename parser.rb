require_relative("account_number")
class Parser

  def initialize;end

  # Extracts 3x3 blocks of numbers and send them to be converted
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
    AccountNumber.convert(digits)
  end

end
