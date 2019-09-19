<template>
  <div>
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>department</th>
          <th>gender</th>
          <th>actions</th>
        </tr>
        <tr v-for="e in employees" :key="e.id">
          <td><router-link :to="{ name: 'EmployeeDetailPage', params: { id: e.id } }">{{ e.id }}</router-link></td>
          <td>{{ e.name }}</td>
          <td>{{ e.department }}</td>
          <td>{{ e.gender }}</td>
          <td>
            <button @click="deleteTarget = e.id; showModal = true">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
    <transition name="fade">
      <modal v-if="showModal" @cancel="showModal = false" @ok="deleteEmployee(); showModal = false;">
        <div slot="body">Are you sure?</div>
      </modal>
    </transition>
  </div>
</template>

<script>
import axios from 'axios';

import Modal from 'Modal.vue'

export default {
  components: {
    Modal
  },
  data: function () {
    return {
      employees: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
    }
  },
  mounted () {
    this.updateEmployees();
  },
  methods: {
    deleteEmployee: function() {
      if (this.deleteTarget <= 0) {
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/v1/employees/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateEmployees();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    updateEmployees: function() {
      axios
        .get('/api/v1/employees.json')
        .then(response => (this.employees = response.data))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.fade-enter {
  opacity: 0;
}
.fade-enter-to {
  opacity: 1;
}
.fade-enter-active {
  transition: opacity 300ms ease-out;
}
.fade-leave {
  opacity: 1;
}
.fade-leave-to {
  opacity: 0;
}
.fade-leave-active {
  transition: opacity 300ms ease-out;
}
.fade-enter {
  opacity: 0;
  transform: translateY(-20px);
}
.fade-enter-active {
  transition: opacity 300ms ease-out, transform 300ms ease-out;
}
.fade-leave-to {
  opacity: 0;
  transform: scale(0.97);
}
.fade-leave-active {
  transition: opacity 270ms ease-out, transform 270ms ease-out;
}
</style>