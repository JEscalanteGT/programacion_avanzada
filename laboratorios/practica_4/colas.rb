require 'byebug'
require 'terminal-table'

def vacia?(cola)
  return cola[:tope].nil? && cola[:final] == nil
end

def insertar(cola, valor)
  if vacia?(cola)
    elemento = {
      valor: valor,
      posicion: 0,
      siguiente: nil
    }
    cola[:tope] = elemento
    cola[:final] = elemento
  else
    elemento = {
      valor: valor,
      posicion: cola[:size],
      siguiente: nil
    }
    elemento_final = cola[:final]
    elemento_final[:siguiente] = elemento

    cola[:final] = elemento
  end
  cola[:size] += 1# cola[:size] = cola[:size] + 1
end

def mostrar(cola)
  tope = cola[:tope]
  tabla = Terminal::Table.new do |t|
    t.headings = ['Valor', 'Posicion', 'Siguiente']

    aux = cola[:tope]
    loop do
      siguiente = aux[:siguiente]
      t.add_row([
        aux[:valor],
        aux[:posicion],
        siguiente == nil ? 'NIL' : siguiente[:valor]
      ])
      if aux[:siguiente] == nil
        break
      end
      aux = aux[:siguiente]
    end
  end

  puts tabla
end

cola = {
  tope: nil,
  final: nil,
  max: -1,
  size: 0
}

insertar(cola, 11)
insertar(cola, 13)
insertar(cola, 'a')
insertar(cola, 15)
mostrar(cola)

puts 'Hola mundo'
