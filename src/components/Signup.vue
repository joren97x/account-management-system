<script setup>


</script>

<template>
    
    <v-card title="Sign up" width="69%">
        <v-card-item>
            <v-row>
                <v-col cols="6">
                    <v-text-field label="First name"></v-text-field>
                </v-col>
                <v-col cols="6">
                    <v-text-field label="Last name"></v-text-field>
                </v-col>
            </v-row>
            <v-text-field label="Email"></v-text-field>
            <v-select :items="['BSIT', 'BEED', 'BSED', 'BSHM']" label="Department"></v-select>
            <v-text-field label="Password"></v-text-field>
                
        </v-card-item>
        <v-card-actions>
            <v-btn>Sign up</v-btn>
        </v-card-actions>
    </v-card>

</template>