<script setup>

    import {ref} from 'vue'
    const tab = ref(null)

</script>

<template>
    
    <v-card>
        <v-tabs v-model="tab" color="deep-purple-accent-4" align-tabs="center">
            <v-tab :value="1">General</v-tab>
            <v-tab :value="2">BSIT</v-tab>
        </v-tabs>
        <v-window v-model="tab">
            <v-window-item v-for="n in 2" :key="n" :value="n">
                <v-container fluid>
                    <v-row>
                        <v-col v-for="i in 6" :key="i" cols="12" md="4">
                            <v-card>
                                <v-img
                                :src="`https://picsum.photos/500/300?image=${i * n * 5 + 10}`"
                                :lazy-src="`https://picsum.photos/10/6?image=${i * n * 5 + 10}`"
                                cover
                                ></v-img>
                                <v-card-title>
                                    Top western road trips
                                </v-card-title>
                                <v-card-subtitle>
                                    <v-icon>mdi-circle-medium</v-icon>
                                    Dec {{ n }} 2023
                                </v-card-subtitle>
                                <v-card-text>
                                    Lorem ipsum dolor sit amet consectetur adipisicing.
                                </v-card-text>
                                <v-card-actions>
                                    <v-spacer/>
                                    <v-btn append-icon="mdi-chevron-right">More info</v-btn>
                                </v-card-actions>
                            </v-card>
                        </v-col>
                    </v-row>
                </v-container>
            </v-window-item>
        </v-window>
  </v-card>

</template>