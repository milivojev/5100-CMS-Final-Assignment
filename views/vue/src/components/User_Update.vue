<template>
<div>
    <div >

        <h3 class="text-center ">Edit profile</h3>
    </div>
    <form v-on:submit="addCustomer">
        <div class="well">
            <h4>Customer Info</h4>
            <div class="form-group">
                <label>First Name</label>
                <input type="text" class="form-control" placeholder="First Name" v-model="customer.first_name">
            </div>
            <div class="form-group">
                <label>Last Name</label>
                <input type="text" class="form-control" placeholder="Last Name" v-model="customer.last_name">
            </div>
        </div>
        <div class="well">
            <h4>Customer Contact</h4>
            <div class="form-group">
                <label>Email</label>
                <input type="text" class="form-control" placeholder="Email" v-model="customer.email">
            </div>
            <div class="form-group">
                <label>Phone</label>
                <input type="text" class="form-control" placeholder="Phone" v-model="customer.phone">
            </div>
        </div>

        <div class="well">
            <h4>Customer Location</h4>
            <div class="form-group">
                <label>Address</label>
                <input type="text" class="form-control" placeholder="Address" v-model="customer.address">
            </div>
            <div class="form-group">
                <label>City</label>
                <input type="text" class="form-control" placeholder="City" v-model="customer.city">
            </div>
            <div class="form-group">
                <label>State</label>
                <input type="text" class="form-control" placeholder="State" v-model="customer.state">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

</div>
</template>

<script>
    export default {
        name: 'User_Update',
        data(){
            return {
               user:[]


            }
        },
        mounted(){
            this.getUser();
        },
        methods: {
            getUser(){
                axios.get('/api/user_update')
                        .then((response)=> {
                    console.log(response.data)
                            this.user = response.data
                });
            },
            submitForm(){
                axios.post('/api/users', {
                    name: this.user['name'],
                    email: this.user['email'],
                    password: this.user['password'],
                    logo: this.user['logo'],
                    facebook: this.user['facebook'],
                    instagram:this.user['instagram'],
                    gmail:this.user['gmail'],
                    youtube:this.user['youtube']
                }).then((response) =>  {

                })
            }
        }
    }
</script>

<style>

</style>