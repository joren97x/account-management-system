import { createRouter, createWebHistory } from "vue-router";
import {ref} from 'vue'
import Announcements from '../components/Student/Announcements.vue'
import Signin from '../components/Signin.vue'
import Signup from '../components/Signup.vue'
import Account from '../components/Student/Account.vue'
import Profile from '../components/Student/Profile.vue'
import StudentLayout from '../components/Layouts/StudentLayout.vue'
import AdminLayout from '../components/Layouts/AdminLayout.vue'
import AdminDashboard from '../components/Admin/AdminDashboard.vue'
import ManageUsers from '../components/Admin/ManageUsers.vue'

const user = ref(null)
function isLoggedIn() {
    user.value = JSON.parse(localStorage.getItem('auth'))
    console.log(user)
    if(!user.value) {
        return false
    }
    return true
}

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'Announcements',
            meta: {layout: StudentLayout, requiresAuth: true },
            component: Announcements,
        },
        {
            path: '/sign-in',
            name: 'Signin',
            meta: {layout: StudentLayout},
            component: Signin
        },
        {
            path: '/sign-up',
            name: 'Signup',
            meta: {layout: StudentLayout},
            component: Signup,
        },
        {
            path: '/account',
            name: 'Account',
            meta: { layout: StudentLayout, requiresAuth: true },
            component: Account
        },
        {
            path: '/profile',
            name: 'Profile',
            meta: { layout: StudentLayout, requiresAuth: true },
            component: Profile,
        },
        {
            path: '/admin/dashboard',
            name: 'AdminDashboard',
            meta: {layout: AdminLayout, requiresAuth: true},
            component: AdminDashboard
        },
        {
            path: '/admin/manage-users',
            name: 'ManageUsers',
            meta: {layout: AdminLayout, requiresAuth: true},
            component: ManageUsers
        },
    ]
})

router.beforeEach((to, from, next) => {
    if(to.matched.some(record => record.meta.requiresAuth)) {
        if(isLoggedIn()) {
            next()
        }
        else {
            next({name: 'Signin'})
        }
    }
    else {
        next()
    }
})



export default router