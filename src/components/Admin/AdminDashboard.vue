<script setup>

    import axios from "axios";
    import { onMounted } from "vue";
    import {ref} from 'vue'

    const students = ref(null)
    
    onMounted(() => {
        let data = new FormData();
        data.append('method','getAllStudents')
        fetch('http://localhost/account-management-system/backend/index.php',
            {
                method:'POST',
                body:data
            }
        )
        .then(res =>{
            console.log(res)
            return res.text();
        })
        .then(data =>{
            console.log(data);
            students.value = JSON.parse(data);
        })
    })

</script>
<template>
    <p class="text-h1">Admin dashboard</p>
    {{ students }}
</template>