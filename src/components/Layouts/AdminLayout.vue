<script setup>

    import {ref} from 'vue'
    const createAccouncementDialog = ref(false)

</script>



<template>
    <v-layout>
        <v-app-bar color="teal-darken-4" image="https://picsum.photos/1920/1080?random">
            <template v-slot:image>
                <v-img gradient="to top right, rgba(19,84,122,.8), rgba(128,208,199,.8)"></v-img>
            </template>

            <v-app-bar-title>CPC</v-app-bar-title>
            <v-spacer></v-spacer>

            <router-link to="/admin/dashboard">
                <v-btn color="white">
                    Dashboard
                </v-btn>
            </router-link>

            <router-link to="/admin/manage-users">
                <v-btn color="white">
                    Manage users
                </v-btn>
            </router-link>

            <v-btn @click="createAccouncementDialog = true" prepend-icon="mdi-bullhorn">
                New announcement
            </v-btn>
            
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
                <v-file-input label="Announcement image"></v-file-input>
                <v-text-field label="Title"></v-text-field>
                <v-textarea label="Description"></v-textarea>
            </v-card-text>
            <v-card-actions>
                <v-spacer/>
                <v-btn color="grey" @click="createAccouncementDialog = false">Close Dialog</v-btn>
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
