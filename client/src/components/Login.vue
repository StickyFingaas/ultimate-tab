<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-center items-center">
      <div class="column">
        <div class="row" id="row1">
          <h5 class="text-h5 text-white q-my-md">Login</h5>
        </div>
        <div class="row">
          <q-card square bordered class="q-pa-lg shadow-1">
            <q-card-section>
              <q-form class="q-gutter-md" autofocus autocomplete>
                <q-input
                  square
                  filled
                  clearable
                  v-model="email"
                  type="email"
                  label="email"
                  lazy-rules
                  :rules="[
                    (val) => (val && val.length > 0) || 'Enter your email',
                  ]"
                />
                <q-input
                  square
                  filled
                  clearable
                  v-model="password"
                  :type="isPwd ? 'password' : 'text'"
                  label="password"
                  lazy-rules
                  :rules="[
                    (val) => (val && val.length > 0) || 'Enter your password',
                  ]"
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
                size="lg"
                class="full-width"
                label="Login"
                @click="onSubmit"
              />
            </q-card-actions>
            <q-card-section class="text-center q-pa-none">
              <p class="text-grey-6">
                Not registered?
                <router-link to="register">Do it here.</router-link>
              </p>
            </q-card-section>
          </q-card>
        </div>
      </div>
    </q-page>
  </q-layout>
</template>

<script>
import AuthenticationService from "../boot/AuthenticationService.js";
export default {
  data() {
    return {
      email: "",
      password: "",
      message: null,
      divClass: "",
      isPwd: true,
    };
  },
  methods: {
    //asynchronously waiting for login to complete
    async onSubmit() {
      try {
        await AuthenticationService.login({
          email: this.email,
          password: this.password,
        });
        this.divClass = "success";
        this.message = "Successful login!";
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