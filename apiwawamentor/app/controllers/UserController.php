<?php

namespace App\Controllers;

use App\Models\User_wm;
use App\Models\Courses;
use App\Models\Course_student;
use App\Models\Lessons;
use App\Models\Resources;
use App\Models\Teacher;

class UserController extends Controller{
    // Este metodo es para acceder a todos los registros de la tabla user_wm
    public function index(){
        $datosUsuarios = User_wm::all();
        response()->json($datosUsuarios);
    }

    public function consultar($id){
        $datosUsuarios = User_wm::where('ID_USER', $id)->first();
        //$datosUsuarios = User_wm::find($id);
        if ($datosUsuarios) {
            response()->json($datosUsuarios);
        } else {
            response()->json(['message' => 'No se encontro el usuario'], 404);
        }
    }

    public function agregar(){
        $usuario = new User_wm;

             $userData = [
                "FIRST_NAME" => app()->request->get('FIRST_NAME'),
                "SECOND_NAME" => app()->request->get('SECOND_NAME'),
                "LAST_NAME" => app()->request->get('LAST_NAME'),
                "SEC_LAST_NAME" => app()->request->get('SEC_LAST_NAME'),
                "ID_CED" => app()->request->get('ID_CED'),
                "USER_PROVINCE" => app()->request->get('USER_PROVINCE'),
                "USER_CITY" => app()->request->get('USER_CITY'),
                "USER_ADDRESS" => app()->request->get('USER_ADDRESS'),
                "BIRTHDATE" => app()->request->get('BIRTHDATE'),
                "GENDER" => app()->request->get('GENDER'),
                "PHONE1" => app()->request->get('PHONE1'),
                "PHONE2" => app()->request->get('PHONE2'),
                "USER_MAIL" => app()->request->get('USER_MAIL'),
                "USER_PASSWORD" => app()->request->get('USER_PASSWORD'),
                "ACCOUNT_STATUS" => app()->request->get('ACCOUNT_STATUS'),
                "USER_PHOTO" => app()->request->get('USER_PHOTO'),
                "CREATION_DATE" => date("Y/m/d"),
                "CREATION_USER" => app()->request->get('CREATION_USER')
            ];
    
        // Insertar el nuevo usuario en la base de datos
        $usuario->insert($userData);
        //$usuario->save();
        response()->json(['message' => 'Contacto creado exitosamente'], 201);
    }
    public function borrar($id){
        $deleted = User_wm::where('ID_USER', $id)->delete();
        //$deleted = User_wm::destroy($id);
        //response()->json(['message' => 'ID_USER eliminado: '.$id]);
        if ($deleted) {
            response()->json(['message' => 'ID_USER eliminado: '.$id]);
        } else {
            response()->json(['message' => 'No se encontró el usuario'], 404);
        }
    }

