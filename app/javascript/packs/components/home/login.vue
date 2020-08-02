<template lang='pug'>
  .box
    el-form(
      :action='changeAction'
      method='post'
      v-model='user'
    )
      el-input.is-hidden(
        name='authenticity_token'
        v-model='authenticity_token'
      )
      el-select(v-model='user.type')
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
        type: 'teacher',
        authenticity_token: csrfToken,
        remember_me: false
      }
    }
  },
  computed: {
    changeAction() {
      return `/${this.user.type}s/sign_in`
    }
  },
  methods: {
    renameField (field) {
      return `${this.user.type}[${field}]`
    }
  }
}
</script>
