import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Home from '../views/Home.vue'
import Individual from '../views/Individual.vue'
import Blogger from '../views/Blogger.vue'
import Work from '../views/Work.vue'
import MyArticle from '../views/MyArticle.vue'
import Header from '../components/NavBar.vue'
import Test from '../views/Test.vue'
import SearchResult from '..//views/SearchResult.vue'
import Update from '../views/Update.vue'
import Manage from '../views/Manage.vue'

Vue.use(VueRouter)

const routes = [{
        path: "/",
        redirect: "/login"
    },
    {
        path: "/login",
        component: Login,
        meta: {
            keepAlive: false
        }
    },
    {
        path: "/register",
        component: Register,
        meta: {
            keepAlive: false
        }
    },
    {
        path: "/home",
        component: Home,
        meta: {
            keepAlive: true
        }
    },
    {
        path: "/individual",
        component: Individual,
        meta: {
            keepAlive: true
        }
    },
    {
        path: "/blogger/article_id=:id",
        name: '资源列表',
        component: Blogger,
        meta: {
            keepAlive: true
        }
    },
    {
        path: "/work",
        component: Work,
        meta: {
            keepAlive: true
        }
    },
    {
        path: "/myarticle",
        component: MyArticle,
        meta: {
            keepAlive: true
        }
    },
    {
        path: "/header",
        component: Header,
        meta: {
            keepAlive: false
        }
    },
    {
        path: "/test",
        name: '空白页',
        component: Test,
        meta: {
            keepAlive: true
        }
    },
    {
        path: "/searchresult/keyword=:keyword",
        name: "搜索结果",
        component: SearchResult,
        meta: {
            keepAlive: true
        }
    },
    {
        path: "/update",
        name: '修改信息',
        component: Update,
        meta: {
            keepAlive: false
        }
    },
    {
        path: "/manage",
        component: Manage,
        meta: {
            keepAlive: false
        }
    },
]

const router = new VueRouter({
    routes
})

// 出问题时使用
// const OriginalPush = VueRouter.prototype.push
// VueRouter.prototype.push = function push(location, onResolve, onReject) {
//     if (onResolve || onReject) return originalPush.call(this, location, onResolve, OnReject)
//     return originalPush.call(this, location).catch(err => err)
// }

router.beforeEach((to, from, next) => {
    const userFlag = window.sessionStorage.getItem("user");
    if (to.path == '/login' || to.path == "/register") return next();
    if (!userFlag) {
        alert("您还没有登录，请先登录！");
        return next("/login");
    }
    next();
})

router.afterEach((to, from, next) => {
    window.scrollTo(0, 0);
});


export default router