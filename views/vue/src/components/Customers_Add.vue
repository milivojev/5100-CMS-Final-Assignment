<template>
    <div class="marginL25 row">
        <h3>Add new customer</h3>
        <div class="form-horizontal col-sm-5">
            <div class="">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName"  v-model="first_name">
            </div>
            <div class="">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName"  v-model="last_name">
            </div>
            <div class="">
                <label for="nick">Nick Name:</label>
                <input  type="text" id="nick"  v-model="nick_name">
            </div>
            <div class="">
                <label for="phone">Phone:</label>
                <input  type="text" id="phone"  v-model="phone">
            </div>
            <div class="">
                <label for="email">Email:</label>
                <input type="text" class="" id="email"   v-model="email">
            </div>
            <div class="">
                <label for="address">Address:</label>
                <input type="text" class="" id="address"   v-model="adress">
            </div>




            <button class='btn btn-success pull-right' type="submit" @click="submitForm">Add Customer</button>

        </div>

    </div>
</template>

<script>
    export default {
        name: 'Customers_Add',
        data(){
            return {
               formData: {
                first_name:"",
                last_name:"",
                nick_name:"",
                phone:"",
                email:"",
                adress:""
               }
            }
        },
        methods: {

            submitForm(){
                axios.post('/api/customers_add', this.formData
                ).then((response)=>{
                    console.log(response.data)
                    this.formData.first_name =  "",
                    this.formData.last_name =  "",
                    this.formData.nick_name =  "",
                    this.formData.phone =  "",
                    this.formData.email =  "",
                    this.formData.adress =  ""

                });
            }




        }
    }
</script>

<style scoped>
.marginL25{
    margin-left:25%;
}
</style>