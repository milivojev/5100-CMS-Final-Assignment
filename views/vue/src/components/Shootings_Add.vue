<template>
<div class="marginL25 row">
    <div class="col-sm-5">
    <h3>Add new shooting</h3>

        <div class="">
            <label for="sel1">Select category:</label>
            <select class="" id="sel1" v-model="category">
                <option v-for="category in categories" :value="category.id">{{category.title}}</option>
            </select>
        </div>
        <div class="">
            <label for="nick">Select customer: </label>
            <select class="" id="nick" v-model="customer">
                <option v-for="customer in customers" :value="customer.id">{{customer.nick_name}}</option>
            </select>
            <a href="/#/customers_add">new customers? add them first</a>
        </div>
        <div class="">
            <label for="description">Description:</label>
            <textarea  class="" id="description" cols="55" rows="2" v-model="description"></textarea>
        </div>
        <div class="">
            <label for="price">Price:</label>
            <input type="text" id="price" v-model="price">
        </div>
        <div class="">
            <label for="expences">Expences:</label>
            <input type="text" id="expences" v-model="expences">
        </div>
        <div class="">
            <label for="date">Event date:</label>
            <input  size="16" type="date" id="date" placeholder="12-02-2012 14:30" v-model="event_date">

        </div>
        <div class="">
            <label for="notes">Notes:</label>
            <textarea id="notes" class="" cols="55" rows="2" v-model="notes"></textarea>
        </div>
        <div class="">
            <label for="alarm">Alarm</label>
            <select class="" id="alarm" v-model="alarm">
                <option v-for="alarm in alarms" :value="alarm.id">{{alarm.title}}</option>
            </select>
        </div>

        <button class='btn btn-success pull-right' @click="submitForm">Add Shooting</button>


    </div>
    <div class="col-sm-4 col-sm-offset-2">
        <h4>Edit shooting categories</h4>

        <div class="">
            <label for="scategory">Enter new category:</label>
            <input type="text" id="scategory" v-model="scategory">
            <button class='btn btn-success pull-right' @click="submitForm">Add category</button>

        </div>
        <hr>
        <div class="table-responsive">
            <table class="table table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Category</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="category in categories"   >
                    <td>{{category.title}}</td>
                    <td><a href="" class="btn btn-warning pull-right"> <span class="glyphicon glyphicon-edit">  </span></a></td>
                    <td><a href="" class="btn btn-danger pull-right"> <span class="glyphicon glyphicon-remove">  </span></a></td>

                </tr>

                </tbody>
            </table>
        </div>

    </div>
</div>

</template>

<script>
    export default {
        name: 'Shootings_Add',
        data(){
            return {
                user_id:"",
                categories:[
                    {

                    }
                ],
                customers:[],
                alarms:[],
                description:"",
                price:"",
                expences:"",
                event_date:"",
                notes:""
            }
        },
        mounted(){
            this.addShootingPreferences()
        },
        methods: {

            addShootingPreferences(){
                axios.get('/api/shootings_add')
                        .then((response)=> {

                            this.categories = response.data[0];
                            this.user_id = response.data[1];
                            this.customers = response.data[2];
                            this.alarms = response.data[3];

                });
            },
            submitForm(){
                axios.post('/api/shootings_add', {
                    user_id:this.user_id,
                    shooting_category_id:this.categories['category'],
                    customer_id:this.customers['customer'],
                    alarm_id:this.alarms['alarm'],
                    description:this.description,
                    price:this.price,
                    expences:this.expences,
                    event_date:this.event_date,
                    notes:this.notes
                }).then(axios.get('/api/shootings_add')
                    .then((response)=> {
                        this.user_id = response.data[1];
                        this.categories = response.data[0];
                        this.customers = response.data[2];
                        this.alarms = response.data[3];
                        this.description = "",
                        this.price = "",
                        this.expences = "",
                        this.event_date = "",
                        this.notes = ""
                })
                    )
            }
        }
    }
</script>

<style scoped>
    .marginL25{
        margin-left:25%;
    }
</style>