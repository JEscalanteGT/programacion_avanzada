def puntear(notas_principales, notas_secundarias, posicion)
  puntaje = notas_principales[posicion] > notas_secundarias[posicion] ? 1 : 0
  posicion > 0 ? puntaje + puntear(notas_principales, notas_secundarias, posicion - 1) : puntaje
end
puts 'Ingrese las notas de Ana:'
a = gets.chomp.split(',').map(&:to_i)

puts 'Ingrese las notas de Brenda:'
b = gets.chomp.split(',').map(&:to_i)

puts 'Resultados:'
puts "Ana: #{puntear(a, b, a.size - 1)}"
puts "Brenda: #{puntear(b, a, b.size - 1)}"
