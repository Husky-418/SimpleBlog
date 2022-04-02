<template>
  <div>
    <div class="form">
      <el-menu
        :default-active="activeIndex"
        mode="horizontal"
        background-color="black"
      >
        <el-menu-item index="1" @click="toHome">首页</el-menu-item>
        <el-menu-item index="2" @click="toArticle">我的作品</el-menu-item>
        <el-menu-item index="3" @click="toWork">我要创作</el-menu-item>
        <el-menu-item index="4"
          ><a href="https://www.csdn.net/" target="_blank"
            >CSDN</a
          ></el-menu-item
        >
        <el-menu-item>
          <el-input
            type="text"
            placeholder="请输入内容"
            v-model="keyword"
            class="search"
            >{{ this.keyword }}
            <i
              slot="suffix"
              class="el-input__icon el-icon-search"
              @click="search(keyword)"
              @keyup.enter="search(keyword)"
            ></i>
          </el-input>
        </el-menu-item>
        <div>
          <img class="tou" @click="toIndividual" src="../assets/tou.png" alt />
          <div class="shu">|</div>
        </div>
      </el-menu>
      <div style="top: 10px; color: white">
        <el-button type="text" @click="toLogin" class="btn1">登录</el-button>
      </div>
      <el-button type="text" @click="exit" class="btn2">安全退出</el-button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeIndex: "1",
      keyword: "",
    };
  },
  mounted() {
    this.keyword = sessionStorage.getItem("keyword");
    // console.log(this.keyword);
    sessionStorage.removeItem("keyword");
  },
  methods: {
    async exit() {
      const confirmResult = await this.$confirm(
        "此操作将清除登录信息, 是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        }
      ).catch((err) => err);
      if (confirmResult !== "confirm") {
        next();
      }
      window.sessionStorage.clear();
      this.$router.push("/login");
    },
    toLogin() {
      this.$router.push("/login");
    },
    toIndividual() {
      this.$router.push("/individual");
    },
    toWork() {
      this.$router.push("/work");
    },
    toHome() {
      this.$router.push("/home");
    },
    toArticle() {
      this.$router.push("/myarticle");
    },
    search(keyword) {
      if (keyword != null && keyword != "") {
        this.$router.push({
          path: "/searchresult",
          name: "搜索结果",
          params: { keyword },
        });
        sessionStorage.setItem("keyword", keyword);
        location.reload();
      } else if (keyword == null || keyword == "") {
        this.$message({
          message: "请输入有效内容！",
          type: "warning",
          duration: 0.5 * 1000,
        });
        // location.reload();
      }
    },
    keyDown(e) {
      if (e.keyCode == 13) this.search(this.keyword);
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
.form {
  position: fixed;
  top: 0%;
  width: 100%;
  z-index: 1000;
}
.tou {
  position: fixed;
  width: 45px;
  height: 45px;
  right: 150px;
  top: 7.5px;
  border-radius: 100%;
}
.shu {
  position: fixed;
  top: 20px;
  right: 125px;
}
.btn2 {
  position: fixed;
  right: 10px;
  top: 10px;
}
.btn1 {
  position: fixed;
  right: 80px;
  top: 10px;
}
.search {
  position: fixed;
  top: -3px;
  width: auto;
}
</style>

<style>
.search input.el-input__inner {
  border-radius: 15px;
  width: 100%;
}
</style>
