<template lang='pug'>
  #main_menu
    el-menu(collapse=false)
      el-menu-item
        i.el-icon-s-unfold
      el-menu-item(index='1')
        el-avatar(size: "user.avatar.size", ":src"="user.avatar.src")
        span(slot="title") {{ user.username }}
      el-menu-item(index='2')
        i.el-icon-notebook-2
        span(slot="title") Notas
</template>

<script>
  export default {
    props: ['username'],
    data() {
      return {
        user: {
          username: this.username,
          type: this.type,
          avatar: {
            size: 'small',
            src: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
          }
        }
      }
    }
  }
</script>
