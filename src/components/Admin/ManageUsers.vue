<script setup>

    let students = []
    let data = new FormData();
    data.append('method', 'getAllStudents');
    fetch(`http://localhost/account-management-system/backend/index.php`, {
        body: data,
        method: 'POST'
    })
    // .then((response) => {
    //     students = response.data
    //     console.log(response)
    // })
    .then(res =>{
        console.log(res)
        return res.text();
    })
    .then(data =>{
        //console.log(data);
        console.log(data)
    //    students = JSON.parse(data);
    })
    .catch((error) => {
        console.log(error)
    })

</script>
<template>
    <p class="text-h1">Manage users</p>
</template>