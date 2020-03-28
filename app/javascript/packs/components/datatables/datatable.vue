<template lang='pug'>
  vuetable( :api-url="api" :fields="fields" @vuetable:loaded="onLoaded" )
    template(slot="actions" scope="props")
      .custom-actions
        a(v-for="(action, index) in c_actions" :data-modal='action.modal' :data-remote='action.remote' :href="getActionHref(props.rowData.id, action.name)" :data-method="getActionMethod(action)").ui.basic.button
          i( v-if="action.name === 'edit'").el-icon-edit
          i( v-else-if="action.name === 'destroy'").el-icon-delete
          i( v-else, :class="action.icon" )
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
        c_actions: Array,
        controller: String
      }
    },
    created() {
      if(!!this.custom_actions) {
        this.controller = this.custom_actions.controller || this.api.slice(0, -5)
        this.c_actions = this.custom_actions.actions
      }
    },
    methods: {
      getActionHref(id, action) {
        var path = (this.controller + '/' + id)
        if(action === "destroy") { return path }
        return path + '/' + action
      },
      getActionMethod(action) {
        if(action.name === "destroy" ) { return "delete"}
        return action.method
      },
      onLoaded() {
        Modal()
      }
    }
  }
</script>
