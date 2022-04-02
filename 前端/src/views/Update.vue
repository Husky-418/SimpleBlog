<template>
  <div class="update">
    <img :src="imgSrc" width="100%" height="100%" alt="" />
    <div class="updatePart">
      <h2>用户信息修改</h2>
      <el-form ref="updateFormRef" :rules="updateRules" :model="updateForm">
        <el-form-item class="inputElement" prop="user_name">
          <el-input
            type="text"
            v-model="updateForm.user_name"
            placeholder="请输入用户名 "
          ></el-input>
        </el-form-item>
        <el-form-item class="inputElement" prop="user_password">
          <el-input
            type="text"
            v-model="updateForm.user_password"
            placeholder="请输入密码 "
            show-password
          ></el-input>
        </el-form-item>
        <el-form-item class="inputElement" prop="ruser_password">
          <el-input
            type="text"
            v-model="updateForm.ruser_password"
            placeholder="请再次输入密码 "
            show-password
          ></el-input>
        </el-form-item>
        <el-form-item class="inputElement" prop="user_email">
          <el-input
            type="text"
            v-model="updateForm.user_email"
            placeholder="请输入电子邮箱 "
          ></el-input>
        </el-form-item>
        <el-form-item prop="user_id" style="height:0px">
          <el-input type="hidden" v-model="updateForm.user_id"></el-input>
        </el-form-item>
        <div>
          <el-button type="primary" @click="updateUser">修改</el-button>
          <el-button type="info" @click="resetupdateForm">重置</el-button>
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
        if (this.updateForm.ruser_password !== "") {
          this.$refs.updateFormRef.validateField("ruser_password");
        }
        callback();
      }
    };
    var ruser_password = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.updateForm.user_password) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    var user_email = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入电子邮箱"));
      } else {
        if (value !== "") {
          var reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
          if (!reg.test(value)) {
            callback(new Error("请输入有效的邮箱"));
          }
        }
        callback();
      }
    };
    return {
      imgSrc: require("../assets/other.jpg"),
      updateForm: {
        user_name: "",
        user_password: "",
        ruser_password: "",
        user_email: "",
        user_id: "",
      },

      updateRules: {
        user_name: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 1,
            max: 16,
            message: "长度在 1 到 10 个字符",
            trigger: "blur",
          },
          { validator: user_name, trigger: "blur" },
        ],
        user_password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          {
            min: 6,
            max: 16,
            message: "长度在 6 到 10 个字符",
            trigger: "blur",
          },
          { validator: user_password, trigger: "blur" },
        ],
        ruser_password: [
          { required: true, message: "请再次输入密码", trigger: "blur" },
          {
            min: 6,
            max: 16,
            message: "长度在 6 到 10 个字符",
            trigger: "blur",
          },
          { validator: ruser_password, trigger: "blur" },
        ],
        user_email: [
          { required: true, message: "请输入电子邮箱", trigger: "change" },
          { validator: user_email, trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    updateUser() {
      var user = JSON.parse(sessionStorage.getItem("user"));
      this.updateForm.user_id = user.user_id + "";
      console.log(this.updateForm.user_id);
      this.$refs.updateFormRef.validate(async (valid) => {
        if (!valid) return;
        const { data: res } = await this.$http.post("update", this.updateForm);
        if (res.flag == "success") {
          // window.sessionStorage.setItem("user",res.us);
          this.$message.success("修改成功！请重新登录!");
          this.$router.push({ path: "/login" });
          // sessionStorage.clear();
        } else {
          this.$message.error("修改失败！");
          // this.$router.push({path:"/update"});
        }
      });
    },
    resetupdateForm() {
      this.$refs.updateFormRef.resetFields();
      console.log("111");
    },
  },
};
</script>

<style lang="less" scope="">
.updatePart {
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
.updatePart h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
  /*文字居中*/
}
.updatePart .inputbox {
  position: relative;
}
.updatePart .inputElement input {
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
.update {
  width: 100%;
  height: 100%;
}
</style>
