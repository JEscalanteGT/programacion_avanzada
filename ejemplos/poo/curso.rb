class Curso
  def initialize(name, aula, maestro)
    @name = name
    @aula = aula
    @estudiantes = []
    @maestro = maestro
  end

  def agregar_estudiante(estudiante)
    @estudiantes.push(estudiante)
  end
end
