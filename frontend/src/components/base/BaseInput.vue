<template>
  <input
    v-model="model"
    class="my-2 w-full rounded-sm p-2 outline-none bg-transparent text-white border-none text-sm white-glassmorphism"
  />
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  modelValue: {
    type: [String, Number],
    default: ''
  }
})

const emit = defineEmits(['update:modelValue'])

const model = computed({
  get () {
    return props.modelValue
  },

  set (value) {
    return emit('update:modelValue', value)
  }
})
</script>
