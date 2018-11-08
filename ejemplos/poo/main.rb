require 'byebug'
require_relative 'estres'
require_relative 'interaccion'
require_relative 'estudiante'
require_relative 'curso'

nombre = 'Jorge'
carnet = '1500118'
asistencia1 = 0

Estres.programar(nombre)
Interaccion.saludar(nombre, carnet)

nombre2 = 'Luis'
carnet2 = '1500218'
asistencia2 = 0

Interaccion.saludar(nombre2, carnet2)
Interaccion.charlar(nombre, nombre2)

nombre3 = 'Manuel'
carnet3 = '1500318'
asistencia3 = 0

javier = Estudiante.new('Javier', '1500418')
wesley = Estudiante.new('Wesley', '2100118')
nuevo_curso = Curso.new('Progra', '207', 'Jorge Escalante')

# puts nuevo_curso.name
# puts nuevo_curso[:name]
# puts nuevo_curso.@name

Interaccion.saludar(nombre3, carnet3)
