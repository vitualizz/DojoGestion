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
          controller: '/settings/areas',
          actions: [
            { action: "edit", remote: "true", modal: "true" }
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
