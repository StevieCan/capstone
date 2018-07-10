/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Get shit done!"

    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var GolfersIndexPage = {
  template: "#golfers-index-page",
  data: function() {
    return {
      golfers: [] 
    };
  },
  created: function() {
    axios
    .get("/api/golfers")
    .then(function(response) {
      this.golfers = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var GolfersShowPage = {
  template: "#golfers-show-page",
  data: function() {
    return {
      golfer: {
        id: "",
        name: "",
        member_number: "",
        caddy_preference_1: "",
        caddy_preference_2: "",
        caddy_preference_3: "",
        email: ""
      }
      
    };
  },
  created: function() {
    axios
    .get('/api/golfers/' + this.$route.params.id )
    .then(function(response) {
      this.golfer = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var GolfersNewPage = {
  template: "#golfers-new-page",
  data: function() {
    return {
      name: "",
      member_number: "",
      email: "",
      password: "",
      password_confirmation: "",
      errors: []
    };
  },

  methods: {
    submit: function() {
      var params = {
        name: this.name,
        member_number: this.memberNumber,
        caddy_preference_1: this.caddy_preference_1,
        caddy_preference_2: this.caddy_preference_2,
        caddy_preference_3: this.caddy_preference_3,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/golfers", params)
        .then(function(response) {
          router.push("/golfers");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  } 
};

var GolfersSignupPage = {
  template: "#golfers-signup-page",
  data: function() {
    return {
      name: "",
      member_number: "",
      email: "",
      password: "",
      password_confirmation: "",
      errors: []
    };
  },

  methods: {
    submit: function() {
      var params = {
        name: this.name,
        member_number: this.memberNumber,
        caddy_preference_1: this.caddy_preference_1,
        caddy_preference_2: this.caddy_preference_2,
        caddy_preference_3: this.caddy_preference_3,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/golfers", params)
        .then(function(response) {
          router.push("/#/golfer_login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  } 
};

var GolfersLoginPage = {
  template: "#golfers-login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: [] 
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/golfer_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] = "Bearer" + response.data.jwt;
          localStorage.setGolfer("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var router = new VueRouter({
  routes: [
            { path: "/", component: HomePage },
            { path: "/golfers", component: GolfersIndexPage },
            { path: "/golfers/:id", component: GolfersShowPage },
            { path: "/golfers/new", component: GolfersNewPage },
            { path: "/golfer_signup", component: GolfersSignupPage },
            {path: "/golfer_login", component: GolfersLoginPage}
          ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});