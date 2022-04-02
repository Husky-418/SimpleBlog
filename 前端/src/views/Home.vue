<template>
  <div>
    <div style="position: relative">
      <div class="block1">
        <el-carousel height="300px" class="lun" interval="5000" autoplay="true">
          <el-carousel-item v-for="item in imgArray" :key="item">
            <!-- <h3 class="small">{{ item }}</h3> -->
            <img :src="item" class="Img" />
          </el-carousel-item>
        </el-carousel>
      </div>
      <div class="block2">
        <h3>大神博主</h3>
        <div v-for="item of userList" :key="item" class="users">
          <img src="../assets/tou.png" class="tou3" />
          <div class="writer">
            <div>id: {{ item.user_id }}</div>
            <div>name: {{ item.user_name }}</div>
            <div>email: {{ item.user_email }}</div>
          </div>
        </div>
      </div>
      <div class="block">
        <div
          v-for="(item, index) of articleList"
          :key="index"
          class="block3"
          @click="toBlogger(item.article_id)"
        >
          <div>
            <h2>
              <span class="title">{{ item.article_title }}</span>
            </h2>
            <div class="content">{{ item.article_content }}</div>
          </div>
          <div class="from">
            from: {{ users[index].user_name }}&nbsp;&nbsp;&nbsp;&nbsp; date:
            {{ item.article_date | formatDate }}&nbsp;&nbsp;&nbsp;&nbsp; view:
            {{ item.article_views }}&nbsp;&nbsp;&nbsp;&nbsp; like:
            {{ item.article_like_count }}
          </div>
          <div class="line"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { formatDate } from "../views/date.js";
export default {
  filters: {
    formatDate(time) {
      var date = new Date(time);
      return formatDate(date, "yyyy-MM-dd hh:mm");
    },
  },
  data() {
    return {
      articleList: [],
      imgArray: [
        require("../assets/login.jpg"),
        require("../assets/register.jpg"),
        require("../assets/home.jpg"),
        require("../assets/other.jpg"),
        require("../assets/keqing.jpg"),
      ],
    };
  },
  mounted: function() {
    this.getArticleList();
  },
  methods: {
    async getArticleList() {
      const { data: res } = await this.$http.post("articles");
      const { data: re } = await this.$http.post("showUsers");
      if (res.flag == "error") this.$message.error("获取资源失败！");
      this.articleList = res.articles;
      this.users = res.users; //文章的作者和
      this.userList = re.users;
      // const {data:res}=await this.$http.post("individual",)
      console.log(res);
    },

    toBlogger(id) {
      //console.log(id);
      this.$router.push({
        path: "/blogger/:id",
        name: "资源列表",
        params: { id },
      });
    },
  },
};
</script>

<style lang="less" scope="">
.lun {
  position: absolute;
  margin-left: 15px;
  margin-top: 15px;
  width: 96.5%;
  box-sizing: border-box;
  border-radius: 15px;
  /*box-sizing设置盒子模型的解析模式为怪异盒模型，
    将border和padding划归到width范围内*/
  box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
  /*边框阴影  水平阴影0 垂直阴影15px 模糊25px 颜色黑色透明度0.5*/
}
.block1 {
  position: absolute;
  width: 70%;
  height: 330px;
  overflow: auto;
  margin-top: 6.5%;
  margin-left: 2.5%;
  // transform: translate(2%, 2%);
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
.block2 {
  position: absolute;
  width: 22%;
  height: auto;
  // overflow:auto;
  margin-top: 6.5%;
  margin-left: 75%;
  padding-top: 1px;
  // transform: translate(2%, 2%);
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.5);
  box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
  /*box-sizing设置盒子模型的解析模式为怪异盒模型，
    将border和padding划归到width范围内*/
  //box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
  /*边框阴影  水平阴影0 垂直阴影15px 模糊25px 颜色黑色透明度0.5*/
  border-radius: 15px;
  /*边框圆角，四个角均为15px*/
  text-align: center;
}
.Img {
  width: 100%;
  height: 100%;
  border-radius: 15px;
}
.title {
  text-overflow: ellipsis;
  overflow: hidden;
  width: 850px;
  height: 30px;
  margin-left: 15px;
  margin-right: 15px;
  padding-top: 1%;
  display: -webkit-box;
  //white-space: nowrap;
  text-overflow: ellipsis;
  //-webkit-box-orient:vertical;
}
.content {
  // margin-top: 0px;
  overflow: hidden;
  height: 40px;
  margin-left: 15px;
  margin-right: 15px;
  margin-bottom: 10px;
  display: -webkit-box;
  text-overflow: ellipsis; //溢出用省略号显示
  color: rgb(183, 177, 168);
}
.line {
  //float:right;
  width: 95%;
  height: 1px;
  margin-top: 15px;
  margin-right: 2.5%;
  margin-bottom: 1%;
  margin-left: 2.5%;
  background: grey;
  //position: relative;
  text-align: center;
}
.block {
  position: absolute;
  margin-top: 32.5%;
}
.block3 {
  //position: absolute;
  width: 70%;
  height: 160px;
  margin-top: 20px;
  margin-left: 1%;
  transform: translate(2%, 2%);
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.5);
  box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
  /*box-sizing设置盒子模型的解析模式为怪异盒模型，
    将border和padding划归到width范围内*/
  //box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
  /*边框阴影  水平阴影0 垂直阴影15px 模糊25px 颜色黑色透明度0.5*/
  border-radius: 15px;
}
.from {
  margin-left: 15px;
  color: aquamarine;
  margin-bottom: 0px;
  height: 15px;
}
.users {
  margin-bottom: 30px;
}
</style>

<style>
.search input.el-input__inner {
  border-radius: 15px;
  width: 100%;
}
.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}
.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
.block2 {
  overflow: auto;
}
</style>
