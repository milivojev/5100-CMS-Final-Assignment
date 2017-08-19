<template>
<div>
    <div >
        <div class="edit-buttons">
            <a href="/#/shootings_add" class="btn btn-success pull-right"> <span class="glyphicon glyphicon-plus"> add shooting </span></a>
        </div>
        <h3 class="text-center ">List of all shootings</h3>
    </div>
    <div class="table-responsive ">
        <table class="table table-striped table-hover table-condensed ">
            <thead>
            <tr>
                <th>Category</th>
                <th> Nickname</th>
                <th class="tableWidthMax">Description</th>
                <th>Price</th>
                <th>Expences</th>
                <th>Date</th>
                <th>Alarm </th>
                <th class="tableWidthMin">Notes</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="shooting in shootings">
                <td>{{shooting.category}}</td>
                <td>{{shooting.customer_nick}}</td>
                <td>{{shooting.description}}</td>
                <td>{{shooting.price}}</td>
                <td>{{shooting.expences}}</td>
                <td>{{shooting.event_date}}</td>
                <td>{{shooting.alarm}}</td>
                <td>{{shooting.notes}}</td>
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
        name: 'Shootings',
        data(){
            return {
               shootings:[],

            }
        },
        mounted(){
            this.getShootings();
        },
        methods: {

            getShootings(){
                axios.get('/api/shootings')
                        .then((response)=> {
                    console.log(response.data)
                            this.shootings = response.data
                });
            }
        }
    }
</script>

<style>

</style>