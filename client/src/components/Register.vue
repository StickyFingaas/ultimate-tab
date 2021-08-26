<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-center items-center">
      <panel title="Register">
        <q-card-section>
          <q-form class="q-gutter-md" autofocus>
            <q-input
              square
              filled
              clearable
              v-model="email"
              name="email"
              type="email"
              label="email"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Enter an email']"
            />
            <q-input
              square
              filled
              clearable
              v-model="username"
              name="username"
              type="username"
              label="username"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Enter a username']"
            />
            <q-input
              square
              filled
              clearable
              v-model="password"
              :type="isPwd ? 'password' : 'text'"
              label="password"
              lazy-rules
              :rules="[(val) => (val && val.length > 0) || 'Enter a password']"
            >
              <template v-slot:append>
                <q-icon
                  :name="isPwd ? 'visibility_off' : 'visibility'"
                  class="cursor-pointer"
                  @click="isPwd = !isPwd"
                /> </template
            ></q-input>
          </q-form>
        </q-card-section>
        <div v-if="message">
          <p :class="divClass">{{ message }}</p>
        </div>
        <q-card-actions class="q-px-md">
          <q-btn
            unelevated
            type="submit"
            color="light-green-7"
            size="md"
            class="full-width"
            label="Register"
            @click="onSubmit"
          />
        </q-card-actions>
        <q-card-section class="text-center q-pa-none">
          <p class="text-grey-6">
            Already registered?
            <router-link to="login">Log in.</router-link>
          </p>
        </q-card-section>
      </panel>
    </q-page>
  </q-layout>
</template>

<script>
import AuthenticationService from "../boot/AuthenticationService.js";
import Panel from "./Panel.vue";
export default {
  data() {
    return {
      email: "",
      username: "",
      password: "",
      message: null,
      divClass: "",
      isPwd: true,
    };
  },
  components: {
    Panel,
  },
  methods: {
    //asynchronously waiting for registration to complete
    async onSubmit() {
      try {
        const response = await AuthenticationService.register({
          email: this.email,
          username: this.username,
          password: this.password,
        });

        //we only want to track logged users (? - look into this during later development)
        // this.$store.dispatch("showbase/setToken", response.data.token); //calls the vuex store action which modifies the state; module uses namespaced: true so we must reference both the module and the action
        // this.$store.dispatch("showbase/setUser", response.data.user);

        this.divClass = "success";
        this.message = "Successful registration!";
      } catch (error) {
        //returns the adequate error into
        this.divClass = "error";
        this.message = error.response.data.error;
      }
    },
  },
};
</script>

<style lang="scss" scoped>
#row1 {
  background-color: $primary;
}

h5 {
  padding: 0.75em;
  margin: auto;
}
.error {
  color: red;
}

.success {
  color: green;
}
</style>