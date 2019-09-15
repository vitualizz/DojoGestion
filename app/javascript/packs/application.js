require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

const string = require("underscore.string");
const components = require.context("./components", true, /^\.\/.*\.js$/);

import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

components.keys().forEach((component) =>{
  component = component.match(/\w[\w.]+$/)[0]
  name = component.match(/^\w*/)[0]
  Vue.component(name, () => import(`./components/${component}`))
})

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: '#app'
  })
})

