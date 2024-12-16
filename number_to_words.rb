# Dizionari per i numeri
UNITS = %w[zero uno due tre quattro cinque sei sette otto nove]
TENS = %w[dieci undici dodici tredici quattordici quindici sedici diciassette diciotto diciannove]
DECADES = %w[venti trenta quaranta cinquanta sessanta settanta ottanta novanta]

def number_to_words(number)
  return "Numero non supportato" if number < 0 || number > 999

  if number < 10
    UNITS[number]
  elsif number < 20
    TENS[number - 10]
  elsif number < 100
    decade = DECADES[(number / 10) - 2]
    unit = number % 10
    unit == 0 ? decade : "#{decade}#{UNITS[unit]}"
  else
    hundreds = "#{UNITS[number / 100]}cento"
    remainder = number % 100
    remainder == 0 ? hundreds : "#{hundreds}#{number_to_words(remainder)}"
  end
end

# Test
if __FILE__ == $0
  puts "Inserisci un numero tra 0 e 999:"
  input = gets.chomp.to_i
  puts "Il numero in parole è: #{number_to_words(input)}"
end
