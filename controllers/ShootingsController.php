<?php

namespace App\Controllers;


use App\Core\App;

class ShootingsController
{

//    public function index()
//    {
//        $posts = App::get('database')->getAllPosts();
//
//        return view('admin/posts/index', compact('posts'));
//    }
        public function index()
    {
        $shootings = App::get('database')->getAllShootings();
        return view('/admin/shootings/index', compact('shootings'));
    }

    public function create()
    {
        $shootings = App::get('database')->getAll('shootings');
        $categories = App::get('database')->getAll('shooting_categories');
        $customers = App::get('database')->getAll('customers');
        $alarms = App::get('database')->getAll('alarms');
        $users = App::get('database')->getAll('users');

        return view('/admin/shootings/create', compact('shootings', 'categories','customers','alarms','users'));
    }


    public function store()
    {
         App::get('database')->insert('shootings', [
            'shooting_category_id' => $_POST['category'],
            'user_id' => $_POST['user'],
            'customer_id' => $_POST['customer'],
            'description' => $_POST['description'],
            'price' => $_POST['price'],
            'expences' => $_POST['expences'],
//            'event_date' => $_POST['eventdate'],
            'date_created' => date('Y-m-d'),
            'notes' => $_POST['notes'],
            'alarm_id'=>$_POST['alarm']
        ]);


        return redirect('/admin/shootings');
    }

    public function edit()
    {

        $shooting = App::get('database')->find('shootings', $_GET['id']);
        $categories = App::get('database')->getAll('shooting_categories');
        $customers = App::get('database')->getAll('customers');
        $alarms = App::get('database')->getAll('alarms');
        $users = App::get('database')->getAll('users');

        return view('/admin/shootings/edit', compact( 'categories','customers','alarms','users','shooting'));
    }


    public function update()
    {
       App::get('database')->update('shootings', [
            'shooting_category_id' => $_POST['category'],
            'user_id' => $_POST['user'],
            'customer_id' => $_POST['customer'],
            'description' => $_POST['description'],
            'price' => $_POST['price'],
            'expences' => $_POST['expences'],
//            'event_date' => $_POST['eventdate'],
            'date_created' => date('Y-m-d'),
            'notes' => $_POST['notes'],
            'alarm_id'=>$_POST['alarm']
        ], $_POST['id']);

        return redirect('/admin/shootings');
    }

    public function delete()
    {
        $id = (int) $_GET['id'];

        if(! is_int($id)) return;

        App::get('database')->delete('shootings', $id);

        return redirect('/admin/shootings');

    }
    // API

    public function apiIndex(){

        $user = $_SESSION['user'];
        $shootings = App::get('database')->getAllShootingsByUser($user->id);
        return json($shootings);
    }

    public function apiCreate(){

        $user = $_SESSION['user'];
        $user_id = $user->id;
        $categories = App::get('database')->getAllShooting_CategoriesByUser($user->id);
        $customers = App::get('database')->getCustomers_Where_User_Id($user->id);
        $alarms = App::get('database')->getAll('alarms');

        return json([$categories,$user_id,$customers,$alarms]);

    }

    public function apiStore()
    {
        $_POST = json_decode(file_get_contents('php://input'), true);
        App::get('database')->insert('shootings', [
            'user_id' => $_POST['user_id'],
            'description' => $_POST['description'],
            'price' => $_POST['price'],
            'expences' => $_POST['expences'],
            'event_date' => $_POST['event_date'],
            'notes' => $_POST['notes'],
            'shooting_category_id' => $_POST['shooting_category_id'],
            'customer_id' => $_POST['customer_id'],
            'alarm_id' => $_POST['alarm_id']
        ]);
        return json(['result' => 'success']);
    }



    public function getUsersCategories()
    {
        //$_POST = json_decode(file_get_contents('php://input'), true);
        $id = $_POST['userId'];

        $categories = App::get('database')->getShooting_Categories_Where_User_Id($id);
        return json($categories);



    }
    public function getUsersCustomers()
    {
        //$_POST = json_decode(file_get_contents('php://input'), true);
        $id = $_POST['userId'];

        $customers = App::get('database')->getCustomers_Where_User_Id($id);
        return json($customers);



    }
}