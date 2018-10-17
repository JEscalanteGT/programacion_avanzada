require 'byebug'
require 'terminal-table'

def vacia?(lista)
  lista[:tope].nil? && lista[:fondo].nil?
end

def obtener_posicion(lista, carnet)
  i = 0
  aux = lista[:tope]
  loop do
    if aux[:valor][:carnet] == carnet || aux[:siguiente].nil?
      break
    end
    i += 1
    aux = aux[:siguiente]
  end

  return i
end

def insertar_inicio(lista, estudiante)
  nodo = {
    valor: estudiante,
    siguiente: nil
  }
  if vacia?(lista)
    lista[:tope] = nodo
    lista[:fondo] = nodo
  else
    nodo[:siguiente] = lista[:tope]
    lista[:tope] = nodo
  end

  lista[:size] += 1
end

def insertar_final(lista, estudiante)
  nodo = {
    valor: estudiante,
    siguiente: nil
  }
  if vacia?(lista)
    lista[:tope] = nodo
    lista[:fondo] = nodo
  else
    lista[:fondo][:siguiente] = nodo
    lista[:fondo] = nodo
  end

  lista[:size] += 1
end

def obtener_nodo(lista, posicion)
  nodo = {}
  i = 0
  aux = lista[:tope]
  loop do
    if i == posicion
      nodo = aux
      return nodo
    end
    if aux[:siguiente] == nil
      break
    end
    i += 1
    aux = aux[:siguiente]
  end
  return nodo
end

def insertar_antes(lista, referencia, estudiante)
  nodo = {
    valor: estudiante,
    siguiente: nil
  }

  unless vacia?(lista)
    posicion = obtener_posicion(lista, referencia)
    referencia = obtener_nodo(lista, posicion)
    nodo_anterior = obtener_nodo(lista, posicion - 1)

    nodo[:siguiente] = referencia

    if posicion == 0
      lista[:tope] = nodo
    else
      nodo_anterior[:siguiente] = nodo
    end

    lista[:size] += 1
  end
end

def insertar_despues(lista, referencia, estudiante)
  nodo = {
    valor: estudiante,
    siguiente: nil
  }
  unless vacia?(lista)
    posicion = obtener_posicion(lista, referencia)
    referencia = obtener_nodo(lista, posicion)

    nodo[:siguiente] = referencia[:siguiente]
    referencia[:siguiente] = nodo

    if lista[:size] - 1 == posicion
      lista[:fondo] = nodo
    end

    lista[:size] += 1
  end
end

def mostrar(lista)
  aux = lista[:tope]
  if vacia?(lista)
    puts 'La lista esta vacía'
  else
    tabla = Terminal::Table.new do |t|
      t.headings = ['Valor', 'Posicion', 'Siguiente']

      aux = lista[:tope]
      loop do
        siguiente = aux[:siguiente]
        estudiante = aux[:valor]
        t.add_row([
          "#{estudiante[:carnet]} - #{estudiante[:nombre]}",
          obtener_posicion(lista, estudiante[:carnet]),
          siguiente == nil ? 'NIL' : siguiente[:valor][:carnet]
        ])
        if aux[:siguiente] == nil
          break
        end
        aux = aux[:siguiente]
      end
      t.add_row(:separator)
      t.add_row([
        { value: 'Total', colspan: 2, alignment: :right },
        lista[:size]
      ])
    end
    puts tabla
  end
end

estudiantes = [
  { nombre: 'Donald', carnet: '1538017' },
  { nombre: 'Leysi', carnet: '1542218' },
  { nombre: 'Jose', carnet: '1567417' },
  { nombre: 'Diana', carnet: '1515617' },
  { nombre: 'Kelvin', carnet: '1662318' }
]

lista = {
  tope: nil,
  fondo: nil,
  size: 0
}

estudiantes.each do |estudiante|
  # insertar_inicio(lista, estudiante)
  insertar_final(lista, estudiante)
end

mostrar(lista)

estudiante = {
  nombre: 'Vinicio',
  carnet: '1541218'
}

insertar_antes(lista, '1538017', estudiante)

nuevo_estudiante = {
  nombre: 'Linda',
  carnet: '1508318'
}

insertar_despues(lista, '1662318', nuevo_estudiante)

mostrar(lista)
