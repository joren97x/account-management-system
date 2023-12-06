<script setup>

    import {ref, reactive} from 'vue'
    const createAccouncementDialog = ref(false)

    const announcementForm = reactive({
        title: null,
        description: null,
    })



</script>



<template>
    <v-layout>
        <v-app-bar color="teal-darken-4" image="https://picsum.photos/1920/1080?random">
            <template v-slot:image>
                <v-img gradient="to top right, rgba(19,84,122,.8), rgba(128,208,199,.8)"></v-img>
            </template>

            <v-app-bar-title>Lorem ipsum</v-app-bar-title>
            <v-spacer></v-spacer>

            <v-btn @click="createAccouncementDialog = true" prepend-icon="mdi-plus">
                New announcement
            </v-btn>

            <router-link to="/admin/dashboard">
                <v-btn color="white" prepend-icon="mdi-view-dashboard-outline">
                    Dashboard
                </v-btn>
            </router-link>

            <router-link to="/admin/manage-users">
                <v-btn color="white" prepend-icon="mdi-account-supervisor-outline">
                    Manage users
                </v-btn>
            </router-link>

            <router-link to="#">
                <v-btn color="red" prepend-icon="mdi-logout">
                    Logout
                </v-btn>
            </router-link>
            
        </v-app-bar>

        <v-main>
            <v-container>
                <slot/>
            </v-container>
        </v-main>
    </v-layout>

    <v-dialog v-model="createAccouncementDialog" width="80%">
        <v-card title="New announcement">
            <v-card-text>
                <v-text-field label="Title"></v-text-field>
                <v-textarea label="Description"></v-textarea>
            </v-card-text>
            <v-card-actions>
                <v-spacer/>
                <v-btn color="grey" @click="createAccouncementDialog = false">Cancel</v-btn>
                <v-btn color="green">Add</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>

</template>

<style scoped>

    .link {
        text-decoration: none;
    }

</style>
