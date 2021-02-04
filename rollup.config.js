import svelte from 'rollup-plugin-svelte';
import resolve from '@rollup/plugin-node-resolve';
import commonjs from '@rollup/plugin-commonjs';
import { terser } from 'rollup-plugin-terser';
import sveltePreprocess from 'svelte-preprocess';

const production = !process.env.ROLLUP_WATCH;

const source = 'components';
const output_js = production
  ? 'static/components/v1/bundle.min.js'
  : 'demo/build/bundle.js';

const preprocess = sveltePreprocess({
  scss: {
    includePaths: [source]
  },
  postcss: {
    plugins: [
      require('autoprefixer'),
      require('cssnano')({
        preset: 'default'
      })
    ]
  }
});

export default {
  input: `${source}/main.js`,
  output: {
    sourcemap: true,
    format: 'iife',
    name: 'app',
    file: output_js
  },
  plugins: [
    svelte({
      // enable run-time checks when not in production
      dev: !production,
      customElement: true,
      generate: 'dom',
      preprocess
    }),

    // If you have external dependencies installed from
    // npm, you'll most likely need these plugins. In
    // some cases you'll need additional configuration —
    // consult the documentation for details:
    // https://github.com/rollup/rollup-plugin-commonjs
    resolve({
      browser: true,
      dedupe: (importee) => importee === 'svelte' || importee.startsWith('svelte/')
    }),
    commonjs(),

    // If we're building for production (npm run build
    // instead of npm run dev), minify
    production && terser()
  ],
  watch: {
    clearScreen: false
  }
};
