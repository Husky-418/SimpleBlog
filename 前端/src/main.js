import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './plugins/element.js'
import axios from 'axios'
// import './assets/font/font1/iconfont.css'

Vue.prototype.$http = axios

axios.defaults.baseURL = "http://localhost:8888"

Vue.config.productionTip = false

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')