    public function actualizar($id){
            //Todo es obligatorio menos secondName, Sec_lastName, phone2 y userphoto
            $FIRST_NAME = app()->request->get('FIRST_NAME');
            $SECOND_NAME = app()->request->get('SECOND_NAME');
            $LAST_NAME = app()->request->get('LAST_NAME');
            $SEC_LAST_NAME = app()->request->get('SEC_LAST_NAME');
            $ID_CED = app()->request->get('ID_CED');
            $USER_PROVINCE = app()->request->get('USER_PROVINCE');
            $USER_CITY = app()->request->get('USER_CITY');
            $USER_ADDRESS = app()->request->get('USER_ADDRESS');
            $BIRTHDATE = app()->request->get('BIRTHDATE');
            $GENDER = app()->request->get('GENDER');
            $PHONE1 = app()->request->get('PHONE1');
            $PHONE2 = app()->request->get('PHONE2');
            $USER_MAIL = app()->request->get('USER_MAIL');
            $USER_PASSWORD = app()->request->get('USER_PASSWORD');
            $ACCOUNT_STATUS = app()->request->get('ACCOUNT_STATUS');
            $USER_PHOTO = app()->request->get('USER_PHOTO');
            $CREATION_DATE = app()->request->get('CREATION_DATE');
            $CREATION_USER = app()->request->get('CREATION_USER');       

        $user = User_wm::where('ID_USER', $id)->first();
        //$user = User_wm::findOrFail($id);
   
        $user->FIRST_NAME = ($FIRST_NAME!="")?$FIRST_NAME:$user->FIRST_NAME;
        $user->SECOND_NAME =($SECOND_NAME!="")?$SECOND_NAME:$user->SECOND_NAME;
        $user->LAST_NAME = ($LAST_NAME!="")?$LAST_NAME:$user->LAST_NAME;
        $user->SEC_LAST_NAME = ($SEC_LAST_NAME!="")?$SEC_LAST_NAME:$user->SEC_LAST_NAME;
        $user->ID_CED = ($ID_CED!="")?$ID_CED:$user->ID_CED;
        $user->USER_PROVINCE=($USER_PROVINCE!="")?$USER_PROVINCE:$user->USER_PROVINCE;
        $user->USER_CITY=($USER_CITY!="")?$USER_CITY:$user->USER_CITY;
        $user->USER_ADDRESS=($USER_ADDRESS!="")?$USER_ADDRESS:$user->USER_ADDRESS;
        $user->BIRTHDATE=($BIRTHDATE!="")?$BIRTHDATE:$user->BIRTHDATE;
        $user->GENDER=($GENDER!="")?$GENDER:$user->GENDER;
        $user->PHONE1=($PHONE1!="")?$PHONE1:$user->PHONE1;
        $user->PHONE2=($PHONE2!="")?$PHONE2:$user->PHONE2;
        $user->USER_MAIL=($USER_MAIL!="")?$USER_MAIL:$user->USER_MAIL;
        $user->USER_PASSWORD=($USER_PASSWORD!="")?$USER_PASSWORD:$user->USER_PASSWORD;
        $user->ACCOUNT_STATUS=($ACCOUNT_STATUS!="")?$ACCOUNT_STATUS:$user->ACCOUNT_STATUS;
        $user->USER_PHOTO=($USER_PHOTO!="")?$USER_PHOTO:$user->USER_PHOTO;
        $user->CREATION_DATE=($CREATION_DATE!="")?$created_at:$user->CREATION_DATE;
        $user->CREATION_USER=($CREATION_USER!="")?$CREATION_USER:$user->CREATION_USER;

        $userData = [
            "FIRST_NAME" => ($FIRST_NAME!="")?$FIRST_NAME:$user->FIRST_NAME,
            "SECOND_NAME" => ($SECOND_NAME!="")?$SECOND_NAME:$user->SECOND_NAME,
            "LAST_NAME" => ($LAST_NAME!="")?$LAST_NAME:$user->LAST_NAME,
            "SEC_LAST_NAME" => ($SEC_LAST_NAME!="")?$SEC_LAST_NAME:$user->SEC_LAST_NAME,
            "ID_CED" => ($ID_CED!="")?$ID_CED:$user->ID_CED,
            "USER_PROVINCE" => ($USER_PROVINCE!="")?$USER_PROVINCE:$user->USER_PROVINCE,
            "USER_CITY" => ($USER_CITY!="")?$USER_CITY:$user->USER_CITY,
            "USER_ADDRESS" => ($USER_ADDRESS!="")?$USER_ADDRESS:$user->USER_ADDRESS,
            "BIRTHDATE" => ($BIRTHDATE!="")?$BIRTHDATE:$user->BIRTHDATE,
            "GENDER" => ($GENDER!="")?$GENDER:$user->GENDER,
            "PHONE1" => ($PHONE1!="")?$PHONE1:$user->PHONE1,
            "PHONE2" => ($PHONE2!="")?$PHONE2:$user->PHONE2,
            "USER_MAIL" => ($USER_MAIL!="")?$USER_MAIL:$user->USER_MAIL,
            "USER_PASSWORD" => ($USER_PASSWORD!="")?$USER_PASSWORD:$user->USER_PASSWORD,
            "ACCOUNT_STATUS" => ($ACCOUNT_STATUS!="")?$ACCOUNT_STATUS:$user->ACCOUNT_STATUS,
            "USER_PHOTO" => ($USER_PHOTO!="")?$USER_PHOTO:$user->USER_PHOTO,
            "CREATION_DATE" => ($CREATION_DATE!="")?$CREATION_DATE:$user->CREATION_DATE,
            "CREATION_USER" => ($CREATION_USER!="")?$CREATION_USER:$user->CREATION_USER
        ];

        //$user->where('ID_USER', $id)->update();
        $updated = User_wm::where('ID_USER', $id)->update($userData);

        if ($updated) {
            response()->json(['message' => 'Registro actualizado con ID_USER: '.$id]);
        } else {
            response()->json(['message' => 'No se encontro el usuario'], 404);
        }
    }
    // verifica usuario y contraseña (Verbo POST)
    public function login(){
        $username = app()->request()->get('username');
        $password = app()->request()->get('password');
        $datosUsuarios = User_wm::where('USER_MAIL', $username)->first();
        if($datosUsuarios == NULL){
            response()->json(['message' => 'Usuario no encontrado'], 400);
        }
        elseif ($datosUsuarios && password_verify($password, password_hash($datosUsuarios->USER_PASSWORD, PASSWORD_DEFAULT))) {
            // Si la autenticación es exitosa, retornar todos los atributos del usuario
            response()->json($datosUsuarios);
        } 
        else {
            // Si la autenticación falla, devolver un mensaje de error
            response()->json(['message' => 'Credenciales o Rol incorrecto'], 401);
        }
        
    }

