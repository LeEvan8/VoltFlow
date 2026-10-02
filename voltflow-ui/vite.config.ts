import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
  build: {
    // The ELK layout engine (~1.4 MB) is lazy-loaded as its own chunk (see src/layout.ts);
    // the application bundle itself stays well below the default 500 kB.
    chunkSizeWarningLimit: 1500,
  },
})