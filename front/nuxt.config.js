
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
    '@nuxtjs/apollo'
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
		proxy: true
	},
  proxy: {
    '/api/': { target: 'http://back:3000', pathRewrite: { '^/api/': '/' } }
  },
  apollo: {
    clientConfigs: {
      default: {
        httpEndpoint: 'http://localhost:3000/graphql',
				httpLinkOptions: {
          fetchOptions: {
            mode: 'cors' //Cors Needed for external Cross origins, need to allow headers from server
          },
          credentials: "omit" //must be omit to support application/json content type
        }
      }
    }
  },
}
