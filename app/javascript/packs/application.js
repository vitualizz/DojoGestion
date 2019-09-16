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
  component = component.match(/\w[\w.]+$/)
  name = component[0].match(/^\w*/)[0]
  Vue.component(name, () => import(`${component.input}`))
})


document.addEventListener('turbolinks:load', () => {
  $('template').appendTo('body')
  new Vue({
    el: '#app'
  })
})

