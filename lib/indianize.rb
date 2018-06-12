class Indianize

  $reference_hash = {
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
      }

  def self.to_number(money)
    "₹ " + money.round.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")
  end

  def self.to_words(money)
    money = money.round
  	$reference_hash.each do |number, word|
  		return "please don't enter negative money value" if money < 0
  		return "" if money == 0 
  		if money.to_s.length == 1 && money/number > 0
  			return ("#{word}").capitalize.strip      
  		elsif money < 100 && money/number > 0
  			return ("#{word} " + to_words(money%number)).capitalize.strip
  		elsif money/number > 0
  			return (to_words(money/number) + " #{word} " + to_words(money%number)).capitalize.strip
  		end
  	end
  end
end
