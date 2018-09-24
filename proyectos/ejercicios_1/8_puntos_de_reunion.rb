def max?(arreglo)
  n = arreglo.max_by { |e| e }
  arreglo.index(n)
end

a = []
4.times do |i|
  puts "Ingrese la fila #{i}:"
  a[i] = gets.chomp.split(',').map(&:to_i)
end

max_x = []
a.each_with_index { |e, i| max_x.push([i, max?(e)]) }

b = []
a.each_with_index do |e, i|
  col = []
  4.times do |j|
    col.push(a[j][i])
  end
  b.push(col)
end

max_y = []
b.each_with_index { |e, i| max_y.push([max?(e), i]) }

puts 'Puntos de reunión:'
diccionario = ['A', 'B', 'C', 'D']
max_x.each do |e|
  pos = max_y.index { |item_b| e[0] == item_b[0] && e[1] == item_b[1] }
  if pos
    fila = diccionario[e[0]]
    columna = diccionario[e[1]]
    puts "(#{fila}, #{columna})"
  end
end
