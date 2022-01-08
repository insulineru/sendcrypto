<template>
  <div class="flex w-full justify-center items-center 2xl:px-20 gradient-bg-transactions">
    <div class="flex flex-col md:p-12 py-12 px-4">
      <h3 v-if="props.account" class="text-white text-3xl text-center my-2">Последние транзакции</h3>
      <h3
        v-else
        class="text-white text-3xl text-center my-2"
      >Подключите свой кошелек, чтобы загрузить лист последних транзакций</h3>

      <div v-if="props.transactions.length > 0" class="flex flex-wrap justify-center items-center mt-10">
        <transaction-card
          v-for="transaction in reversedTransactions"
          :key="transaction.id"
          :message="transaction.message"
          :url="transaction.url"
          :address-from="transaction.addressFrom"
          :address-to="transaction.addressTo"
          :keyword="transaction.keyword"
          :timestamp="transaction.timestamp"
          :amount="transaction.amount"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import TransactionCard from "@/components/TransactionCard.vue"

const props = defineProps(['account', 'transactions'])

const reversedTransactions = computed(() => [...props.transactions].reverse())
</script>
