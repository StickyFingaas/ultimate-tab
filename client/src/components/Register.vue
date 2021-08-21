<template>
  <q-layout view="hHh lpR fFf">
    <div>
      <h2>Register</h2>

      <div class="form-div">
        <q-form @submit.prevent="onSubmit">
          <q-input
            type="text"
            name="username"
            placeholder="username"
            v-model="username"
          />
          <q-input
            type="password"
            name="password"
            placeholder="password"
            v-model="password"
          />
          <div v-if="message">
            <p :class="divClass">{{ message }}</p>
          </div>
          <q-btn type="submit">Register</q-btn>
        </q-form>
      </div>
    </div>
  </q-layout>
</template>

<script>
import RegistrationService from "../boot/RegistrationService.js";
export default {
  data() {
    return {
      username: "",
      password: "",
      message: null,
      divClass: "",
    };
  },
  methods: {
    //asynchronously waiting for registration to complete
    async onSubmit() {
      try {
        await RegistrationService.register({
          username: this.username,
          password: this.password,
        });
        this.divClass = "success";
        this.message = "Successful entry!";
      } catch (error) {
        //returns the adequate error into
        this.divClass = "error";
        this.message = error.response.data.error;
      }
    },
  },
};
</script>

<style scoped>
.form-div form {
  width: 20vw;
  margin: auto;
  display: flex;
  flex-direction: column;
  align-content: space-between;
}

q-input {
  margin-bottom: 1em;
}

.error {
  color: red;
}

.success {
  color: green;
}
</style>