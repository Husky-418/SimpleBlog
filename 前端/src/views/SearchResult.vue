<template>
  <div>
    <div v-if="this.flag">
      <div class="block19"></div>
      <div
        v-for="item of articleList"
        :key="item"
        class="block20"
        @click="toBlogger(item.article_id)"
      >
        <div>
          <h2>
            <span class="title3">{{ item.article_title }}</span>
          </h2>
          <div class="content3">{{ item.article_content }}</div>
        </div>
        <div class="from1">
          from id: {{ item.user_id }}&nbsp;&nbsp;&nbsp;&nbsp; date:
          {{ item.article_date | formatDate }}&nbsp;&nbsp;&nbsp;&nbsp; view:
          {{ item.article_views }}&nbsp;&nbsp;&nbsp;&nbsp; like:
          {{ item.article_like_count }}
        </div>
        <div class="line3"></div>
      </div>
    </div>
    <div v-if="!this.flag">
      <div class="unfound">未找到相关的用户或文章</div>
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
      flag: "",
      articleList: [],
      userList: [],
    };
  },
  created: function() {
    this.searchResult();
  },
  methods: {
    async searchResult() {
      // console.log(this.$route.params.keyword);
      this.keyword = this.$route.params.keyword;
      // console.log(keword);
      const formData = new FormData();
      formData.set("keyword", this.keyword);
      const { data: res } = await this.$http.post("search", formData);
      if (res.flag == "success") {
        this.flag = true;
        this.articleList = res.articleList;
        this.userList = res.userList;
        console.log(res);
      }
      if (res.flag == "error") {
        this.flag = false;
        // this.$message.error("没找到相符的内容");
      }
      // this.keyword='';
    },
    toBlogger(id) {
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
.unfound {
  margin-top: 10%;
  text-align: center;
  color: aquamarine;
}
.block19 {
  margin-top: 7%;
}
.block20 {
  //position: absolute;
  width: 60%;
  height: 160px;
  margin-top: 25px;
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
.title3 {
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
.content3 {
  //margin-top: 10px;
  overflow: hidden;
  height: 40px;
  margin-left: 15px;
  margin-right: 15px;
  margin-bottom: 10px;
  display: -webkit-box;
  text-overflow: ellipsis; //溢出用省略号显示
  color: rgb(183, 177, 168);
}
.line3 {
  float: right;
  width: 95%;
  height: 1px;
  margin-right: 2.5%;
  margin-top: 25px;
  margin-bottom: 1%;
  margin-left: 5%;
  background: grey;
  //position: relative;
  // text-align: center;
}
.from1 {
  margin-left: 15px;
  color: aquamarine;
  margin-bottom: 0px;
  height: 10px;
}
</style>
