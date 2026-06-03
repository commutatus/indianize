require "spec_helper"

RSpec.describe Indianize do
  describe ".to_number" do
    it "formats an integer with Indian separators and the rupee symbol" do
      expect(described_class.to_number(651427)).to eq("₹ 6,51,427")
    end

    it "rounds floats before formatting" do
      expect(described_class.to_number(651427.9)).to eq("₹ 6,51,428")
    end
  end

  describe ".to_number_without_symbol" do
    it "formats an integer with Indian separators without the rupee symbol" do
      expect(described_class.to_number_without_symbol(651427)).to eq("6,51,427")
    end

    it "rounds floats before formatting" do
      expect(described_class.to_number_without_symbol(651427.9)).to eq("6,51,428")
    end
  end

  describe ".to_words" do
    it "converts single-digit values" do
      expect(described_class.to_words(1)).to eq("One")
    end

    it "converts two-digit values" do
      expect(described_class.to_words(21)).to eq("Twenty one")
    end

    it "converts hundreds" do
      expect(described_class.to_words(105)).to eq("One hundred five")
    end

    it "converts values in lakhs" do
      expect(described_class.to_words(651427)).to eq(
        "Six lakh fifty one thousand four hundred twenty seven"
      )
    end

    it "converts values in crores" do
      expect(described_class.to_words(10000001)).to eq("One crore one")
    end

    it "converts exact multiples without appending zero remainders" do
      expect(described_class.to_words(20)).to eq("Twenty")
      expect(described_class.to_words(100)).to eq("One hundred")
      expect(described_class.to_words(1000)).to eq("One thousand")
      expect(described_class.to_words(100000)).to eq("One lakh")
      expect(described_class.to_words(10000000)).to eq("One crore")
    end

    it "accepts positive whole-number floats" do
      expect(described_class.to_words(21.0)).to eq("Twenty one")
    end

    it "accepts fractional floats and rounds them downward to zero because paisa is not supported" do
      expect(described_class.to_words(0.2)).to eq("Zero")
    end

    it "accepts fractional floats and rounds them upward" do
      expect(described_class.to_words(1.6)).to eq("Two")
    end

    it "accepts zero" do
      expect(described_class.to_words(0)).to eq("Zero")
    end

    it "rejects negative numbers" do
      expect { described_class.to_words(-1) }
        .to raise_error(ArgumentError, "Supports only non-negative integers and floats.")
    end

    it "rejects negative floats" do
      expect { described_class.to_words(-1.2) }
        .to raise_error(ArgumentError, "Supports only non-negative integers and floats.")
    end

    it "rejects non-finite floats" do
      expect { described_class.to_words(Float::INFINITY) }
        .to raise_error(ArgumentError, "Supports only non-negative integers and floats.")
    end
  end

  describe ".states" do
    it "returns the supported Indian states and union territories" do
      expect(described_class.states).to include(
        "Andaman and Nicobar Islands",
        "Delhi",
        "Tamil Nadu",
        "Uttar Pradesh",
        "West Bengal"
      )
    end
  end

  describe ".state_search" do
    it "returns states and union territories matching the query" do
      expect(described_class.state_search("utt")).to eq(
        ["Uttar Pradesh", "Uttarakhand"]
      )
    end

    it "returns an empty array when no state or union territory matches" do
      expect(described_class.state_search("not-a-place")).to eq([])
    end
  end
end
