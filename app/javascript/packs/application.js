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
import { Vuetable, VuetablePagination } from 'vuetable-2/dist/vuetable-2'

import "@fortawesome/fontawesome-free/js/fontawesome"

import 'element-ui/lib/theme-chalk/index.css'
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css'

import { Modal } from './functions/modals'

Vue.use(TurbolinksAdapter)
Vue.use(ElementUI)
Vue.use(VueSidebarMenu)

Vue.component("vuetable", Vuetable);
Vue.component("vuetable-pagination",  VuetablePagination);
Vue.component("vuetable-pagination-dropdown", Vuetable.VueTablePaginationDropDown);
Vue.component("vuetable-pagination-info", Vuetable.VueTablePaginationInfo);

components.keys().forEach((component) =>{
  name = component.match(/[\w-]+?(?=\.)/)[0]
  component = component.match(/\w.*$/)[0]
  Vue.component(name, () => import(`./components/${component}`))
})


$( document ).ready(function() {
  $('template').appendTo('body')

  window.app = new Vue({
    el: '#app'
  })
  Modal()
});
