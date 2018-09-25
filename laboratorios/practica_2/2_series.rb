def unir(arreglo, posicion)
  s = arreglo.size - 1
  posicion == s ? arreglo[posicion] : arreglo[posicion] + unir(arreglo, posicion + 1)
end

def formar(serie, divisor, posicion)
  s = serie.size - 1
  if posicion == s
    return unir(serie[(s - divisor)..s], 0)
  elsif (posicion + divisor) <= s
    return unir(serie[posicion..(posicion + divisor)], 0) + ',' + formar(serie, divisor, posicion + 1)
  else
    return ''
  end
end

puts 'Ingrese una serie:'
n = gets.chomp
puts 'Ingrese un divisor:'
d = gets.chomp.to_i - 1
a = n.split('')

puts formar(a, d, 0)
