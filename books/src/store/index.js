import Vue from 'vue'
import Vuex from 'vuex'
import dayjs from 'dayjs'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    studentinfo:{},
    date:''
  },
  mutations: {
    getStudentName(state,name){
      state.studentinfo=name;
    },
    getDate(state,date){
      state.date = dayjs(date).format('YYYY年MM月DD日')
    }
  },
  actions: {
  },
  modules: {
  }
})
