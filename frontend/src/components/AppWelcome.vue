<template>
  <section class="flex w-full justify-center items-center">
    <div class="flex mf:flex-row flex-col items-start justify-between md:p-20 py-12 px-4">
      <div class="flex flex-1 justify-start items-start flex-col mf:mr-10">
        <h1 class="text-3xl sm:text-5xl text-white text-gradient py-1">
          Отправляйте крипту
          <br />по всему миру
        </h1>
        <p
          class="text-left mt-5 text-white font-light md:w-9/12 w-11/12 text-base"
        >Изучайте крипторынок. Покупайте и продавайте криптовалюту с нами!</p>
        <button
          v-if="!props.account"
          class="flex flex-row justify-center items-center my-5 bg-[#2952e3] text-white p-3 rounded-full cursor-pointer hover:bg-[#2546bd]"
          type="button"
          @click="connectWallet"
        >
          <app-icon icon="bi:play-circle-fill" class="mr-2" />
          <p class="text-white font-semibold">Подключить Metamask</p>
        </button>

        <ul class="grid sm:grid-cols-3 grid-cols-2 w-full mt-10 list-none">
          <li class="rounded-tl-2xl" :class="cardStyles">Reliability</li>
          <li :class="cardStyles">Security</li>
          <li class="sm:rounded-tr-2xl" :class="cardStyles">Ethereum</li>
          <li class="sm:rounded-bl-2xl" :class="cardStyles">Web 3.0</li>
          <li :class="cardStyles">Low Fees</li>
          <li class="rounded-br-2xl" :class="cardStyles">Blockchain</li>
        </ul>
      </div>

      <div class="flex flex-col flex-1 items-center jistify-start w-full mf:mt-0 mt-10">
        <div
          class="p-3 flex justify-end items-start flex-col rounded-xl h-40 sm:w-72 w-full my-5 eth-card .white-glassmorphism"
        >
          <div class="flex justify-between flex-col w-full h-full">
            <div class="flex justify-between items-start">
              <div
                class="w-10 h-10 rounded-full border-2 border-white flex justify-center items-center"
              >
                <app-icon icon="simple-icons:ethereum" class="text-white" width="21" />
              </div>
              <app-icon icon="bi:info-circle" class="text-white" width="17" />
            </div>
            <div>
              <p class="text-white font-light text-sm">{{ shortenAddress(props.account) }}</p>
              <p class="text-white font-semibold text-lg mt-1">Ethereum</p>
            </div>
          </div>
        </div>

        <form
          class="p-5 sm:w-96 w-full flex flex-col justify-start items-center blue-glassmorphism"
          @submit.prevent="sendEth"
        >
          <base-input v-model="address" placeholder="Address To" required />
          <base-input v-model="amount" placeholder="Amount (ETH)" type="number" step="0.0001" required/>
          <base-input v-model="gif" placeholder="Keyword (Gif)" />
          <base-input v-model="message" placeholder="Enter Message" />

          <div class="h-[1px] w-full bg-gray-400 my-2" />

          <base-loader v-if="isLoading" />
          <p v-else-if="!props.account" class="text-red-600 text-center font-bold">Сначала необходимо подключить MetaMask</p>
          <button
            v-else
            type="submit"
            class="text-white w-full mt-2 border-[1px] p-2 border-[#3d4f7c] hover:bg-[#3d4f7c] rounded-full cursor-pointer"
          >Отправить</button>
        </form>
      </div>
    </div>
  </section>
</template>

<script setup>
import { Icon as AppIcon } from "@iconify/vue"
import BaseLoader from "@/components/base/BaseLoader.vue"
import BaseInput from "@/components/base/BaseInput.vue"

import { shortenAddress } from '@/utils/shortenAddress.js'

const props = defineProps(['account', 'isLoading'])
const emit = defineEmits(['setAccount', 'sendEth'])

const cardStyles = "min-h-[70px] sm:px-0 px-2 sm:min-w-[120px] flex justify-center items-center border-[0.5px] border-gray-400 text-sm font-light text-white"

const address = ref('')
const amount = ref('')
const gif = ref('')
const message = ref('')

const connectWallet = async () => {
  try {
    const { ethereum } = window
    if (!ethereum) {
      return
    }
    const accounts = await ethereum.request({
      method: 'eth_requestAccounts',
    })

    if (accounts.length !== 0) {
      emit('setAccount', accounts[0])
    }
  } catch (error) {
    console.log(error)
  }
}

const sendEth = () => {
  const formData = {
    address: address.value,
    amount: amount.value,
    keyword: gif.value,
    message: message.value
  }

  emit('sendEth', formData)
}

</script>
