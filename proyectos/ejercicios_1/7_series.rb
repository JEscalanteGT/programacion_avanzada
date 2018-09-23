puts 'Ingrese una serie:'
n = gets.chomp
puts 'Ingrese un divisor:'
d = gets.chomp.to_i - 1
a = n.split('')
s = n.size
puts 'Las series posibles:'
s.times do |i|
  limite = i + d
  puts a[i..limite].join('')
  break if i + d >= a.size - 1
end
