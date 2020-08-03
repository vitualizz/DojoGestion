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
      menu: {
        type: Array,
        required: true
      }
    },
    data() {
      return {
        isCollapsible: Boolean
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
