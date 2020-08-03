<template lang='pug'>
  .box
    el-form(
      :action='changeAction'
      method='post'
      :model='user'
    )
      el-input.is-hidden(
        name='authenticity_token'
        v-model='user.authenticity_token'
      )
      el-form-item(label='user_type')
        el-select(
          v-model='user.type'
          name="user[type]"
        )
          el-option(
            v-for='(type, index) in types'
            :label='type'
            :value='type'
            :key='index'
          )
      el-form-item(label='username')
        el-input(
          :name="renameField('username')"
          v-model='user.username'
        )
      el-form-item(label='password')
        el-input(
          :name="renameField('password')"
          v-model='user.password'
        )
      button.el-button.el-button--primary.el-button--large(type='submit')
        span Iniciar Sesión
</template>

<script>
export default {
  props: {
    types: {
      type: Array,
      required: true
    }
  },
  data() {
    var csrfToken = $('meta[name="csrf-token"]').attr('content')
    return {
      user: {
        username: '',
        password: '',
        type: 'Student',
        authenticity_token: csrfToken,
        remember_me: false
      }
    }
  },
  computed: {
    changeAction() {
      return `/users/sign_in`
    }
  },
  methods: {
    renameField (field) {
      return `user[${field}]`
    }
  }
}
</script>
