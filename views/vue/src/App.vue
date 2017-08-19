<template>
    <div class="container-fluid main">
        <div class="row  page-header">
            <div class="col-sm-3 ">
                <div class="text-center">
                        <span class="custom-file-control text-center"> <img src="img/logo-infocusR.jpg" class="img-responsive " alt="logo"></span>
                        <p> <router-link to="/user" exact active-class="active"><small>place your own logo here</small></router-link></p>
                </div>
            </div>
            <div class="col-sm-6 app-baner">
                <p>make your job a joy</p>

            </div>
            <div class="col-sm-3 ">
                <div class="navbar-right">
                    <p>wellcome <span style="font-weight: bold">{{username}}</span></p>
                    <a href="/logout"> log out
                        <span class="glyphicon glyphicon-log-out"></span>
                     </a>
                </div>
            </div>
        </div>
        <div class="row second-row">
            <div class="col-xs-12 col-sm-3 col-md-2">
                <div class="list-group text-center">
                     <ul>
                         <li class="list-group-item list-group-item-warning"><router-link to="/" exact  active-class="active">Main</router-link></li>
                         <li class="list-group-item list-group-item-warning"> <router-link to="/shootings" exact  >Shootings </router-link></li>
                         <li class="list-group-item list-group-item-warning"><router-link to="/stats" exact  active-class="active">Stats </router-link></li>
                         <li class="list-group-item list-group-item-warning"><router-link to="/customers" exact  active-class="active">Customers  </router-link></li>
                         <li class="list-group-item list-group-item-warning"><router-link to="/bookmarks" exact  active-class="active">Bookmarks  </router-link></li>
                         <li class="list-group-item list-group-item-warning"> <router-link to="/user" exact active-class="active">My Profile </router-link></li>
                     </ul>
                </div>
             </div>
            <router-view></router-view>
        </div>
        <div class="text-center footer">
            <a :href="linkFb" target="new"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>
            <a :href="linkInst" target="new"  ><i class="fa fa-instagram" aria-hidden="true"></i></a>
            <a :href="linkEmail" target="new"><i class="fa fa-envelope-o" aria-hidden="true"></i></a>
            <a :href="linkYoutube" target="new"><i class="fa fa-youtube-square" aria-hidden="true"></i></a>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'app',
        data(){
            return {
                linkFb:"http://facebook.com",
                linkInst:"",
                linkEmail:"",
                linkYoutube:"",
                username:""
            }
        },
        mounted(){
            this.getUser();
        },
        methods:{
            getUser(){
                axios.get('/api/users/me')
                    .then((response)=> {
                this.linkFb = response.data.facebook,
                this.linkInst = response.data.instagram,
                this.linkEmail = response.data.gmail,
                this.linkYoutube = response.data.youtube,
                this.username = response.data.name
                })
            }
        }

    }
</script>

<style>

</style>