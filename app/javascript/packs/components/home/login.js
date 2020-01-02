module.exports = {
  template: '#login',
  data() {
    return {
      username: '',
      password: '',
      user_type: 'teacher',
      remember_me: false
    }
  },
  computed: {
    changeAction() {
      return `/${this.user_type}s/sign_in`
    }
  },
  methods: {
    reloadField(field) {
      return `${this.user_type}[${field}]`
    }
  }
}
