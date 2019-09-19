<template>
  <div>
    <div>予定を入力</div>
    <Datepicker
      :language="ja"
      :value="this.default"
      :format="DatePickerFormat"
      >
    </Datepicker>
  </div>
</template>

<script>
import Datepicker from 'vuejs-datepicker';
import {ja} from 'vuejs-datepicker/dist/locale'
let now = new Date();


export default {
  data: function () {
  return {
      ja:ja,
      default: now,
      DatePickerFormat: 'yyyy年MM月dd日'
    }
  },
  // ...
  components: {
    Datepicker
  }
  // ...
}
</script>