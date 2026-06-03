class Indianize

  REFERENCE_HASH = {
    10000000 => "crore",
      100000 => "lakh",
        1000 => "thousand",
        100 => "hundred",
        90 => "ninety",
        80 => "eighty",
        70 => "seventy",
        60 => "sixty",
        50 => "fifty",
        40 => "forty",
        30 => "thirty",
        20 => "twenty",
        19=>"nineteen",
        18=>"eighteen",
        17=>"seventeen",
        16=>"sixteen",
        15=>"fifteen",
        14=>"fourteen",
        13=>"thirteen",
        12=>"twelve",
        11 => "eleven",
        10 => "ten",
        9 => "nine",
        8 => "eight",
        7 => "seven",
        6 => "six",
        5 => "five",
        4 => "four",
        3 => "three",
        2 => "two",
        1 => "one"
  }.freeze

  STATES_ARRAY = ["Andaman and Nicobar Islands", "Andhra Pradesh", "Arunachal Pradesh", "Assam", 
                  "Bihar", "Chandigarh", "Chhattisgarh", "Dadra and Nagar Haveli", "Daman & Diu", 
                  "Delhi", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu & Kashmir", 
                  "Jharkhand", "Karnataka", "Kerala", "Lakshadweep", "Madhya Pradesh", "Maharashtra", 
                  "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Puducherry", "Punjab", 
                  "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", 
                  "Uttarakhand", "West Bengal"].freeze

  def self.to_number(value)
    "₹ " + value.round.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")
  end

  def self.to_number_without_symbol(value)
    value.round.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")
  end

  def self.to_words(value)
    unless (value.is_a?(Integer) || (value.is_a?(Float) &&  value.finite?)) && value >=0
      raise ArgumentError, "Supports only non-negative integers and floats."
    end

    value = value.round
    return "Zero" if value.zero?

    convert_to_words(value)
  end

  private

  def self.convert_to_words(value)
    return "" if value.zero?

    REFERENCE_HASH.each do |number, word|
      if value.to_s.length == 1 && value/number > 0
        return ("#{word}").capitalize.strip
      elsif value < 100 && value/number > 0
        return ("#{word} " + convert_to_words(value%number)).capitalize.strip
      elsif value/number > 0
        return (convert_to_words(value/number) + " #{word} " + convert_to_words(value%number)).capitalize.strip
      end
    end
  end

  def self.states
    STATES_ARRAY
  end

  def self.state_search(query)
    result = []
    states.each do |x|
      result << x if x.downcase.include?(query)
    end
    return result
  end
end
