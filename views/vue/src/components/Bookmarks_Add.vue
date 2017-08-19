<template>

<div class="marginL25 row">
    <h3>Add new bookmark</h3>
    <div class="col-sm-5">
        <div class="">
            <label for="bookmark">Title:</label>
            <input type="text" id="bookmark" name="bookmark" v-model="title">
        </div>
        <div class="">
            <label for="blink">Link:</label>
            <input type="text" id="blink" name="blink" v-model="link">
        </div>
        <div class="">
            <label for="description">Description:</label>
            <textarea  class="" id="description" cols="35" rows="1" name="description" v-model="description"></textarea>
        </div>
        <div class="">
            <label for="sel1">Select category: </label>
            <select class="" id="sel1" v-model="category">
                <option v-for="category in categories" :value="category.id">{{category.title}}</option>
            </select>

        </div>

        <button class='btn btn-success pull-right' type="submit" @click="submitForm">Submit</button>

    </div>
    <div class="col-sm-4 col-sm-offset-2">
        <h4>Edit shooting categories</h4>

        <div class="">
            <label for="category">Enter new category:</label>
            <input type="text" id="category" v-model="category">
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
        name: 'Bookmarks_Add',
        data(){
            return {
               user_id:"",
               categories:[],
               title:"",
               link:"",
               description:""
            }
        },
        mounted(){
            this.getUser();
            this.getCategories();


        },
        methods: {
            getUser(){
                axios.get('/api/users/me')
                    .then((response) => {
//                    console.log(response.data)
                        this.user_id = response.data.id;

                    });
            },
            getCategories(){
                axios.get('/api/bookmark_categories')
                    .then((response) => {
                    console.log(response.data)
                        this.categories = response.data
                    });
            },
            submitForm(){
                axios.post('/api/bookmarks_add',
                    {
                    user_id: this.user_id,
                    bookmark_category_id:"" ,
                    title: this.title,
                    link: this.link,
                    description: this.description
                    }
                ).then((response)=>{
                        console.log(response.data)
                    });
            }




        }
    }
</script>

<style scoped>
    .marginL25{
        margin-left:25%;
    }
    .form2 {
        margin-top: 30px;
    }
    .form3{
        float: left;
    }
</style>