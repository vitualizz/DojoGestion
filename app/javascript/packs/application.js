require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

const string = require("underscore.string");
const components = require.context("./components", true, /^\.\/.*\.js$/);

import Vue from 'vue/dist/vue.esm'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)
Vue.use(ElementUI)

components.keys().forEach((component) =>{
  name = component.match(/[\w-]+?(?=\.)/)[0]
  component = component.match(/\w.*$/)[0]
  Vue.component(name, () => import(`./components/${component}`))
})


document.addEventListener('turbolinks:load', () => {
  $('template').appendTo('body')
  new Vue({
    el: '#app'
  })
})

