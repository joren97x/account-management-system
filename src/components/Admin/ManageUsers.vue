<script setup>

    import { onMounted } from "vue";
    import {ref, reactive} from 'vue'

    const users = ref(null)
    const deleteUserDialog = ref(false)
    const editUserDialog = ref(false)
    const loading = ref(false)
    const showPassword = ref(false)
    const snackbarText =ref('')
    const snackbar = ref(false)

    getAllUsers()

    const updateUserForm = reactive({
        id: null,
        first_name: null,
        last_name: null,
        department: null,
        email: null,
        password: null,
        role: null
    })

    const deleteUserForm = reactive({
        id: null,
        first_name: null,
        last_name: null
    })

    function showEditUserDialog(selectedUser) {
        updateUserForm.id = selectedUser.id
        updateUserForm.first_name = selectedUser.first_name
        updateUserForm.last_name = selectedUser.last_name
        updateUserForm.department = selectedUser.department
        updateUserForm.email = selectedUser.email
        updateUserForm.role = selectedUser.role
        updateUserForm.password = selectedUser.password
        editUserDialog.value = true
    }

    function showDeleteUserDialog(selectedUser) {
        deleteUserForm.id = selectedUser.id
        deleteUserForm.first_name = selectedUser.first_name
        deleteUserForm.last_name = selectedUser.last_name
        deleteUserDialog.value = true
    }


    function getAllUsers() {
        let data = new FormData();
        data.append('method','getAllStudents')
        fetch('http://localhost/account-management-system-master/backend/index.php',
            {
                method:'POST',
                body:data
            }
        )
        .then(res =>{
            return res.text();
        })
        .then(data =>{
            users.value = JSON.parse(data);
        })
    }

    function updateUser() {
        loading.value = true
        let data = new FormData();
        data.append('method', 'updateUser');
        data.append('id', updateUserForm.id)
        data.append('first_name', updateUserForm.first_name)
        data.append('last_name', updateUserForm.last_name)
        data.append('email', updateUserForm.email)
        data.append('department', updateUserForm.department)
        data.append('role', updateUserForm.role)
        data.append('password', updateUserForm.password)

        fetch(`http://localhost/account-management-system-master/backend/index.php`,
        {
            method: 'POST',
            body: data,
        })
        .then(() => {
            getAllUsers()
            editUserDialog.value = false
            loading.value = false
            snackbarText.value = "User updated successfully"
            snackbar.value = true
        })
        .catch((error) => {
            editUserDialog.value = false
            loading.value = false
        })
    }

    function deleteUser() {
        loading.value = true
        let data = new FormData();
        data.append('method', 'deleteUser');
        data.append('id', deleteUserForm.id)

        fetch(`http://localhost/account-management-system-master/backend/index.php`,
        {
            method: 'POST',
            body: data,
        })
        .then(() => {
            getAllUsers()
            deleteUserDialog.value = false
            loading.value = false
            snackbarText.value = "User deleted successfully"
            snackbar.value = true
        })
        .catch((error) => {
            deleteUserDialog.value = false
            loading.value = false
        })
    }

    const headers = [
        {title: "ID", align: "start", key: "id", value: "id"},
        {title: "First name", align: "start", key: "fname", value: "fname"},
        {title: "Last name", align: "start", key: "lname", value: "lname"},
        {title: "Email", align: "start", key: "email", value: "email"},
        {title: "Department", align: "start", key: "department", value: "department"},
        {title: "Role", align: "start", key: "role", value: "role"},
        {title: "Actions", align: "start", key: "Actions", value: "Actions"},
    ]

</script>
<template>
    <p class="text-h4 text-center bg-white py-2">User management</p>
    <v-divider/>
    <v-data-table :items="users" :headers="headers" v-if="users" class="mb-5">
        <template v-slot:item="{item}">
            <tr>
                <td>{{ item.id }}</td>
                <td>{{ item.first_name }}</td>
                <td>{{ item.last_name }}</td>
                <td>{{ item.email }}</td>
                <td>{{ item.department }}</td>
                <td>{{ item.role }}</td>
                <td>
                    <v-btn class="me-3" @click="showEditUserDialog(item)" color="blue" prepend-icon="mdi-square-edit-outline">Edit</v-btn>
                    <v-btn color="red" @click="showDeleteUserDialog(item)" prepend-icon="mdi-delete-empty-outline">Delete</v-btn>
                </td>
            </tr>
        </template>
    </v-data-table>

    <v-dialog v-model="editUserDialog" width="80%">
        <v-card title="Edit user">
            <v-card-text>
                <v-row>
                    <v-col cols="6">
                        <v-text-field label="First name" v-model="updateUserForm.first_name" name="first_name"></v-text-field>
                    </v-col>
                    <v-col cols="6">
                        <v-text-field label="Last name" v-model="updateUserForm.last_name" name="last_name"></v-text-field>
                    </v-col>
                </v-row>
                <v-text-field label="Email" v-model="updateUserForm.email" name="email"></v-text-field>
         
                <v-row>
                    <v-col cols="6">
                        <v-select :items="['BSIT', 'BEED', 'BSED', 'BSHM']" v-model="updateUserForm.department" name="department" label="Department"></v-select>
                    </v-col>
                    <v-col cols="6">
                        <v-select :items="['Student', 'Admin']" v-model="updateUserForm.role" name="role" label="Role"></v-select>
                    </v-col>
                </v-row>

                <v-text-field label="Password" v-model="updateUserForm.password" :type="showPassword ? '' : 'password'" name="password">
                    <template v-slot:append-inner>
                        <v-btn size="small" variant="text" :icon="showPassword ? 'mdi-eye-outline' : 'mdi-eye-off-outline'" @click="showPassword = !showPassword"></v-btn>
                    </template>
                </v-text-field>
            </v-card-text>
            <v-card-actions>
                <v-spacer/>
                <v-btn color="grey" @click="editUserDialog = false">Cancel</v-btn>
                <v-btn color="blue" @click="updateUser()" :loading="loading">Update</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>

    <v-dialog v-model="deleteUserDialog" width="auto">
        <v-card title="Delete user">
            <v-card-text>
                Are you sure you want to delete <strong>{{ deleteUserForm.first_name }} {{ deleteUserForm.last_name }}</strong>?
            </v-card-text>
            <v-card-actions>
                <v-spacer/>
                <v-btn color="grey" @click="deleteUserDialog = false">Cancel</v-btn>
                <v-btn color="red" @click="deleteUser()">Delete</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>

    <v-snackbar v-model="snackbar" color="green" timeout="2000" location="bottom left">
      {{ snackbarText }}
    </v-snackbar>

</template>