import Vue from 'vue'
import Router from 'vue-router'
import Main from '../components/Main.vue'
import Shootings from '../components/Shootings.vue'
import Shootings_Add from '../components/Shootings_Add.vue'
import Stats from '../components/Stats.vue'
import Bookmarks from '../components/Bookmarks.vue'
import Bookmarks_Add from '../components/Bookmarks_Add.vue'
import Customers from '../components/Customers.vue'
import Customers_Add from '../components/Customers_Add.vue'
import User from '../components/User.vue'
import User_Update from '../components/User_Update.vue'

Vue.use(Router)

export default new Router({


    routes: [
        {
            path: '/',
            name: 'Main',
            component: Main
        },
        {
            path: '/shootings',
            name: 'Shootings',
            component: Shootings
        },
        {
            path:'/shootings_add',
            name:'Shootings_Add',
            component: Shootings_Add
        },
        {
            path:'/bookmarks',
            name:'Bookmarks',
            component: Bookmarks
        },
        {
            path:'/bookmarks_add',
            name:'Bookmarks_Add',
            component: Bookmarks_Add
        },
        {
            path:'/customers',
            name:'Customers',
            component: Customers
        },
        {
            path:'/customers_add',
            name:'Customers_Add',
            component: Customers_Add
        },
        {
            path:'/stats',
            name:'Stats',
            component: Stats
        },
        {
            path: '/user',
            name:'User',
            component:User
        },
        {
            path: '/user_update',
            name:'User_Update',
            component: User_Update
        }

    ]
})
