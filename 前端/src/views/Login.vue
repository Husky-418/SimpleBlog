<template>
  <div class="login">
    <img :src="imgSrc" width="100%" height="100%" alt="" />
    <div class="loginPart">
      <h2>用户登录</h2>
      <el-form ref="loginFormRef" :rules="loginRules" :model="loginForm">
        <el-form-item class="inputElement" prop="user_name">
          <el-input
            type="text"
            v-model="loginForm.user_name"
            placeholder="请输入用户名 "
          ></el-input>
        </el-form-item>
        <el-form-item class="inputElement" prop="user_password">
          <el-input
            type="text"
            v-model="loginForm.user_password"
            placeholder="请输入密码 "
            show-password
            ref="user_password"
          ></el-input>
        </el-form-item>
        <div>
          <el-button type="primary" @click="login" @keyup.enter="login"
            >登录</el-button
          >
        </div>
        <div style="text-align: right; color: white">
          <router-link to="/register">
            <el-link type="warning">没有账号？去注册</el-link>
          </router-link>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    var user_name = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入用户名"));
      } else {
        callback();
      }
    };
    var user_password = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        callback();
      }
    };
    return {
      imgSrc: require("../assets/login.jpg"),

      loginForm: {
        user_name: "",
        user_password: "",
      },

      loginRules: {
        user_name: [
          { require: true, message: "请输入用户名", trigle: "blur" },
          { min: 1, max: 10, message: "长度1到10个字符", trigle: "blur" },
          { validator: user_name, trigger: "blur" },
        ],
        user_password: [
          { required: true, message: "请输入密码", trigle: "blur" },
          { min: 6, max: 10, message: "长度在6到10个字符", trigle: "blur" },
          { validator: user_password, trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    login() {
      this.$refs.loginFormRef.validate(async (valid) => {
        if (!valid) return;
        const { data: res } = await this.$http.post("login", this.loginForm);
        console.log(this.loginForm);
        if (res.flag == "success") {
          sessionStorage.setItem("user", JSON.stringify(res.user));
          this.$message({
            message: "登录成功！",
            type: "success",
            duration: 0.5 * 1000,
          });
          if (
            res.user.user_name == "admin" &&
            res.user.user_password == "123456"
          ) {
            this.$router.push({ path: "/manage" });
          } else {
            this.$router.push({ path: "/home" });
          }
          console.log(res.user);
        } else {
          this.$message({
            message: "账号或密码错误！",
            type: "warning",
            duration: 0.5 * 1000,
          });
        }
      });
    },
    keyDown(e) {
      if (e.keyCode == 13) this.login();
    },
  },
  mounted() {
    // 绑定监听事件
    window.addEventListener("keydown", this.keyDown);
  },
  destroyed() {
    // 销毁事件
    window.removeEventListener("keydown", this.keyDown, false);
  },
};
</script>

<style lang="less" scope="">
.loginPart {
  position: absolute;
  /*定位方式绝对定位absolute*/
  top: 50%;
  left: 50%;
  /*顶和高同时设置50%实现的是同时水平垂直居中效果*/
  transform: translate(-50%, -50%);
  /*实现块元素百分比下居中*/
  width: 450px;
  padding: 50px;
  background: rgba(0, 0, 0, 0.5);
  /*背景颜色为黑色，透明度为0.8*/
  box-sizing: border-box;
  /*box-sizing设置盒子模型的解析模式为怪异盒模型，
    将border和padding划归到width范围内*/
  box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
  /*边框阴影  水平阴影0 垂直阴影15px 模糊25px 颜色黑色透明度0.5*/
  border-radius: 15px;
  /*边框圆角，四个角均为15px*/
}
.loginPart .inputbox {
  position: relative;
}
.loginPart .inputElement input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  letter-spacing: 1px;
  /*字符间的间距1px*/
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  /*outline用于绘制元素周围的线
    outline：none在这里用途是将输入框的边框的线条使其消失*/
  background: transparent;
  /*背景颜色为透明*/
}
.login {
  width: 100%;
  height: 100%;
}
</style>
