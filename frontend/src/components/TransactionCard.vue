<template>
  <div
    class="bg-[#181918] m-4 flex flex-1 2xl:min-w-[450px] 2xl:max-w-[500px] sm:min-w-[270px] sm:max-w-[300px] min-w-full flex-col p-3 rounded-md hover:shadow-2xl"
  >
    <div class="flex flex-col items-center w-full mt-3">
      <div class="display-flex justify-start w-full mb-6 p-2">
        <a
          :href="`https://ropsten.etherscan.io/address/${props.addressFrom}`"
          target="_blank"
          rel="noreferrer"
        >
          <p class="text-white text-base">От: {{ shortenAddress(props.addressFrom) }}</p>
        </a>
        <a
          :href="`https://ropsten.etherscan.io/address/${props.addressTo}`"
          target="_blank"
          rel="noreferrer"
        >
          <p class="text-white text-base">Кому: {{ shortenAddress(props.addressTo) }}</p>
        </a>
        <p class="text-white text-base">Сумма: {{ amount }} ETH</p>

        <br />

        <template v-if="props.message">
          <p class="text-white text-base">Сообщение: {{ message }}</p>
        </template>
        <br v-else />

      </div>

      <img :src="url" class="w-full h-64 2xl:h-96 rounded-md shadow-lg object-cover" />
      <div class="bg-black p-3 px-5 w-max rounded-3xl -mt-5 shadow-2xl">
        <p class="text-[#37c7da] font-bold">{{ timestamp }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { shortenAddress } from "@/utils/shortenAddress"
const props = defineProps(['url', 'message', 'timestamp', 'addressFrom', 'amount', 'addressTo'])
</script>
