import { createRouter, createWebHistory } from 'vue-router'


const routes = [
  {
    path:'/',
    redirect:'/login'
  },
  {
    path:'/login',
    component:() => import('../views/Login')
  },
  {
    path:'/adminLayout',
    component:() => import('../components/admin/AdminLayout'),
    children:[
      {
        path:'',
        component:() => import('../views/Welcome')
      },
      {
        path:'applyfordorm',
        component:() => import('../views/admin/Applyfordorm')
      },
      {
        path:'customer',
        component:() => import('../views/admin/Customer')
      },
      {
        path:'driver',
        component:() => import('../views/admin/Driver')
      },
      {
        path:'Dormscore',
        component:() => import('../views/admin/Dormscore')
      },
      {
        path:'dormitory',
        component:() => import('../views/admin/Dormitory')
      },
      {
        path:'waterfee',
        component:() => import('../views/admin/Waterfee')
      },
      {
        path:'weiguiweiji',
        component:() => import('../views/admin/Weiguiweiji')
      },
      {
        path:'qinshibaoxiu',
        component:() => import('../views/admin/Qinshibaoxiu')
      },
      {
        path:'suguanliuyan',
        component:() => import('../views/admin/Suguanliuyan')
      },
      {
        path:'personinformation',
        component:() => import('../views/admin/Personinformation')
      },
      {
        path:'changepassword',
        component:() => import('../views/admin/Changepassword')
      }
  ]
},
  {
    path:'/customerLayout',
    component:() => import('../components/customer/CustomerLayout'),
    children:[
      {
        path:'',
        component:() => import('../views/Welcome')
      },
      {
        path:'mystudent',
        component:() => import('../views/customer/Mystudent')
      },
      {
        path:'checkscore',
        component:() => import('../views/customer/Checkscore')
      },
      {
        path:'teacherapprove',
        component:() => import('../views/customer/Teacherapprove')
      },
      {
        path:'checkweiguiweiji',
        component:() => import('../views/customer/Checkweiguiweiji')
      },
      {
        path:'checkqinshibaoxiu',
        component:() => import('../views/customer/Checkqinshibaoxiu')
      },
      {
        path:'fudaoyuanliuyan',
        component:() => import('../views/customer/Fudaoyuanliuyan')
      },
      {
        path:'personinformation',
        component:() => import('../views/customer/Personinformation')
      },
      {
        path:'changepassword',
        component:() => import('../views/customer/Changepassword')
      }

    ]
  },
  {
    path:'/driverLayout',
    component:() => import('../components/driver/DriverLayout'),
    children:[
      {
        path:'',
        component:() => import('../views/Welcome')
      },
      {
        path:'mydormitory',
        component:() => import('../views/driver/Mydormitory')
      },
      {
        path:'appleforleave',
        component:() => import('../views/driver/Appleforleave')
      },
      {
        path:'checkshuidianfei',
        component:() => import('../views/driver/Checkshuidianfei')
      },
      {
        path:'ceckscore',
        component:() => import('../views/driver/Checkscore')
      },
      {
        path:'myweiguiweiji',
        component:() => import('../views/driver/Myweiguiweiji')
      },
      {
        path:'qinshibaoxiu',
        component:() => import('../views/driver/Qinshibaoxiu')
      },
      {
        path:'checkliuyan',
        component:() => import('../views/driver/Checkliuyan')
      },
      {
        path:'personinformation',
        component:() => import('../views/driver/Personinformation')
      },
      {
        path:'changepassword',
        component:() => import('../views/driver/Changepassword')
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
