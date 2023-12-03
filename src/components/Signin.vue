<script setup>

    import axios from 'axios';
    import {reactive} from 'vue'

    const user = reactive({
        email: null,
        password: null,
        method: 'signin'
    })

    function signin() {
        axios.post(`http://localhost/account-management-system/backend/index.php`, {user})
        .then((response) => {
            console.log("OK NAMAN SIYA")
            console.log(response)
        })
        .catch((error) => {
            console.log("DILI SIYA OK")
            console.log(error)
        })
    }

</script>

<template>
    
    <v-card title="Sign in" width="69%">
        <v-card-item>
            <v-text-field label="Email" v-model="user.email"></v-text-field>
            <v-text-field label="Password" v-model="user.password"></v-text-field>
        </v-card-item>
        <v-card-actions>
            <v-btn @click="signin">Sign in</v-btn>
        </v-card-actions>
    </v-card>

</template>