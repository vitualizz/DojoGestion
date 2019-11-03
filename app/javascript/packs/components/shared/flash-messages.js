module.exports = {
  props: ['level', 'msg'],
  created() {
    if (this.level == "alert") { this.level = "error"}
    this.$message({
      message: this.msg,
      type: this.level,
      duration: 5000
    })
  }
}
