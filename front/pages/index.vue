<template>
  <v-container>
    <v-row>
      <v-col cols="6" offset="3">
        <v-card>
          <v-card-title>Register Task</v-card-title>
          <v-card-text>
            <v-form>
              <v-container>
                <v-row>
                  <v-col cols="6">
                    <v-text-field v-model="newTask.name" label="Title" required />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12">
                    <v-text-field v-model="newTask.description" label="Description" required />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col>
                    <v-btn @click="createTask(newTask)">
                      Register
                    </v-btn>
                  </v-col>
                </v-row>
              </v-container>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-row v-for="task in tasks" :key="task.id">
      <v-col cols="6" offset="3">
        <v-card>
          <v-card-title>
            <v-checkbox v-model="task.completed" :label="task.name" @click="updateTask(task)" />
            <v-btn text icon @click="deleteTask(task)">
              <v-icon>clear</v-icon>
            </v-btn>
          </v-card-title>
          <v-card-text>{{ task.description }}</v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import tasks from '~/apollo/queries/tasks'
import createTask from '~/apollo/mutations/createTask'
import deleteTask from '~/apollo/mutations/deleteTask'
import updateTask from '~/apollo/mutations/updateTask'

export default {
  middleware: 'auth',
  data() {
    return {
      tasks: {},
      newTask: {
        name: '',
        description: ''
      }
    }
  },
  methods: {
    async createTask(task) {
      try {
        await this.$apollo.mutate({
          mutation: createTask,
          variables: {
            id: task.id,
            name: task.name,
            description: task.description
          },
          refetchQueries: [{
            query: tasks
          }]
        })
        this.newTask = { name: '', description: '' }
      } catch (e) {
        window.console.log(e)
      }
    },
    async deleteTask(task) {
      try {
        await this.$apollo.mutate({
          mutation: deleteTask,
          variables: {
            id: task.id
          },
          refetchQueries: [{
            query: tasks
          }]
        })
      } catch (e) {
        window.console.log(e)
      }
    },
    async updateTask(task) {
      try {
        await this.$apollo.mutate({
          mutation: updateTask,
          variables: {
            id: task.id,
            completed: !task.completed
          },
          refetchQueries: [{
            query: tasks
          }]
        })
      } catch (e) {
        window.console.log(e)
      }
    }
  },
  apollo: {
    tasks: {
      query: tasks
    }
  }
}
</script>
