import Vue from 'vue'
import VueResource from 'vue-resource'
import ElementUI from 'element-ui'
import App from './App.vue'
import 'element-ui/lib/theme-default/index.css'

Vue.use(ElementUI)
Vue.use(VueResource)

new Vue({
  el: '#main',
  render: h => h(App)
})
