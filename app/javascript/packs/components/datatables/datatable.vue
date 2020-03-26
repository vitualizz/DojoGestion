<template lang='pug'>
  vuetable(:api-url="api" :fields="fields" @vuetable:loaded="onLoaded")
    template(slot="actions" scope="props")
      .custom-actions
        a(v-for="(action, index) in c_actions" :data-modal='action.modal' :data-remote='action.remote' :href="getHref(props.rowData.id, action.action)" )
          i.delete.icon
</template>

<script>
  import { Modal } from '../../functions/modals'
  export default {
    props: {
      'api': String,
      'fields': Array,
      'custom_actions': Object
    },
    data() {
      return {
        c_actions: this.custom_actions.actions,
        controller: this.custom_actions.controller
      }
    },
    methods: {
      getHref(id, action) {
        return this.controller + '/' + id + '/' + action
      },
      onLoaded() {
        Modal()
      }
    }
  }
</script>
