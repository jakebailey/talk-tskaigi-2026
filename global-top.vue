<template>
  <div
    v-if="currentPage > 1"
    class="progress-bar"
    :style="`width: ${progressPercentage}%`"
  ></div>
</template>

<script setup>
import { computed } from 'vue'
import { useNav } from '@slidev/client'

const { currentPage, total } = useNav()

const progressPercentage = computed(() => {
  if (!total.value || total.value <= 1) return 0
  return ((currentPage.value - 1) / (total.value - 1)) * 100
})
</script>

<style>
.progress-bar {
  position: fixed;
  top: 0;
  left: 0;
  height: 4px;
  background: var(--slidev-theme-primary, #5d8392);
  transition: width 0.3s ease;
  z-index: 1000;
  pointer-events: none;
}
</style>
