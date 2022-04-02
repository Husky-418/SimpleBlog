<template>
  <div id="app">
    <div v-if="$route.meta.keepAlive">
            <head-nav></head-nav>
            <router-view></router-view>
    </div>
    <router-view v-if="!$route.meta.keepAlive"></router-view>
    <!-- <router-view></router-view> -->
  </div>
</template>

<script>
import HeadNav from './components/NavBar'
// import {formatDate} from './views/date';
export default {
    // filters: {
    //     formatDate(time) {
    //         var date = new Date(time);
    //         return formatDate(date, 'yyyy-MM-dd hh:mm');
    //     }
    // },
    name: 'App',
    components:{HeadNav},
}
</script>

<style>
  html,
  body,
  #app {
    height: 100%;
    padding: 0;
    margin: 0;
  }
</style>
