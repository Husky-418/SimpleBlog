<template>
  <el-container class="container">
    <el-header class="header"><h2>后台管理</h2></el-header>
    <el-container>
      <el-aside class="aside" width="15%">
        <el-menu class="menu">
          <el-menu-item index="1-1">用户管理</el-menu-item>
          <el-menu-item index="1-2">文章管理</el-menu-item>
          <el-menu-item index="1-3">标签管理</el-menu-item>
        </el-menu>
      </el-aside>
      <el-main class="main">Main</el-main>
    </el-container>
  </el-container>
</template>

<script></script>

<style lang="less" scoped>
.container {
  height: 100%;
}
.header {
  background-color: grey;
  text-align: center;
}
.aside {
  background-color: DimGray;
}
.menu {
  background-color: DimGray;
  text-align: center;
}
.main {
  background-color: rgb(68, 70, 70);
}
</style>