    // para el login Estudiante
    public function loginEstudiante(){
        $username = app()->request()->get('username');
        $password = app()->request()->get('password');
        $cursosUsuario = Courses::whereIn('ID_COURSE', function($query) use ($username, $password){
            $query->select('ID_COURSE')
                ->from('course_student')
                ->where('ID_USER', '=', function ($query) use ($username, $password){
                    $query->from('user_wm')
                        ->select('ID_USER')
                        ->where('USER_MAIL', '=', $username)
                        ->where('USER_PASSWORD', '=', $password);
                });
        })->orderBy('ID_COURSE')->get();
        // VALIDAR!!
        if(count($cursosUsuario)!=0){
            response()->json($cursosUsuario);
        }
        else {
            // Si la autenticación falla, devolver un mensaje de error
            response()->json(['message' => 'Credenciales o Rol incorrecto'], 400);
            
        }

    }    

    // para el login Maestro
    public function loginMaestro(){
        $username = app()->request()->get('username');
        $password = app()->request()->get('password');
        $cursosUsuario = Courses::whereIn('ID_COURSE', function($query) use ($username, $password){
            $query->select('ID_COURSE')
                ->from('course_student')
                ->where('T_ID_USER', '=', function ($query) use ($username, $password){
                    $query->from('user_wm')
                        ->select('ID_USER')
                        ->where('USER_MAIL', '=', $username)
                        ->where('USER_PASSWORD', '=', $password);
                });
        })->orderBy('ID_COURSE')->get();
        // VALIDAR!!
        if(count($cursosUsuario)!=0){
            response()->json($cursosUsuario);
        }
        else {
            // Si la autenticación falla, devolver un mensaje de error
            response()->json(['message' => 'Credenciales o Rol incorrecto'], 400);
            
        }

    }    


    // para el login Administrador
    public function loginAdministrador(){
        $username = app()->request()->get('username');
        $password = app()->request()->get('password');
        $usuarioAdministrador = User_wm::whereIn('ID_USER', function($query) use ($username, $password){
            $query->select('ID_USER')
                ->from('ADMIN_WM')
                ->where('ID_USER', '=', function ($query) use ($username, $password){
                    $query->from('user_wm')
                        ->select('ID_USER')
                        ->where('USER_MAIL', '=', $username)
                        ->where('USER_PASSWORD', '=', $password);
                });
        })->first();
        // VALIDAR!!
        if($usuarioAdministrador){
            response()->json($usuarioAdministrador);
        }
        else {
            // Si la autenticación falla, devolver un mensaje de error
            response()->json(['message' => 'Credenciales o Rol incorrecto'], 400);
            
        }

    }    

