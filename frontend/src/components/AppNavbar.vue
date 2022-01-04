<template>
  <nav class="w-full flex md:justify-center justify-between items-center p-4">
    <div class="md:flex-[0.5] flex-initial justify-center items-center">
      <img src="@/assets/images/logo.png" alt="SendCrypto Logo" class="w-32 cursor-pointer" />
    </div>

    <ul
      class="text-white md:flex hidden list-none flex-row justify-between items-center flex-initial"
    >
      <li v-for="(item, index) in menuItems" :key="index" class="mx-4 cursor-pointer">{{ item }}</li>
      <li>
        <button
          class="bg-[#2952e3] py02 px-7 mx-4 rounded-full cursor-pointer hover:bg-[#2546bd]"
        >Вход</button>
      </li>
    </ul>
    <div class="flex relative">
      <button class="text-white md:hidden cursor-pointer" @click="toggleMenu">
        <app-icon :icon="getIconName" width="28" />
      </button>
      <ul
        v-if="isMenuOpened"
        class="z-10 fixed -top-0 -right-2 p-3 w-[70vw] h-screen shadow-2xl md:hidden list-none flex flex-col justify-start items-end rounded-md blue-glassmorphism text-white animate-slide-in"
      >
        <li class="text-xl w-full my-2">
          <button class="cursor-pointer" @click="toggleMenu">
            <app-icon :icon="getIconName" width="28" />
          </button>
        </li>
        <li
          v-for="(item, index) in menuItems"
          :key="index"
          class="mx-4 cursor-pointer my-2 text-lg"
        >{{ item }}</li>
      </ul>
    </div>
  </nav>
</template>

<script setup>
import { Icon as AppIcon } from "@iconify/vue"
const menuItems = ["Рынок", "Обмен", "Обучение", "Кошельки"]
const isMenuOpened = ref(false)

const toggleMenu = () => {
  isMenuOpened.value = !isMenuOpened.value
}

const getIconName = computed(() => {
  return isMenuOpened.value ? "ic:outline-close" : "heroicons-outline:menu-alt-4"
})
</script>
