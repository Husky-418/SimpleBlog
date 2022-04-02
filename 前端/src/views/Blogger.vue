<template>
  <div>
    <div style="position: relative">
      <div class="block11">
        <div>
          <div>
            <h2>
              <span class="title_b">{{ article.article_title }}</span>
            </h2>
            <pre class="content_b">{{ article.article_content }}</pre>
            <div class="from3">
              from: {{ user.user_name }}&nbsp;&nbsp;&nbsp;&nbsp; date:
              {{ article.article_date | formatDate }}&nbsp;&nbsp;&nbsp;&nbsp;
              view: {{ article.article_views }}&nbsp;&nbsp;&nbsp;&nbsp; like:
              {{ article.article_like_count }}
            </div>
          </div>
        </div>
      </div>
      <div class="block5">
        <h3>博主</h3>
        <img src="../assets/tou.png" class="tou3" />
        <div class="writer">
          <div>id: {{ user.user_id }}</div>
          <div>name: {{ user.user_name }}</div>
          <div>email: {{ user.user_email }}</div>
        </div>
      </div>
      <div class="block6">
        <h3 style="text-align: center;margin-bottom: 5px">评论区</h3>
        <input
          type="text"
          placeholder="请输入评论"
          v-model="comment"
          class="commentinput"
        />
        <button type="primary" class="commentbtn" @click="writeComment">
          评论
        </button>
        <div v-for="(item, index) of commentList" :key="index" class="comment">
          <div class="detail">
            from: {{ u[index].user_name }} &nbsp;&nbsp;&nbsp;date:
            {{ item.comment_date | formatDate }}
          </div>
          <div>{{ item.comment_content }}</div>
          <div class="line9"></div>
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
      article: "",
      user: "",
      commentList: "",
      // comment:'',
    };
  },
  created: function() {
    this.getArticle();
  },
  methods: {
    async getArticle() {
      console.log(this.$route.params.id);
      this.id = this.$route.params.id;
      const { data: res } = await this.$http.post("blogger", this.id);
      if (res.flag == "error") this.$message.error("获取资源失败！");
      this.article = res.article;
      this.user = res.user;
      this.commentList = res.comments;
      this.u = res.u;
      console.log(res);
    },

    async writeComment() {
      if (this.comment == "" || this.comment == null) {
        this.$message({
          message: "请输入有效内容！",
          type: "warning",
          duration: 0.5 * 1000,
        });
      } else {
        // console.log(this.comment);
        const formData = new FormData();
        formData.set("comment_content", this.comment);
        formData.set("user_id", this.user.user_id);
        formData.set("article_id", this.article.article_id);
        const { data: res } = await this.$http.post("comment", formData);
        if (res.flag == "error") this.$message.error("评论失败！");
        location.reload();
      }
    },
  },
};
</script>

<style lang="less" scope="">
.block11 {
  position: absolute;
  width: 68%;
  height: auto;
  // overflow: hidden;
  margin-top: 7%;
  margin-left: 3%;
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
.line9 {
  position: absolute;
  width: 95%;
  height: 1px;
  margin-top: 10px;
  margin-right: 0%;
  margin-left: 0%;
  margin-bottom: 5px;
  background: grey;
  text-align: center;
}
.Img {
  width: 100%;
  height: 100%;
  border-radius: 15px;
}
.title_b {
  word-wrap: break-word;
  margin-left: 2%;
  margin-right: 2%;
  padding-top: 1%;
  display: flow-root; //行对齐
  letter-spacing: 2px;
  line-height: 32px !important;
}
.content_b {
  margin-left: 20px;
  margin-right: 15px;
  margin-bottom: 28px;
  font-family: auto; //字体
  display: flow-root;
  white-space: normal;
  word-break: break-all;
  overflow: hidden;
  // letter-spacing:1px;
  font-size: 16px !important;
  line-height: 26px !important;
  color: rgb(183, 177, 168);

  white-space: pre-wrap;
  white-space: -moz-pre-wrap;
  white-space: -pre-wrap;
  white-space: -o-pre-wrap;
}
.from3 {
  margin-left: 20px;
  color: aquamarine;
  margin-bottom: 20px;
  height: 15px;
}
.tou3 {
  height: 80px;
  width: 80px;
  border-radius: 50%;
  text-align: center;
}
.writer {
  color: aquamarine;
}
.block5 {
  position: absolute;
  width: 22%;
  height: auto;
  padding-bottom: 20px;
  float: right;
  // overflow:auto;
  margin-top: 6.5%;
  margin-left: 74%;
  transform: translate(2%, 2%);
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
.block6 {
  position: absolute;
  width: 22%;
  height: auto;
  padding-bottom: 20px;
  margin-top: 26%;
  margin-left: 74%;
  transform: translate(2%, 2%);
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.5);
  box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
  border-radius: 15px;
}
.comment {
  margin-left: 2.5%;
  margin-right: 2.5%;
  color: aquamarine;
  display: flow-root; //行对齐
}
.detail {
  // position: absolute;
  font-size: 10px;
  color: grey;
  // margin-top: 5px;
  margin-bottom: 5px;
  margin-top: 15px;
}
.commentinput {
  // position: absolute;
  margin-left: 2%;
  margin-right: 100px;
  // margin-bottom: 6px;
  width: 208px;
  border-block-color: aquamarine;
}
.commentbtn {
  margin-top: -23px;
  margin-right: 10px;
  float: right;
  border: none;
  color: aquamarine;
  height: 24px;
  width: 50px;
  // border-color: aquamarine;
  // background-color: #46ACFF;
}
</style>

<style>
.search input.el-input__inner {
  border-radius: 15px;
  width: 100%;
}
</style>
