puts 'Ingrese un número:'
n = gets.chomp.to_i
m = []
if (n % 3).zero?
  m.push('pling')
end

if (n % 5).zero?
  m.push('plang')
end

if (n % 7).zero?
  m.push('plong')
end

if m.empty?
  m.push(n)
end

puts 'Gotas de lluvia:'
puts m.join(', ')
