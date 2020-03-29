require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

require("packs/functions/flash_messages")

const string = require("underscore.string");
const components = require.context("./components", true, /^\.\/.*\.(js|vue)$/);

import Vue from 'vue/dist/vue.esm'
import ElementUI from 'element-ui'
import TurbolinksAdapter from 'vue-turbolinks'
import VueSidebarMenu from 'vue-sidebar-menu'

import "@fortawesome/fontawesome-free/js/fontawesome"

import 'element-ui/lib/theme-chalk/index.css'
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css'

import { Modal } from './functions/modals'

Vue.use(TurbolinksAdapter)
Vue.use(ElementUI)
Vue.use(VueSidebarMenu)

components.keys().forEach((component) =>{
  name = component.match(/[\w-]+?(?=\.)/)[0]
  component = component.match(/\w.*$/)[0]
  Vue.component(name, () => import(`./components/${component}`))
})


$( document ).ready(function() {
  $('template').appendTo('body')

  new Vue({
    el: '#app'
  })

  Modal()
});
