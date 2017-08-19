<template>
<div>
    <div >

        <h3 class="text-center ">My profile</h3>
    </div>
    <div class="table-responsive ">
        <table class="table table-hover table-condensed ">
            <thead>
            <tr>
                <th>User Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Logo</th>
                <th>Facebook</th>
                <th>Instagram</th>
                <th>Gmail</th>
                <th>Youtube</th>
                <th>Update</th>
            </tr>
            </thead>
            <tbody>
            <tr >
                <td >{{user.name}}</td>
                <td>{{user.password}}</td>
                <td>{{user.email}}</td>
                <td>{{user.logo}}</td>
                <td>{{user.facebook}}</td>
                <td>{{user.instagram}}</td>
                <td>{{user.gmail}}</td>
                <td>{{user.youtube}}</td>
                <td><a href="/#/user_update" class="btn btn-warning pull-right"> <span class="glyphicon glyphicon-edit">  </span></a></td>
            </tr>
            </tbody>
        </table>
        <br>
        <hr>
        <div class="col-xs-12 ">
            <a href="" class="btn btn-success pull-right"> <span class="glyphicon glyphicon-plus"> add picture </span></a>
            <div class="text-center ">
                <h3>My slideshow</h3>
            </div>

            <div class="table-responsive ">
                <table class="table table-striped table-hover table-condensed  ">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Picture</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr >
                        <td>1</td>
                        <td>img1.jpg</td>
                        <td><a href="" class="btn btn-warning "> <span class="glyphicon glyphicon-edit">  </span></a></td>
                        <td><a href="" class="btn btn-danger "> <span class="glyphicon glyphicon-remove">  </span></a></td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</template>

<script>
    export default {
        name: 'User',
        data(){
            return {
               user:[],

            }
        },
        mounted(){
            this.getUser();
        },
        methods: {

            getUser(){
                axios.get('/api/user')
                        .then((response)=> {
                    console.log(response.data)
                            this.user = response.data
                });
            }
        }
    }
</script>

<style scoped>

</style>