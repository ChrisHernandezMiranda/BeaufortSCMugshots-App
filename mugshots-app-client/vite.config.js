import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';  // Import the react plugin

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()], // Use the react plugin
  server: {
    proxy: {
      '/api': 'http://localhost:5000', // Proxy API requests to your back-end
    },
  },
});
