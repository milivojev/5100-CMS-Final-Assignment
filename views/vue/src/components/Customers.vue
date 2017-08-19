<template>
<div>
    <div >
        <div class="edit-buttons">
            <a href="/#/customers_add" class="btn btn-success pull-right"> <span class="glyphicon glyphicon-plus"> add customer </span></a>
        </div>
        <h3 class="text-center ">List of all customers</h3>
    </div>
    <div class="table-responsive ">
        <table class="table table-striped table-hover table-condensed ">
            <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Customer Nickname</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="customer in customers">
                <td>{{customer.first_name}}</td>
                <td>{{customer.last_name}}</td>
                <td>{{customer.nick_name}}</td>
                <td>{{customer.phone}}</td>
                <td>{{customer.email}}</td>
                <td>{{customer.adress}}</td>
                <td><a href="" class="btn btn-warning pull-right"> <span class="glyphicon glyphicon-edit">  </span></a></td>
                <td><a href="" class="btn btn-danger pull-right"> <span class="glyphicon glyphicon-remove">  </span></a></td>
            </tr>
            </tbody>

        </table>

    </div>
</div>
</template>

<script>
    export default {
        name: 'Customers',
        data(){
            return {
               customers:[],

            }
        },
        mounted(){
            this.getCustomers();
        },
        methods: {

            getCustomers(){
                axios.get('/api/customers')
                        .then((response)=> {
                    console.log(response.data)
                            this.customers = response.data
                });
            }
        }
    }
</script>

<style>

</style>