    public function cursosInscritos($id){
        $cursosUsuario = Courses::whereIn('ID_COURSE', function($query) use ($id){
            $query->select('ID_COURSE')
                  ->from('course_student')
                  ->where('ID_USER', '=', $id);
        })->get();
        // VALIDAR!!
        response()->json($cursosUsuario);

    }



    // con el id del usuario Teacher consulto los cursos en los que imparte clases
    public function cursosMaestros($id){
        $cursosUsuario = Courses::whereIn('ID_COURSE', function($query) use ($id){
            $query->select('ID_COURSE')
                  ->from('course_student')
                  ->where('T_ID_USER', '=', $id);
        })->get();

        response()->json($cursosUsuario);



    }

    // consultar nivel de curso ESTUDIANTE
    public function consultarNivelEstudiante(){
        $idUser = app()->request()->get('idUser');
        $idCurso = app()->request()->get('idCurso');
        $nivel = Course_student::where('ID_USER', $idUser)->where('ID_COURSE', $idCurso)->get();
        response()->json($nivel);
    }   

        //Consultar lecciones
    public function consultarLecciones($id_course){
        $datoslecciones = Lessons::where('ID_COURSE', $id_course)
        ->orderBy('ID_LESSON')
        ->get();
        //$datosUsuarios = User_wm::find($id);
        if ($datoslecciones) {
            response()->json($datoslecciones);
        } else {
            response()->json(['message' => 'No se encontro lecciones'], 404);
        }
    }

    //Consultar Recursos
    public function consultarRecursos($id_lesson){
        $datosRecursos = Resources::where('ID_LESSON', $id_lesson)
        ->orderBy('ID_RESOURCE')->get();
        //$datosUsuarios = User_wm::find($id);
        if ($datosRecursos) {
            response()->json($datosRecursos);
        } else {
            response()->json(['message' => 'No se encontró Recursos'], 404);
        }
    }

    // Consulta niveles de los cursos del Estudiante
    public function coursesNivelEstudiante(){
        $username = app()->request()->get('username');
        $password = app()->request()->get('password');
        $cursosUsuario = Course_student::select('T_ID_USER','COURSE_LEVEL')
        ->where('ID_USER', function($query) use ($username, $password) {
            $query->select('ID_USER')
                ->from('user_wm')
                ->where('USER_MAIL', $username)
                ->where('USER_PASSWORD', $password);
        })
        ->orderBy('ID_COURSE')
        ->get();

    // VALIDAR!!
        if(count($cursosUsuario) != 0) {
            return response()->json($cursosUsuario);
        } else {
            // Si la autenticación falla, devolver un mensaje de error
            return response()->json(['message' => 'No existen cursos inscritos'], 400);
        }

    }  

        // Consulta niveles de los cursos del Maestro
        public function coursesNivelMaestro(){
            $username = app()->request()->get('username');
            $password = app()->request()->get('password');
            $cursosUsuario = Course_student::select('T_ID_USER','COURSE_LEVEL')
            ->where('T_ID_USER', function($query) use ($username, $password) {
                $query->select('ID_USER')
                    ->from('user_wm')
                    ->where('USER_MAIL', $username)
                    ->where('USER_PASSWORD', $password);
            })
            ->orderBy('ID_COURSE')
            ->get();
    
            // VALIDAR!!
            if(count($cursosUsuario) != 0) {
                return response()->json($cursosUsuario);
            } else {
                // Si la autenticación falla, devolver un mensaje de error
                return response()->json(['message' => 'No existen cursos inscritos'], 400);
            }
    
        }  

        //Consultar Recursos
    public function infoMaestro($id_teacher){
        $infoTeacher = Teacher::where('ID_USER', $id_teacher)->first();
        //$datosUsuarios = User_wm::find($id);
        if ($infoTeacher) {
            response()->json($infoTeacher);
        } else {
            response()->json(['message' => 'No se encontro informacion del Maestro'], 404);
        }
    }

}

