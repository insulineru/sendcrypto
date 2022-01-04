<template>
  <div
    class="bg-[#181918] m-4 flex flex-1 2xl:min-w-[450px] 2xl:max-w-[500px] sm:min-w-[270px] sm:max-w-[300px] min-w-full flex-col p-3 rounded-md hover:shadow-2xl"
  >
    <div class="flex flex-col items-center w-full mt-3">
      <div class="display-flex justify-start w-full mb-6 p-2">
        <a
          :href="`https://ropsten.etherscan.io/address/${addressFrom}`"
          target="_blank"
          rel="noreferrer"
        >
          <p class="text-white text-base">От: 0x....1337</p>
        </a>
        <a
          :href="`https://ropsten.etherscan.io/address/${addressTo}`"
          target="_blank"
          rel="noreferrer"
        >
          <p class="text-white text-base">Кому: 0x....228</p>
        </a>
        <p class="text-white text-base">Сумма: 0,228 ETH</p>

        <br />
        <p class="text-white text-base">Сообщение: test</p>
      </div>
      <img src="https://metro.co.uk/wp-content/uploads/2015/05/pokemon_crying.gif?quality=90&strip=all&zoom=1&resize=500%2C284" class="w-full h-64 2xl:h-96 rounded-md shadow-lg object-cover" />
      <div class="bg-black p-3 px-5 w-max rounded-3xl -mt-5 shadow-2xl">
        <p class="text-[#37c7da] font-bold">04.01.2021, 17:00</p>
      </div>
    </div>
  </div>
</template>

<script setup>
</script>
