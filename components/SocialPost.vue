<script setup>
const props = defineProps({
  platform: { type: String, default: 'bluesky' }, // 'bluesky' | 'twitter'
  avatar: { type: String, required: true },
  name: { type: String, required: true },
  handle: { type: String, required: true },
  date: { type: String, default: '' },
  bare: { type: Boolean, default: false },
})
</script>

<template>
  <div class="social-post" :class="[platform, { 'has-reply': $slots.reply, bare }]">
    <svg v-if="$slots.reply && platform === 'bluesky'" class="thread-platform-icon" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#1185FE" viewBox="0 0 24 24"><path d="M5.202 2.857C7.954 4.922 10.913 9.11 12 11.358c1.087-2.247 4.046-6.436 6.798-8.501C20.783 1.366 24 .213 24 3.883c0 .732-.42 6.156-.667 7.037-.856 3.061-3.978 3.842-6.755 3.37 4.854.826 6.089 3.562 3.422 6.299-5.065 5.196-7.28-1.304-7.847-2.97-.104-.305-.152-.448-.153-.327 0-.121-.05.022-.153.327-.568 1.666-2.782 8.166-7.847 2.97-2.667-2.737-1.432-5.473 3.422-6.3-2.777.473-5.899-.308-6.755-3.369C.42 10.04 0 4.615 0 3.883c0-3.67 3.217-2.517 5.202-1.026"/></svg>
    <svg v-if="$slots.reply && platform === 'twitter'" class="thread-platform-icon" xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
    <div class="post-thread-layout" v-if="$slots.reply">
      <div class="thread-avatar-col">
        <img :src="avatar" :alt="name" class="post-avatar" />
        <div class="thread-line"></div>
      </div>
      <div class="thread-content-col">
        <div class="post-header-inline">
          <span class="post-name">{{ name }}</span>
          <span class="post-handle">{{ handle }}</span>
          <span v-if="date" class="post-date">· {{ date }}</span>
        </div>
        <div class="post-body">
          <slot />
        </div>
      </div>
      <div class="thread-reply-row">
        <slot name="reply" />
      </div>
    </div>
    <div v-else>
      <div class="post-header">
        <img :src="avatar" :alt="name" class="post-avatar" />
        <div class="post-author">
          <span class="post-name">{{ name }}</span>
          <span class="post-handle">{{ handle }}</span>
        </div>
        <svg v-if="platform === 'bluesky'" class="post-platform-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#1185FE" viewBox="0 0 24 24"><path d="M5.202 2.857C7.954 4.922 10.913 9.11 12 11.358c1.087-2.247 4.046-6.436 6.798-8.501C20.783 1.366 24 .213 24 3.883c0 .732-.42 6.156-.667 7.037-.856 3.061-3.978 3.842-6.755 3.37 4.854.826 6.089 3.562 3.422 6.299-5.065 5.196-7.28-1.304-7.847-2.97-.104-.305-.152-.448-.153-.327 0-.121-.05.022-.153.327-.568 1.666-2.782 8.166-7.847 2.97-2.667-2.737-1.432-5.473 3.422-6.3-2.777.473-5.899-.308-6.755-3.369C.42 10.04 0 4.615 0 3.883c0-3.67 3.217-2.517 5.202-1.026"/></svg>
        <svg v-else-if="platform === 'twitter'" class="post-platform-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
      </div>
      <div class="post-body">
        <slot />
      </div>
      <div v-if="$slots.quote" class="post-quote">
        <slot name="quote" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.social-post {
  position: relative;
  background: rgba(10, 10, 10, 0.9);
  border-radius: 16px;
  padding: 20px 24px;
  color: #e6e6e6;
  font-family: 'Inter', var(--slidev-font-sans), sans-serif;
  max-width: 540px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.4);
  border: 1px solid rgba(255, 255, 255, 0.08);
}

.thread-platform-icon {
  position: absolute;
  top: 20px;
  right: 24px;
  box-shadow: none;
  border-radius: 0;
}

.social-post.bare .post-platform-icon {
  display: none;
}

html:not(.dark) .social-post {
  background: #fff;
  color: #0f1419;
  border: 1px solid #e1e8ed;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
}

.social-post.bare {
  background: none !important;
  border: none !important;
  padding: 0 !important;
  box-shadow: none !important;
}

.social-post.bare .post-body {
  margin-left: 54px;
}

.post-header {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 12px;
}

.post-avatar {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  object-fit: cover;
  flex-shrink: 0;
  box-shadow: none;
}

.post-author {
  display: flex;
  flex-direction: column;
  flex: 1;
  min-width: 0;
  gap: 1px;
}

.post-name {
  font-weight: 700;
  font-size: 0.95rem;
  line-height: 1.3;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.post-handle {
  font-size: 0.85rem;
  opacity: 0.6;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.post-platform-icon {
  position: absolute;
  top: 14px;
  right: 18px;
  flex-shrink: 0;
  box-shadow: none;
  border-radius: 0;
}

.post-body {
  font-size: 1.05rem;
  line-height: 1.45;
  white-space: pre-wrap;
}

.post-body :deep(p) {
  margin: 0;
}

.post-body :deep(ul),
.post-body :deep(ol) {
  margin: 4px 0;
  padding-left: 1.2em;
}

.post-quote {
  margin-top: 14px;
  border: 1px solid rgba(255, 255, 255, 0.12);
  border-radius: 12px;
  padding: 14px 16px;
  font-size: 0.92em;
}

html:not(.dark) .post-quote {
  border-color: #e1e8ed;
}

.post-quote :deep(.social-post) {
  background: none;
  border: none;
  padding: 0;
  box-shadow: none;
  max-width: none;
}

.post-quote :deep(.post-avatar) {
  width: 24px;
  height: 24px;
}

.post-quote :deep(.post-header) {
  margin-bottom: 8px;
}

.post-quote :deep(.post-name) {
  font-size: 0.85rem;
}

.post-quote :deep(.post-handle) {
  font-size: 0.8rem;
}

/* Thread layout */
.post-thread-layout {
  display: grid;
  grid-template-columns: 44px 1fr;
  gap: 0 12px;
}

.thread-avatar-col {
  display: flex;
  flex-direction: column;
  align-items: center;
  grid-row: 1;
  grid-column: 1;
}

.thread-avatar-col .post-avatar {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  object-fit: cover;
  flex-shrink: 0;
  box-shadow: none;
}

.thread-line {
  width: 3px;
  flex: 1;
  border-radius: 2px;
  margin: 6px 0;
  background: rgba(128, 128, 128, 0.3);
}

html:not(.dark) .thread-line {
  background: #cfd9de;
}

.thread-content-col {
  grid-row: 1;
  grid-column: 2;
  padding-bottom: 12px;
}

.post-header-inline {
  display: flex;
  align-items: center;
  gap: 6px;
  margin-bottom: 6px;
  flex-wrap: wrap;
}

.post-header-inline .post-name {
  font-weight: 700;
  font-size: 0.95rem;
}

.post-header-inline .post-handle {
  font-size: 0.85rem;
  opacity: 0.6;
}

.post-header-inline .post-date {
  font-size: 0.8rem;
  opacity: 0.5;
}

.thread-reply-row {
  grid-column: 1 / -1;
}

.social-post.bare .post-platform-icon {
  display: none !important;
}
</style>
