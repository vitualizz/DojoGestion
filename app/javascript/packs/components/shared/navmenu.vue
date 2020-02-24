<template lang='pug'>
  sidebar-menu(:menu="menu")
</template>

<script>
  export default {
    props: ['username', 'navbar'],
    data() {
      return {
        isCollapsible: false,
        user: {
          username: this.username,
          type: this.type,
          avatar: {
            size: 'small',
            src: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
          }
        },
        menu: JSON.parse(this.navbar)
      }
    }
  }
</script>
