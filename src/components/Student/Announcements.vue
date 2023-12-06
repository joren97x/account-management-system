<script setup>

    import {ref} from 'vue'
    const tab = ref(null)
  
</script>

<template>
    
    <v-card>
        <v-tabs v-model="tab" color="deep-purple-accent-4" align-tabs="center">
            <v-tab :value="1">Announcements</v-tab>
        </v-tabs>
        <v-window v-model="tab">
            <v-window-item>
                <v-container fluid>
                    <v-row>
                        <v-col v-for="i in 6" :key="i" cols="12" md="4">
                            <v-card>
                                <v-img
                                :src="`https://picsum.photos/500/300?image=${i * (i + 2) * 5 + 10}`"
                                :lazy-src="`https://picsum.photos/10/6?image=${i * (i + 2) * 5 + 10}`"
                                cover
                                ></v-img>
                                <v-card-title>
                                    Announcement title
                                </v-card-title>
                                <v-card-subtitle>
                                    <v-icon>mdi-circle-medium</v-icon>
                                    December {{ i }}, 2023
                                </v-card-subtitle>
                                <v-card-text>
                                    Lorem ipsum dolor sit amet consectetur adipisicing.
                                </v-card-text>
                            </v-card>
                        </v-col>
                    </v-row>
                </v-container>
            </v-window-item>
        </v-window>
  </v-card>

</template>