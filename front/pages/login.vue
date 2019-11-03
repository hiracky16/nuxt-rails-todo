<template>
  <v-container>
    <v-row>
      <v-col cols="6" offset="3">
        <v-card>
          <v-card-title>Login</v-card-title>
          <v-card-text>
            <v-form>
              <v-container>
                <v-row>
                  <v-col cols="6">
                    <v-text-field v-model="email" label="Email" required />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="6">
                    <v-text-field v-model="password" type="password" label="Password" required />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col>
                    <v-btn @click="login()">
                      Login
                    </v-btn>
                  </v-col>
                </v-row>
              </v-container>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  middleware({ store, redirect }) {
    console.log(store.state.auth.loggedIn)
    if (store.state.auth.loggedIn) {
      return redirect('/')
    }
  },
  data() {
    return {
      email: '',
      password: ''
    }
  },
  methods: {
    async login() {
      try {
        await this.$auth.loginWith('local', {
          data: {
            auth: {
              email: this.email,
              password: this.password
            }
          }
        })
        await this.$apolloHelpers.onLogin(this.$auth.getToken('local').match(/^Bearer[ ]+([^ ]+)[ ]*$/i)[1])
        this.$router.push('/')
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>