<template>
  <div>
    <h1>Register</h1>
    <div class="form-div">
      <form @submit.prevent="register">
        <input
          type="text"
          name="username"
          placeholder="username"
          v-model="username"
        />
        <input
          type="password"
          name="password"
          placeholder="password"
          v-model="password"
        />
        <button type="submit">Register</button>
      </form>
    </div>
  </div>
</template>

<script>
import RegistrationService from "../services/RegistrationService.js";
export default {
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    //asynchronously waiting for registration to complete
    async register() {
      const response = await RegistrationService.register({
        username: this.username,
        password: this.password,
      });
      console.log(response.data);
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

input {
  margin-bottom: 1em;
}
</style>