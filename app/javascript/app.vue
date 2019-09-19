<template>
  <div>
    <Header></Header>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import Header from 'Header.vue'

import EmployeeIndexPage from 'EmployeeIndexPage.vue'
import EmployeeDetailPage from 'EmployeeDetailPage.vue'
import EmployeeNewPage from 'EmployeeNewPage.vue'
import EmployeeEditPage from 'EmployeeEditPage.vue'
import Date from 'Date.vue'

import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'



Vue.use(BootstrapVue)


const router = new VueRouter({

  routes: [
    { path: '/',
      component: EmployeeIndexPage  },
    { path: '/employees/:id(\\d+)',  // :idは数値のみに制限する
      name: 'EmployeeDetailPage',
      component: EmployeeDetailPage },
    { path: '/employees/new',
      name: 'EmployeeNewPage',
      component: EmployeeNewPage    },
    { path: '/employees/:id(\\d+)/edit',
      name: 'EmployeeEditPage',
      component: EmployeeEditPage   },
    { path: '/date',
      name: 'Date',
      component: Date   },
  ]
})

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vue.use(VueRouter)

export default {
  router,
  components: {
    Header
  }
}
</script>

<style scoped>
</style>