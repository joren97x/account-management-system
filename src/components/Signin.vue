<script setup>

    import {reactive} from 'vue'
    const user = reactive({
        email: null,
        password: null,
    })

    function signin() {
        signUpBtnLoading.value = true
        let data = new FormData();
        data.append('method', 'signin');
        data.append('email', user.email)
        data.append('password', user.password)

        fetch(`http://localhost/account-management-system/backend/index.php`,
        {
            method: 'POST',
            body: data,
        })
        .then((response) => {
            return response.text()
        })
        .then((data) => {
            student.value = JSON.parse(data)
            console.log(data)
            localStorage.setItem('song', "lil kasalanan")
            localStorage.setItem('auth', JSON.stringify(student.value))
            signUpBtnLoading.value = false
            router.push('/')
        })
        .catch((error) => {
            signUpBtnLoading.value = false
            router.push('/')
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