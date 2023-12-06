<script setup>

    import axios from 'axios';
    import {reactive} from 'vue'
    import {ref} from 'vue'

    const signUpBtnLoading = ref(false)
    const user = reactive({
        first_name: null,
        last_name: null,
        department: null,
        email: null,
        password: null,
    })

    function signup() {
        signUpBtnLoading.value = true
        let data = new FormData();
        data.append('method', 'signup');
        data.append('first_name', user.first_name)
        data.append('last_name', user.last_name)
        data.append('email', user.email)
        data.append('department', user.department)
        data.append('password', user.password)

        fetch(`http://localhost/account-management-system/backend/index.php`,
        {
            method: 'POST',
            body: data,
        })
        .then((response) => {
            console.log("OK NAMAN SIYA")
            console.log(response)
            signUpBtnLoading.value = false
        })
        .catch((error) => {
            console.log("DILI SIYA OK")
            console.log(error)
            signUpBtnLoading.value = false
        })
    }

</script>

<template>
    <v-card title="Sign up" width="69%">
        <v-card-item>
            <v-row>
                <v-col cols="6">
                    <v-text-field label="First name" v-model="user.first_name" name="first_name"></v-text-field>
                </v-col>
                <v-col cols="6">
                    <v-text-field label="Last name" v-model="user.last_name" name="last_name"></v-text-field>
                </v-col>
            </v-row>
            <v-text-field label="Email" v-model="user.email" name="email"></v-text-field>
            <v-select :items="['BSIT', 'BEED', 'BSED', 'BSHM']" v-model="user.department" name="department" label="Department"></v-select>
            <v-text-field label="Password" v-model="user.password" name="password"></v-text-field>
        </v-card-item>
        <v-card-actions>
            <v-btn @click="signup" :loading="signUpBtnLoading">Sign up</v-btn>
        </v-card-actions>
    </v-card>

</template>