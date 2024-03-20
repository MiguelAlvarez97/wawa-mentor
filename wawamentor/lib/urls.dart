////////////servidor/////////////////
///para salir al localhost desde el VM emulator 10.0.2.2
///direccion despliegue final https://wayrawawa.com/
///
/////pruebas localhost desde dispositivo movil físico
//const String path = 'http://192.168.1.38/';
const String path = 'https://wayrawawa.com/';

/////////////APIs////////////////////
const String apiLoginEstudiante =
    '${path}apiwawamentor/user_wm/loginEstudiante';
const String apiLoginMaestro = '${path}apiwawamentor/user_wm/loginMaestro';
const String apiLoginAdministrador =
    '${path}apiwawamentor/user_wm/loginAdministrador';
const String apiLoginUserData = '${path}apiwawamentor/user_wm/login';

const String apiLoginAdmin = '${path}apiwawamentor/user_wm/loginAdministrador';

const String coursesLevelEstudiante =
    '${path}apiwawamentor/coursesLevelEstudiante';

const String coursesLevelMaestro = '${path}apiwawamentor/coursesLevelMaestro';

const String apiConsultarLeccionesCurso = '${path}apiwawamentor/lessons/';

const String apiConsultarRecursosLeccion = '${path}apiwawamentor/resource/';

const String apiConsultarInfoTeacher = '${path}apiwawamentor/teacher/';
/////////////URLS//////////////////////

const String imageUserPath =
    'https://wayrawawa.com/wawamentor/assets/images/usuarios/';
const String imageCursoPath = 'https://wayrawawa.com/wawamentor/assets/images/';
