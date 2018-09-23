puts 'Ingrese una frase:'
frase = gets.chomp

a = frase.split(' ')
s = a.size
d = {}
s.times do |i|
  w = a[i]
  d[w] = d[w] ? d[w] + 1 : 1
end
puts 'Palabras de la frase:'
d.each do |llave, valor|
  puts "#{llave} - #{valor}"
end
