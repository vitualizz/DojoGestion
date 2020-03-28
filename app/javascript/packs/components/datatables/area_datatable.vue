<template lang='pug'>
  datatable(:api="api" :fields="fields" :custom_actions="actions")
</template>

<script>
  export default {
    props: {
      'api': String
    },
    data() {
      return {
        actions: {
          actions: [
            { name: "edit", remote: "true", modal: "true" },
            { name: "destroy", remote: "true", method: "destroy" }
          ]
        },
        fields: [
          {
            name: 'name',
            title: 'Nombre'
          },
          {
            name: 'created_at',
            title: 'Creado en:'
          },
          {
            name: '__slot:actions',
            title: 'Actions',
            titleClass: 'center aligned',
            dataClass: 'center aligned'
          }
        ]
      }
    }
  }
</script>
