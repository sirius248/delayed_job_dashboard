import Vue from 'vue'
import App from './App.vue'

new Vue({
  el: '#main',
  render: h => h(App)
})

const xinchao = () => {
  console.log("xin chao")
}

xinchao();
