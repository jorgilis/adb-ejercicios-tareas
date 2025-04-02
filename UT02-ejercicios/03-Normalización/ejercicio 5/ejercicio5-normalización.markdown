# Normalización de la Tabla CursosEstudiantes

### Datos Originales:

| RegistroID | EstudianteID | NombreEstudiante | Cursos                | Profesor    | Notas        | Departamento |
|------------|--------------|------------------|-----------------------|-------------|--------------|--------------|
| 1          | 201          | Alicia           | "Matemáticas, Física"  | Dr. Pérez   | "85, 90"     | Ciencias     |
| 2          | 202          | Roberto          | "Matemáticas, Química" | Dr. Pérez   | "78, 88"     | Ciencias     |
| 3          | 203          | Julia            | "Historia, Literatura" | Dr. Gómez   | "92, 80"     | Humanidades  |
| 4          | 204          | Mario            | "Química"             | Dr. Pérez   | "75"         | Ciencias     |

### 1. Primera Forma Normal (1FN)

Para cumplir con **1FN**, debemos asegurarnos de que cada celda contenga solo un valor atómico. La tabla original contiene múltiples valores en las columnas **Cursos** y **Notas**, por lo que necesitamos separarlos en filas distintas.

#### Tabla normalizada en 1FN:

| RegistroID | EstudianteID | NombreEstudiante | Curso        | Profesor    | Nota | Departamento |
|------------|--------------|------------------|--------------|-------------|------|--------------|
| 1          | 201          | Alicia           | Matemáticas  | Dr. Pérez   | 85   | Ciencias     |
| 1          | 201          | Alicia           | Física       | Dr. Pérez   | 90   | Ciencias     |
| 2          | 202          | Roberto          | Matemáticas  | Dr. Pérez   | 78   | Ciencias     |
| 2          | 202          | Roberto          | Química      | Dr. Pérez   | 88   | Ciencias     |
| 3          | 203          | Julia            | Historia     | Dr. Gómez   | 92   | Humanidades  |
| 3          | 203          | Julia            | Literatura   | Dr. Gómez   | 80   | Humanidades  |
| 4          | 204          | Mario            | Química      | Dr. Pérez   | 75   | Ciencias     |

---

### 2. Segunda Forma Normal (2FN)

Para cumplir con **2FN**, debemos eliminar las dependencias parciales. Las columnas **NombreEstudiante** y **Departamento** dependen solo de **EstudianteID**, no de la clave primaria completa (que es `RegistroID` + `Curso`). Por lo tanto, debemos crear una tabla separada para **Estudiantes**.

#### Nueva tabla de estudiantes:

| EstudianteID | NombreEstudiante | Departamento |
|--------------|------------------|--------------|
| 201          | Alicia           | Ciencias     |
| 202          | Roberto          | Ciencias     |
| 203          | Julia            | Humanidades  |
| 204          | Mario            | Ciencias     |

#### Tabla de cursos y notas (sin dependencias parciales):

| RegistroID | EstudianteID | Curso        | Profesor    | Nota |
|------------|--------------|--------------|-------------|------|
| 1          | 201          | Matemáticas  | Dr. Pérez   | 85   |
| 1          | 201          | Física       | Dr. Pérez   | 90   |
| 2          | 202          | Matemáticas  | Dr. Pérez   | 78   |
| 2          | 202          | Química      | Dr. Pérez   | 88   |
| 3          | 203          | Historia     | Dr. Gómez   | 92   |
| 3          | 203          | Literatura   | Dr. Gómez   | 80   |
| 4          | 204          | Química      | Dr. Pérez   | 75   |

---

### 3. Tercera Forma Normal (3FN)

Para cumplir con **3FN**, debemos eliminar las dependencias transitivas. La columna **Profesor** depende de **Curso**, no de la clave primaria, por lo que debemos crear una tabla separada para **Cursos**.

#### Nueva tabla de cursos:

| Curso        | Profesor    |
|--------------|-------------|
| Matemáticas  | Dr. Pérez   |
| Física       | Dr. Pérez   |
| Química      | Dr. Pérez   |
| Historia     | Dr. Gómez   |
| Literatura   | Dr. Gómez   |

#### Tabla de cursos y notas final:

| RegistroID | EstudianteID | Curso        | Nota |
|------------|--------------|--------------|------|
| 1          | 201          | Matemáticas  | 85   |
| 1          | 201          | Física       | 90   |
| 2          | 202          | Matemáticas  | 78   |
| 2          | 202          | Química      | 88   |
| 3          | 203          | Historia     | 92   |
| 3          | 203          | Literatura   | 80   |
| 4          | 204          | Química      | 75   |

---

### Resumen de las Tablas Normalizadas:

1. **Tabla de estudiantes:**

| EstudianteID | NombreEstudiante | Departamento |
|--------------|------------------|--------------|
| 201          | Alicia           | Ciencias     |
| 202          | Roberto          | Ciencias     |
| 203          | Julia            | Humanidades  |
| 204          | Mario            | Ciencias     |

2. **Tabla de cursos:**

| Curso        | Profesor    |
|--------------|-------------|
| Matemáticas  | Dr. Pérez   |
| Física       | Dr. Pérez   |
| Química      | Dr. Pérez   |
| Historia     | Dr. Gómez   |
| Literatura   | Dr. Gómez   |

3. **Tabla de cursos y notas:**

| RegistroID | EstudianteID | Curso        | Nota |
|------------|--------------|--------------|------|
| 1          | 201          | Matemáticas  | 85   |
| 1          | 201          | Física       | 90   |
| 2          | 202          | Matemáticas  | 78   |
| 2          | 202          | Química      | 88   |
| 3          | 203          | Historia     | 92   |
| 3          | 203          | Literatura   | 80   |
| 4          | 204          | Química      | 75   |
