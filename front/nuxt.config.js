
export default {
  mode: 'universal',
  /*
  ** Headers of the page
  */
  head: {
    title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: process.env.npm_package_description || '' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },
  /*
  ** Global CSS
  */
  css: [
  ],
  /*
  ** Plugins to load before mounting the App
  */
  plugins: [
		'plugins/axios'
  ],
  /*
  ** Nuxt.js dev-modules
  */
  buildModules: [
  ],
  /*
  ** Nuxt.js modules
  */
  modules: [
		'@nuxtjs/axios',
		'@nuxtjs/vuetify',
    '@nuxtjs/apollo',
    '@nuxtjs/auth'
  ],
  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend (config, ctx) {
    }
  },
	watchers: {
    webpack: {
      poll: true
    }
  },
	axios: {
    // proxy: true,
    host: 'localhost',
    port: 3000,
	},
  proxy: {
    // '/api/': { target: 'http://back:3000', pathRewrite: { '^/api/': '/' } }
  },
  auth: {
    strategies: {
      local: {
        endpoints: {
          login: { url: 'user_token', method: 'post', propertyName: 'jwt' },
          user: false,
          logout: false
        }
      }
    }
  },
  apollo: {
    clientConfigs: {
      default: {
        httpEndpoint: 'http://localhost:3000/graphql',
        getAuth: () => ''
      }
    }
  },
}
