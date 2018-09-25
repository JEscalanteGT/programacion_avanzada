def unir(arreglo, posicion)
  s = arreglo.size - 1
  posicion == s ? arreglo[posicion] : arreglo[posicion] + '-' + unir(arreglo, posicion + 1)
end

puts 'Ingrese un arreglo:'
a = gets.chomp.split(',')
puts unir(a, 0)
