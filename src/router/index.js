import { createRouter, createWebHistory } from "vue-router";
import Home from '../components/Home.vue'
import Signin from '../components/Signin.vue'
import Signup from '../components/Signup.vue'
import Account from '../components/Student/Account.vue'
import Profile from '../components/Student/Profile.vue'
import Calendar from '../components/Student/Calendar.vue'
import StudentLayout from '../components/Layouts/StudentLayout.vue'
import AdminLayout from '../components/Layouts/AdminLayout.vue'
import AdminDashboard from '../components/Admin/AdminDashboard.vue'
import ManageUsers from '../components/Admin/ManageUsers.vue'

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'Home',
            meta: {layout: StudentLayout},
            component: Home,
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
            component: Account
        },
        {
            path: '/profile',
            name: 'Profile',
            component: Profile,
        },
        {
            path: '/calendar',
            name: 'Calendar',
            component: Calendar
        },
        {
            path: '/admin/dashboard',
            name: 'AdminDashboard',
            meta: {layout: AdminLayout},
            component: AdminDashboard
        },
        {
            path: '/admin/manage-users',
            name: 'ManageUsers',
            meta: {layout: AdminLayout},
            component: ManageUsers
        },
    ]
})

export default router