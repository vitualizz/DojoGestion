require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

const string = require("underscore.string");
const components = require.context("./components", true, /^\.\/.*\.(js|vue)$/);

import Vue from 'vue/dist/vue.esm'
import ElementUI from 'element-ui'
import TurbolinksAdapter from 'vue-turbolinks'
import VueSidebarMenu from 'vue-sidebar-menu'
import VueRouter from 'vue-router'

import 'element-ui/lib/theme-chalk/index.css'
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css'

Vue.use(TurbolinksAdapter)
Vue.use(ElementUI)
Vue.use(VueSidebarMenu)
Vue.use(VueRouter)


components.keys().forEach((component) =>{
  name = component.match(/[\w-]+?(?=\.)/)[0]
  component = component.match(/\w.*$/)[0]
  Vue.component(name, () => import(`./components/${component}`))
})

const Foo = { template: '#home_index' }
const Bar = { template: '#qualifications_index' }

const routes = [
  { path: '/', component: Foo },
  { path: '/qualifications', component: Bar }
]

const router = new VueRouter({
  mode: 'history',
  routes
})

document.addEventListener('turbolinks:load', () => {
  $('template').appendTo('body')
$('a').bind('click', function (event) {
    $('body template').load(window.location.href)
    console.log('FOO!');
  });


  new Vue({
    el: '#app',
    router
  })

  //$("a").click(function(){
    //$('template').load(window.location.href)
  //});

})

