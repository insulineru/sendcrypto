<template>
  <footer class="w-full flex md:justify-center justify-between items-center flex-col p-4 gradient-bg-footer">
    <div class="w-full flex sm:flex-row flex-col justify-between items-center my-4">
      <div class="flex flex-[0.5] justify-center items-center">
        <img src="@/assets/images/logo.png" alt="SendCrypto" class="w-32" />
      </div>
      <div class="flex flex-1 justify-evenly items-center flex-wrap sm:mt-0 mt-5 w-full">
        <p v-for="(item, index) in menuItems" :key="index" class="text-white text-base text-center mx-2 cursor-pointer">{{ item }}</p>
      </div>
    </div>

    <div class="flex justify-center items-center flex-col mt-5">
      <p class="text-white text-sm text-center">Пишите, если вам нужно сделать что-то подобное в Web 3.0</p>
      <p class="text-white text-sm text-center font-medium mt-2">aleksey@lisun.ru</p>
    </div>

    <div class="sm:w-[90%] w-full h-[0.25px] bg-gray-400 mt-5 " />

    <div class="sm:w-[90%] w-full flex justify-between items-center mt-3">
      <a href="https://instagram.com/insuline.ru" target="_blank" class="text-white text-left text-xs" rel="noopener noreferrer">@insuline.ru</a>
      <p class="text-white text-right text-xs">All rights reserved</p>
    </div>
  </footer>
</template>

<script setup>
const menuItems = ["Рынок", "Обмен", "Обучение", "Кошельки"]
</script>
