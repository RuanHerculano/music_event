import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const Auth = () => import("../views/Auth");
const Login = () => import("../views/Login");
const Register = () => import("../views/Register");
const Home = () => import("../views/Home");
const EventList = () => import("../views/EventList");
const Artists = () => import("../views/Artists");
const Genres = () => import("../views/Genres");

const routes = [
  {
    path: "/auth",
    component: Auth,
    children: [
      {
        path: "/",
        component: Login,
        name: "Login"
      },
      {
        path: "register",
        component: Register,
        name: "Register"
      }
    ]
  },
  {
    path: "/",
    component: Home,
    children: [
      {
        path: "",
        component: EventList,
        name: "EventList"
      },
      {
        path: "artists",
        component: Artists,
        name: "Artists"
      },
      {
        path: "geners",
        component: Genres,
        name: "Genres"
      }
    ]
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
