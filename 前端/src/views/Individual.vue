<template>
  <div class="individual">
    <img :src="imgSrc" width="100%" height="100%" alt="" />
    <div class="block9">
      <div>
        <img class="tou2" src="../assets/tou.png" alt />
      </div>
      <div class="name">
        昵称：
        <h1 color="white">{{ this.name }}</h1>
      </div>
      <div class="email">
        email：
        <h1 color="white">{{ this.email }}</h1>
      </div>
      <div class="id">
        id：
        <h1 color="white">{{ this.id }}</h1>
      </div>
      <button class="updatebtn" @click="update()">修改信息</button>
      <el-upload
        class="avatar-uploader"
        action="https://jsonplaceholder.typicode.com/posts/"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload"
      >
        <img v-if="imageUrl" :src="imageUrl" class="avatar" />
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      imgSrc: require("../assets/home.jpg"),
      imageUrl: "",
      name: "",
      id: "",
    };
  },
  mounted: function() {
    this.getUser();
  },

  methods: {
    async getUser() {
      var user = JSON.parse(sessionStorage.getItem("user"));
      this.name = user.user_name;
      this.email = user.user_email;
      this.id = user.user_id;
      //   console.log(this.name);
    },

    update() {
      this.$router.push({ path: "/update" });
    },

    handleAvatarSuccess(res, file) {
      console.log(上传成功);
      this.imageUrl = URL.createObjectURL(file.raw);
      console.log(file.raw);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
  },
};
</script>

<style lang="less" scope="">
.tou2 {
  margin-top: -2%;
  position: fixed;
  width: 120px;
  height: 120px;
  left: 50px;
  top: 50px;
  border-radius: 100%;
}
.block9 {
  position: absolute;
  width: 70%;
  height: 350px;
  top: 50%;
  left: 50%;
  // margin-top: 10%;
  // margin-left: 15%;
  transform: translate(-50%, -50%);
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.5);
  box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
  /*box-sizing设置盒子模型的解析模式为怪异盒模型，
    将border和padding划归到width范围内*/
  //box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
  /*边框阴影  水平阴影0 垂直阴影15px 模糊25px 颜色黑色透明度0.5*/
  border-radius: 15px;
  /*边框圆角，四个角均为15px*/
}
.Img {
  width: 100%;
  height: 100%;
  border-radius: 15px;
}
.name {
  // position: absolute;
  margin-top: 3%;
  margin-left: 25%;
  color: gray;
}
.email {
  // position: absolute;
  margin-top: 3%;
  margin-left: 25%;
  color: gray;
}
.id {
  // position: absolute;
  margin-top: 3%;
  margin-left: 25%;
  color: gray;
}
.updatebtn {
  float: left;
  margin-top: -20%;
  margin-left: 8%;
  border: none;
  background: rgba(0, 0, 0, 0);
  color: aquamarine;
  // size: 2px;
  height: 40px;
  width: 80px;
  cursor: pointer;
}
.individual {
  position: absolute;
  width: 100%;
  height: 100%;
}
</style>

<style>
.search input.el-input__inner {
  border-radius: 15px;
  width: 100%;
}
.avatar-uploader .el-upload {
  border: 1px dashed #05316e;
  border-radius: 0px;
  cursor: pointer;
  position: absolute;
  overflow: hidden;
  margin-top: -22%;
  margin-left: 100px;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 10px;
  color: #1660c9;
  width: 20px;
  height: 15px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
