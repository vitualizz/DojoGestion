<template lang='pug'>
  div
    nav.pagination.is-centered
      vuetable-pagination(ref="pagination" @vuetable-pagination:change-page="onChangePage" :css="css.pagination")
    vuetable(
      ref="vuetable"
      :api-url="api"
      :fields="fields"
      @vuetable:loaded="onLoaded"
      pagination-path=""
      @vuetable:pagination-data="onPaginationData"
    )
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
        controller: String,
        css: {
          pagination: {
            infoClass: 'pull-left',
            wrapperClass: 'vuetable-pagination pull-right',
            activeClass: 'is-current',
            disabledClass: 'disabled',
            pageClass: 'pagination-link',
            linkClass: 'pagination-link',
            icons: {
              first: '',
              prev: '',
              next: '',
              last: '',
            },
          }
        }
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
      },
      onPaginationData(paginationData) {
        window.err = paginationData
        window.asd = this.$refs
        console.log(this.$refs.pagination.setPaginationData(paginationData))
        this.$refs.pagination.setPaginationData(paginationData)
      },
      onChangePage(page) {
        this.$refs.vuetable.changePage(page)
      }
    }
  }
</script>
