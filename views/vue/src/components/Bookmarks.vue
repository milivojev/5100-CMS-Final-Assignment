<template>
<div>
    <div >
        <div class="edit-buttons">
            <a href="/#/bookmarks_add" class="btn btn-success pull-right"> <span class="glyphicon glyphicon-plus"> add bookmark </span></a>
        </div>
        <h3 class="text-center ">List of all Bookmarks</h3>
    </div>
    <div class="table-responsive ">
        <table class="table table-striped table-hover table-condensed ">
            <thead>
            <tr>
                <th>Title</th>
                <th>Link</th>
                <th>Description</th>
                <th>Category</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="bookmark in bookmarks">
                <td>{{bookmark.title}}</td>
                <td>{{bookmark.link}}</td>
                <td>{{bookmark.description}}</td>
                <td>{{bookmark.category}}</td>
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
        name: 'Bookmarks',
        data(){
            return {
               bookmarks:[],

            }
        },
        mounted(){
            this.getBookmarks();
        },
        methods: {

            getBookmarks(){
                axios.get('/api/bookmarks')
                        .then((response)=> {
                            this.bookmarks = response.data
                });
            }
        }
    }
</script>

<style>

</style>