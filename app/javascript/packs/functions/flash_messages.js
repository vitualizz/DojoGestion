import Vue from 'vue/dist/vue.esm'

window.flashMessage = function(messages) {
  if (messages.length == 0) { return }
  messages.forEach(function(msg) {
    Vue.prototype.$message({
      message: msg[1],
      type: msg[0],
      duration: 5000
    })
  })
}

window.flashCall = function(type, message) {
  Vue.prototype.$message({
    message: message,
    type: type,
    duration: 5000
  })
}
