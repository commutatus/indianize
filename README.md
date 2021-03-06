# Indianize

### Currency

Convert a number into String with Indian currency symbol with comma seperator.

```bash
Indianize.to_number(651427)
=> "₹ 6,51,427"
```

Convert a number into String with comma seperator.

```bash
Indianize.to_number_without_symbol(651427)
=> "6,51,427"
```

Convert a number into Indian currencies as words like Ten, Hundred, Thousand, Lakh, Crore and so on.

```bash
Indianize.to_words(651427)
=> "Six lakh fifty one thousand four hundred twenty seven"`
```

The seperators work using **regex**.

## Note
There is no decimal (**paisa**) support yet.

It works with ridiculously large numbers as well!
```bash
Indianize.to_words(651448736594234928374340293409234822738334)
=> "Sixty five lakh fourteen thousand four hundred eighty seven crore thirty six lakh fifty nine thousand four hundred twenty three crore forty nine lakh twenty eight thousand three hundred seventy four crore thirty four lakh two thousand nine hundred thirty four crore nine lakh twenty three thousand four hundred eighty two crore twenty seven lakh thirty eight thousand three hundred thirty four"`
```

### States

Generate a list of all Indian states and uts. 
```
Indianize.states
```

Search within the list of states and uts. 
```
Indianize.state_search('utt')
=> ["Uttar Pradesh", "Uttarakhand"]
```

## Installation

### Install the gem using RubyGems

```bash
gem install indianize
```

or:

### Add it to your Gemfile

```ruby
gem 'indianize'
```
