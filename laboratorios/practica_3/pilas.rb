def agregar_elemento(pila, valor)
  if pila[:size] < pila[:max] || pila[:max] == -1
    pila[:size] += 1
    elemento = {
      valor: valor,
      siguiente: nil,
      posicion: pila[:size] - 1
    }

    elemento[:siguiente] = pila[:tope]
    pila[:tope] = elemento
  else
    puts 'PILA LLENA'
  end
end

def buscar_posicion(pila, posicion)
  elemento = {}
  aux = pila[:tope]
  loop do
    if posicion == aux[:posicion]
      elemento = aux
      break
    elsif aux[:siguiente] == nil
      break
    else
      aux = aux[:siguiente]
    end
  end
  return elemento
end

def buscar_valor(pila, valor)
  elemento = {}
  aux = pila[:tope]
  loop do
    if valor == aux[:valor]
      elemento = aux
      break
    elsif aux[:siguiente] == nil
      break
    else
      aux = aux[:siguiente]
    end
  end
  return elemento
end

def vacia?(pila)
  if pila[:tope] == nil
    return true
  else
    return false
  end
end

def eliminar(pila)
  elemento = {}
  if !vacia?(pila)
    elemento = pila[:tope]
    pila[:tope] = elemento[:siguiente]
    elemento[:siguiente] = nil
    pila[:size] -= 1
  else
    puts 'PILA VACIA'
  end
  return elemento
end

def definir_max(pila, posicion)
  pila[:max] = posicion

  veces = pila[:size] - pila[:max]

  for i in 0..(veces - 1)
    eliminar(pila)
  end
end

pila = {
  vacio: true,
  lleno: false,
  max: -1,
  size: 0,
  tope: nil
}

# INSERTAR UN ELEMENTO
agregar_elemento(pila, 12)

# INSERTAR OTRO ELEMENTO
agregar_elemento(pila, 25)

# INSERTAR OTRO ELEMENTO
agregar_elemento(pila, 35)

# INSERTAR OTRO ELEMENTO
agregar_elemento(pila, 43)

# puts 'Ingrese posición:'
# p = gets.chomp.to_i
# elemento = buscar_posicion(pila, p)
# puts elemento[:valor]

# puts 'Ingrese valor:'
# v = gets.chomp.to_i
# elemento = buscar_valor(pila, v)
# puts elemento[:posicion]

# puts 'Elementos eliminados:'
# elemento = eliminar(pila)
# puts elemento[:valor]

# elemento = eliminar(pila)
# puts elemento[:valor]

# elemento = eliminar(pila)
# puts elemento[:valor]

puts 'Cambiar max'
definir_max(pila, 5)
puts 'MAX: ' + pila[:max].to_s
puts 'SIZE:' + pila[:size].to_s

agregar_elemento(pila, 33)
pila_tope = pila[:tope]
puts pila_tope[:valor]

puts 'MAX: ' + pila[:max].to_s
puts 'SIZE:' + pila[:size].to_s

# eliminar(pila)
# eliminar(pila)
# eliminar(pila)
# eliminar(pila)
