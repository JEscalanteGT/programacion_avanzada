class Estudiante
  def initialize(nombre, carnet)
    @nombre = nombre
    @carnet = carnet
    @punteo = 0
    @asistencia = 0
  end

  def saludar
    nombre = 'Mi nombre'
    puts "Hola mi nombre es #{@nombre} - #{@carnet}"
  end

  def asistir_clase
    @asistencia += 1
  end
end
