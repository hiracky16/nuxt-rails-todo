<template>
  <v-app>
    <v-toolbar fixed>
      <v-toolbar-title v-text="title" />
      <div class="flex-grow-1" />
      <span v-if="loggedIn" @click="logout()">Logout</span>
    </v-toolbar>
    <v-content>
      <nuxt />
    </v-content>
    <v-footer center>
      <v-layout justify-center>
        <span>&copy; 2019 Noriaki Hiraki. All Rights Reserved.</span>
      </v-layout>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      title: 'AKB Test'
    }
  },
  computed: {
    loggedIn() {
      return this.$auth.loggedIn
    }
  },
  methods: {
    async logout() {
      try {
        await this.$auth.logout()
        await this.$apolloHelpers.onLogout()
        this.$router.push('/login')
      } catch (e) {
        window.console.log(e)
      }
    }
  }
}
</script>
