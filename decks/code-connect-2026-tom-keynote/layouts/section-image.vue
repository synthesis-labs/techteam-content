<template>
  <div class="slidev-layout section-image">
    <div class="si-text">
      <div v-if="$frontmatter.number" class="si-number">{{ $frontmatter.number }}</div>
      <div class="si-rule" />
      <h1 class="si-title">{{ $frontmatter.title }}</h1>
      <div v-if="$frontmatter.subtitle" class="si-subtitle">{{ $frontmatter.subtitle }}</div>
    </div>
    <div class="si-media">
      <img v-if="$frontmatter.image" :src="$frontmatter.image" :alt="$frontmatter.imageAlt || ''" class="si-img" />
      <slot v-else />
    </div>
  </div>
</template>

<style scoped>
.section-image {
  background: var(--deck-navy);
  color: white;
  height: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: minmax(0, 1fr);
  align-items: center;
  gap: 3rem;
  padding: 4rem 5rem;
}
.si-text {
  display: flex;
  flex-direction: column;
  justify-content: center;
  min-width: 0;
  min-height: 0;
}
.si-number {
  font-size: 6rem;
  font-weight: 700;
  color: var(--deck-blue-accent);
  line-height: 1;
}
.si-rule {
  width: 64px;
  height: 3px;
  background: white;
  margin: 1.5rem 0;
}
.si-title {
  font-size: 3rem;
  color: white;
  font-weight: 600;
  margin: 0;
  line-height: 1.1;
}
.si-subtitle {
  margin-top: 1rem;
  color: var(--deck-blue-pale);
  font-size: 1.25rem;
}
.si-media {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  min-width: 0;
  min-height: 0;
}
.si-img {
  max-width: 100%;
  max-height: 100%;
  border-radius: 8px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
  object-fit: contain;
}
</style>
