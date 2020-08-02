<template lang='pug'>
  sidebar-menu(:menu="menu", :collapsed="isCollapsible", @toggle-collapse='onToggleCollapse')
</template>

<script>
  export default {
    props: {
      user: {
        type: Object,
        required: true
      },
      navbar: {
        type: Object,
        required: true
      }
    },
    data() {
      return {
        isCollapsible: Boolean,
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
