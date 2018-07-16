/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Get stuff done!"

    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var GolfersHomePage = {
  template: "#golfers-home-page",
  data: function() {
    return {
      message: "Welcome to Caddy Buddy!",
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

var CaddiesHomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Caddy Buddy!",
      caddies: []
      // caddy: {
      //         name: "",
      //         email: "",
      //         ranking: "",
      //         phone_number: ""
      //         }
    };
  },
  created: function() {
    axios
    .get("/api/caddies")
    .then(function(response) {
      this.caddies = response.data;
    }.bind(this));
  },
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

// var GolfersNewPage = {
//   template: "#golfers-new-page",
//   data: function() {
//     return {
//       name: "",
//       member_number: "",
//       email: "",
//       password: "",
//       password_confirmation: "",
//       errors: []
//     };
//   },

//   methods: {
//     submit: function() {
//       var params = {
//         name: this.name,
//         member_number: this.memberNumber,
//         caddy_preference_1: this.caddy_preference_1,
//         caddy_preference_2: this.caddy_preference_2,
//         caddy_preference_3: this.caddy_preference_3,
//         email: this.email,
//         password: this.password,
//         password_confirmation: this.passwordConfirmation
//       };
//       axios
//         .post("/api/golfers", params)
//         .then(function(response) {
//           router.push("/golfers");
//         })
//         .catch(
//           function(error) {
//             this.errors = error.response.data.errors;
//           }.bind(this)
//         );
//     }
//   } 
// };

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
        member_number: this.member_number,
        caddy_preference_1: this.caddy_preference_1,
        caddy_preference_2: this.caddy_preference_2,
        caddy_preference_3: this.caddy_preference_3,
        email: this.email,
        password: this.password,
        password_confirmation: this.password_confirmation
      };
      axios
        .post("/api/golfers", params)
        .then(function(response) {
          router.push("/golfer_login");
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
          axios.defaults.headers.common["Authorization"] = "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/golfers_home");
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

var GolfersLogoutPage = {
  template: "<h1>Golfer Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/golfer_login");
  }
};


var CaddiesIndexPage = {
  template: "#caddies-index-page",
  data: function() {
    return {
      caddies: [] 
    };
  },
  created: function() {
    axios
    .get("/api/caddies")
    .then(function(response) {
      this.caddies = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var CaddiesShowPage = {
  template: "#caddies-show-page",
  data: function() {
    return {
      caddy: {
        id: "",
        name: "",
        email: "",
        phone_number: "",
        ranking: ""
      }
      
    };
  },
  created: function() {
    axios
    .get('/api/caddies/' + this.$route.params.id )
    .then(function(response) {
      this.caddy = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var CaddiesSignupPage = {
  template: "#caddies-signup-page",
  data: function() {
    return {
      name: "",
      phone_number: "",
      ranking: "",
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
        phone_number: this.phone_number,
        ranking: this.ranking,
        email: this.email,
        password: this.password,
        password_confirmation: this.password_confirmation
      };
      axios
        .post("/api/caddies", params)
        .then(function(response) {
          router.push("/caddy_login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  } 
};

var CaddiesLoginPage = {
  template: "#caddies-login-page",
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
        .post("/caddy_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] = "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/caddies_home");
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

var CaddiesLogoutPage = {
  template: "<h1>Caddy Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/caddy_login");
  }
};

var GolferTeeTimesNewPage = {
  template: "#golfer-tee-times-new-page",
  data: function() {
    return {
      start_time: "",
      no_caddy: "",
      cart: "",
      number_of_holes: "",
      confirmed: false,
      errors: []
    };
  },

  methods: {
    submit: function() {
      var params = {
        start_time: this.start_time,
        no_caddy: this.no_caddy,
        cart: this.cart,
        number_of_holes: this.number_of_holes,
        confirmed: false
      };
      axios
        .post("/api/tee_times", params)
        .then(function(response) {
          router.push("/golfer_tee_times");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)

        );
    }

  }
};

var CaddiesTeeTimesIndexPage = {
  template: "#caddy-tee-times-index-page",
  data: function() {
    return {
      confirmed_tee_times: [{
        caddy_id: current_caddy.id,
        start_time: "",
        number_of_holes: 0,
        cart: ""
      }],
      unconfirmed_tee_times: [{
        start_time: "",
        number_of_holes: 0,
        cart: ""
      }],
    };
  },
  created: function() {
    axios
    .get("/api/caddy_tee_times")
    .then(function(response) {
      console.log(response);
      this.unconfirmed_tee_times = response.data.unconfirmed_tee_times;
      this.confirmed_tee_times = response.data.confirmed_tee_times;
    }.bind(this));
  },

  methods: {

    submit: function(inputTeeTime) {
      var params = {
        caddy_id: current_caddy.id
      };
      axios
        .post("/confirm_tee_times/" + inputTeeTime.id, params)
        .then(function(response) {
          this.unconfirmed_tee_times = response.data.unconfirmed_tee_times;
          this.confirmed_tee_times = response.data.confirmed_tee_times;
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );     
    }
  }
};


var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/golfers_home", component: GolfersHomePage },
    { path: "/caddies_home", component: CaddiesHomePage },
    { path: "/golfers", component: GolfersIndexPage },
    { path: "/golfers/:id", component: GolfersShowPage },
    { path: "/golfer_signup", component: GolfersSignupPage},
    { path: "/golfer_login", component: GolfersLoginPage},
    { path: "/golfer_logout", component: GolfersLogoutPage},

    { path: "/caddies", component: CaddiesIndexPage },
    { path: "/caddies/:id", component: CaddiesShowPage },
    { path: "/caddy_signup", component: CaddiesSignupPage},
    { path: "/caddy_login", component: CaddiesLoginPage},
    { path: "/caddy_logout", component: CaddiesLogoutPage},

    { path: "/golfer_tee_times", component: GolferTeeTimesNewPage},
    { path: "/caddy_tee_times", component: CaddiesTeeTimesIndexPage},
    { path: "/golfer_login", component: GolfersHomePage},
    { path: "/caddy_login", component: CaddiesHomePage}


  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});