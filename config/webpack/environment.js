const { environment } = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')
const datatables = require('./loaders/datatables')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const pug = require('./loaders/pug')
const eslint = require('./loaders/eslint')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('pug', pug)
environment.loaders.prepend('coffee', coffee)
environment.loaders.prepend('eslint', eslint)
environment.loaders.append('datatables', datatables)
module.exports = environment
