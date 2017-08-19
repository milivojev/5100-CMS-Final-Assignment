<?php

namespace App\Controllers;

use App\Core\App;

class UsersController
{
    public function index()
    {
        $users = App::get('database')->getAll('users');

        return view('users/index', compact('users'));
    }

    //API

    public function apiIndex()
    {
        $users = App::get('database')->getAll('users');
        return json($users);
    }

    public function dateTime()
    {
        return json([
            'date' => date('d. m. Y H:i')
        ]);
    }
    public function apiUser()
    {
        $user = $_SESSION['user'];

       return json($user);
     }

    public function apiEdit()
    {


        $user = $_SESSION['user'];

        return json($user);
    }

    public function apiStore()
    {
        $_POST = json_decode(file_get_contents('php://input'), true);
        App::get('database')->insert('users', [
            'email' => $_POST['email'],
            'password' => md5($_POST['password']),
            'role_id' => $_POST['role'],
            'name' => $_POST['name'],
            'logo' => $_POST['logo'],
            'facebook' => $_POST['facebook'],
            'instagram' => $_POST['instagram'],
            'gmail'=> $_POST['gmail'],
            'youtube'=> $_POST['youtube']
        ]);
        return redirect('/api/user');
    }

}