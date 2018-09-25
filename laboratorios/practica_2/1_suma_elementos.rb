def suma(arreglo, posicion)
  posicion.zero? ? arreglo[posicion] : arreglo[posicion] + suma(arreglo, posicion - 1)
end

puts 'Ingrese una serie de números:'
a = gets.chomp.split(',').map(&:to_i)
resultado = suma(a, a.size - 1)

puts "El resultado es: #{resultado}"
