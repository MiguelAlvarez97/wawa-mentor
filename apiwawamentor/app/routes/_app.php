<?php

app()->get('/', function () {
    response()->json(['message' => 'Bienvenido']);
});
// consulta todos los registros (Verbo GET)
app()->get('/user_wm', 'UserController@index');
// consulta un registro con un ID(Verbo GET)
app()->get('/user_wm/{id}', 'UserController@consultar');
// Inserta 1 registro (Verbo POST)
app()->post('/user_wm', 'UserController@agregar');
// borra un registro con el id (Verbo DELETE)
app()->delete('/user_wm/{id}', 'UserController@borrar');
// actualiza un registro con el id (Verbo PUT)
app()->put('/user_wm/{id}', 'UserController@actualizar');

// verifica usuario y contraseña (Verbo POST)
app()->post('/user_wm/login', 'UserController@login');

//login Estudiante
app()->post('/user_wm/loginEstudiante', 'UserController@loginEstudiante');

//login Maestro
app()->post('/user_wm/loginMaestro', 'UserController@loginMaestro');

//login Administrador
app()->post('/user_wm/loginAdministrador', 'UserController@loginAdministrador');

//Consultar nivel de cada curso ESTUDIANTE
app()->post('/nivelEstudiante', 'UserController@consultarNivelEstudiante');

//Consultar nivel de cada curso MAESTRO
app()->post('/nivelMaestro', 'UserController@consultarNivelMaestro');

//Consulta los cursos a los que el estudiante está inscrito
app()->get('/course_student/{id}', 'UserController@cursosInscritos');

//Consulta los cursos a los que el maestro imparte clases
app()->get('/course_teacher/{id}', 'UserController@cursosMaestros');

//Consulta el nivel de cada curso del Estudiante ordenado por ID_CURSO
app()->post('/coursesLevelEstudiante', 'UserController@coursesNivelEstudiante');

//Consulta el nivel de cada curso del MAESTRO ordenado por ID_CURSO
app()->post('/coursesLevelMaestro', 'UserController@coursesNivelMaestro');

//Consulta lecciones
app()->get('/lessons/{id_course}', 'UserController@consultarLecciones');

//Consulta Recursos de lecciones
app()->get('/resource/{id_lesson}', 'UserController@consultarRecursos');

// Consultar info de Maestro
app()->get('/teacher/{id_teacher}', 'UserController@infoMaestro');


