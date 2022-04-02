<template>
  <div position="absolute">
    <div style="margin-top: 80px"></div>
    <div
      v-for="(item, index) of myArticleList"
      :key="index"
      :class="{ changeStyle: changeSelectStyle == index }"
    >
      <div class="block10">
        <h2>
          <span class="title2">{{ item.article_title }}</span>
        </h2>
        <div class="content2">{{ item.article_content }}</div>
        <div class="from2">
          date: {{ item.article_date | formatDate }}&nbsp;&nbsp;&nbsp;&nbsp;
          view: {{ item.article_views }}&nbsp;&nbsp;&nbsp;&nbsp; like:
          {{ item.article_like_count }}
        </div>
        <div class="oc" @click="changeStyle(index)">展开/收起</div>
        <button
          type="primary"
          class="delete"
          @click="deleteArticle(item.article_id)"
        >
          删除
        </button>
        <!-- <div class="line"></div> -->
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
      changeSelectStyle: -1,
      myArticleList: [],
      isOpen: 0,
    };
  },
  created: function() {
    this.getMyArticle();
  },
  methods: {
    async getMyArticle() {
      var user = JSON.parse(sessionStorage.getItem("user"));
      this.id = user.user_id + "";
      console.log(this.id);
      const { data: res } = await this.$http.post("myarticle", this.id);
      if (res.flag == "error") this.$message.error("获取资源失败！");
      this.myArticleList = res.myarticles;
      console.log(this.myArticleList);
    },
    changeStyle: function(index) {
      //isOpen初始为0，打开时为1
      this.changeSelectStyle = index;
      if (this.isOpen == 1) {
        this.changeSelectStyle = -1;
      }
      this.isOpen = !this.isOpen;
    },
    async deleteArticle(id) {
      const confirmResult = await this.$confirm(
        "此操作将永久删除该文章, 是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        }
      ).catch((err) => err);
      /*如果用户确认打印confirm,如果用户取消显示cancel*/
      if (confirmResult !== "confirm") {
        return this.$message.success("已取消删除!");
      }
      const { data: res } = await this.$http.post("delete", id);
      if (res.flag == "success") {
        this.$message({
          message: "删除成功！",
          type: "success",
          duration: 0.5 * 1000,
        });
        this.$router.go(0);
      } else {
        this.$message.warning("删除失败！");
      }
    },
  },
};
</script>

<style lang="less" scope="">
.block10 {
  //position: absolute;
  width: 70%;
  height: 160px;
  // overflow:auto;
  margin-top: 2%;
  margin-left: 15%;
  // margin-bottom: 6%;
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
}
.title2 {
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
.content2 {
  margin-top: 10px;
  overflow: hidden;
  height: 40px;
  margin-left: 15px;
  margin-right: 15px;
  margin-bottom: 15px;
  display: -webkit-box;
  text-overflow: ellipsis; //溢出用省略号显示
  color: rgb(183, 177, 168);
}
.line {
  //float:right;
  width: 95%;
  height: 1px;
  //margin-top: 20px;
  margin-right: 2.5%;
  margin-bottom: 1%;
  //margin-left: 20px;
  background: grey;
  //position: relative;
  text-align: center;
}
.oc {
  text-align: center;
  color: #46acff;
  cursor: pointer;
}
.changeStyle {
  color: #0099cc;
  background-color: #fff;
  .block10 {
    //position: absolute;
    width: 70%;
    height: auto;
    overflow: auto;
    margin-top: 1%;
    margin-left: 1%;
    margin-bottom: 3%;
    transform: translate(2%, 2%);
    box-sizing: border-box;
    background: rgba(0, 0, 0, 0.5);
    box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
    border-radius: 15px;
  }
  .title2 {
    height: auto;
    word-wrap: break-word;
    margin-left: 2%;
    margin-right: 2%;
    padding-top: 1%;
    display: flow-root; //行对齐
    letter-spacing: 2px;
    line-height: 32px !important;
  }
  .content2 {
    margin-left: 20px;
    margin-right: 15px;
    margin-bottom: 28px;
    height: auto;
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
}
.delete {
  height: 0px;
  color: #46acff;
  border: none;
  float: right;
  margin-top: -10px;
  margin-bottom: 20px;
  margin-right: 15px;
  background-color: rgba(0, 0, 0, 0.5);
  cursor: pointer;
  // text-emphasis-color: blue;
}
.from2 {
  margin-left: 15px;
  color: aquamarine;
  margin-bottom: 0px;
  height: 15px;
}
</style>
