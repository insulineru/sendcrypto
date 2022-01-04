<template>
  <main class="min-h-screen">
    <div class="gradient-bg-welcome">
      <app-navbar />
      <app-welcome />
    </div>

    <app-services />
    <app-transactions />
    <app-footer />
  </main>
</template>

<script setup>
import AppNavbar from '@/components/AppNavbar.vue'
import AppServices from '@/components/AppServices.vue'
import AppTransactions from '@/components/AppTransactions.vue'
import AppWelcome from '@/components/AppWelcome.vue'
import AppFooter from '@/components/AppFooter.vue'
</script>
