<template>
  <main class="min-h-screen">
    <div class="gradient-bg-welcome">
      <app-navbar />
      <app-welcome
        :account="account"
        :is-loading="isTransactionSending"
        @set-account="setAccount"
        @send-eth="sendEth"
      />
    </div>

    <app-transactions :account="account" :transactions="transactions" />
    <app-footer />
  </main>
</template>

<script setup>
import { ethers } from 'ethers'
import { CONTRACT_ABI, CONTRACT_ADDRESS } from '@/constants'

import AppNavbar from '@/components/AppNavbar.vue'
import AppTransactions from '@/components/AppTransactions.vue'
import AppWelcome from '@/components/AppWelcome.vue'
import AppFooter from '@/components/AppFooter.vue'

const account = ref(null)
const transactions = ref([])
const isTransactionSending = ref(false)

const createContract = () => {
  let provider = new ethers.providers.Web3Provider(window.ethereum)
  let signer = provider.getSigner()
  const contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer)

  return contract
}

const checkIfWalletIsConnected = async () => {
  try {
    const { ethereum } = window
    if (!ethereum) {
      return
    }

    const accounts = await ethereum.request({ method: 'eth_accounts' })
    if (accounts.length !== 0) {
      console.log("Found an authorized account:", accounts[0])
      setAccount(accounts[0])
    } else {
      console.log("No authorized account found")
    }
  } catch (error) {
    console.log(error)
  }
}

const setAccount = (value) => {
  account.value = value
  getAllMessages()
}

const sendEth = async (formData) => {
  try {
    const { address, amount, keyword, message } = formData
    const transactionsContract = createContract()
    const parsedAmount = ethers.utils.parseEther(amount.toString())

    await ethereum.request({
      method: "eth_sendTransaction",
      params: [{
        from: account.value,
        to: address,
        gas: "0x5208",
        value: parsedAmount._hex,
      }],
    })

    const transactionHash = await transactionsContract.addToBlockchain(address, parsedAmount, message, keyword)

    isTransactionSending.value = true
    console.log(`Loading - ${transactionHash.hash}`)
    await transactionHash.wait()
    console.log(`Success - ${transactionHash.hash}`)
  } catch (error) {
    console.log(error)
  } finally {
    isTransactionSending.value = false
  }
}

const transformMessage = (message) => ({
  addressTo: message.receiver,
  addressFrom: message.sender,
  timestamp: new Date(message.timestamp.toNumber() * 1000).toLocaleString(),
  message: message.message,
  keyword: message.keyword,
  amount: parseInt(message.amount._hex) / (10 ** 18)
})


const onMessageAdded = (from, receiver, amount, message, timestamp, keyword) => {
  const transaction = transformMessage({ from, receiver, amount, message, timestamp, keyword  })
  transactions.value.push(transaction)
}

const getAllMessages = async () => {
  try {
    const transactionsContract = createContract()

    const availableMessages = await transactionsContract.getAllMessages()

    const structuredMessages = availableMessages.map(transformMessage)

    transactions.value = structuredMessages
  } catch (error) {
    console.log(error)
  }
}


onMounted(async () => {
  await checkIfWalletIsConnected()
  createContract().on('Transfer', onMessageAdded)
})

onBeforeUnmount(() => {
  createContract().off('Transfer', onMessageAdded)
})
</script>
