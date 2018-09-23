def es_primo?(numero)
  es_primo = true
  numero.times do |i|
    if i >= 2 && i < numero
      es_primo = (numero % i).zero? ? false : true
      break unless es_primo
    end
  end
  es_primo
end

puts 'Ingrese un número:'
numero = gets.chomp.to_i
contador = 0
iterador = 1
primos = []
while contador < numero
  if es_primo?(iterador)
    contador += 1
    primos.push(iterador)
  end
  iterador += 1
end

puts 'Los primeros n primos son:'
puts primos.join(',')
