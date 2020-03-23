<template lang='pug'>
  sidebar-menu(:menu="menu", :collapsed="isCollapsible", @toggle-collapse='onToggleCollapse')
</template>

<script>
  export default {
    props: ['username', 'navbar'],
    data() {
      return {
        isCollapsible: Boolean,
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
    },
    created() {
      this.isCollapsible = localStorage.getItem('navbarCollapsed') == "true"
    },
    methods: {
      onToggleCollapse(collapsed) {
        localStorage.setItem('navbarCollapsed', collapsed)
      }
    }
  }
</script>
