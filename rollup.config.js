import { join } from 'path';
import svelte from 'rollup-plugin-svelte';
import resolve from '@rollup/plugin-node-resolve';
import commonjs from '@rollup/plugin-commonjs';
import { terser } from 'rollup-plugin-terser';
import sveltePreprocess from 'svelte-preprocess';

const production = !process.env.ROLLUP_WATCH;

const source = 'components';
const output_main_js = production
  ? 'static/components/v1/bundle.min.js'
  : 'demo/build/bundle.js';
const output_hyland_heritage_js = production
  ? 'static/components/v1/hyland-heritage.min.js'
  : 'demo/build/hyland-heritage.js';
const output_hy_blockquote_js = production
  ? 'static/components/v1/hy-blockquote.min.js'
  : 'demo/build/hy-blockquote.js';
const output_hy_footer_js = production
  ? 'static/components/v1/hy-footer.min.js'
  : 'demo/build/hy-footer.js';

const preprocess = sveltePreprocess({
  scss: {
    includePaths: [source, join(__dirname, 'node_modules', 'foundation-sites', 'scss')],
  },
  postcss: {
    plugins: [
      require('autoprefixer'),
      require('cssnano')({
        preset: 'default',
      }),
    ],
  },
});

export default [
  {
    input: `${source}/main.js`,
    output: {
      sourcemap: true,
      format: 'iife',
      name: 'app',
      file: output_main_js,
    },
    plugins: [
      svelte({
        // enable run-time checks when not in production
        preprocess,
        compilerOptions: {
          generate: 'dom',
          dev: !production,
          customElement: true,
        },
      }),

      // If you have external dependencies installed from
      // npm, you'll most likely need these plugins. In
      // some cases you'll need additional configuration —
      // consult the documentation for details:
      // https://github.com/rollup/rollup-plugin-commonjs
      resolve({
        browser: true,
        dedupe: (importee) => importee === 'svelte' || importee.startsWith('svelte/'),
      }),
      commonjs(),

      // If we're building for production (npm run build
      // instead of npm run dev), minify
      production && terser(),
    ],
    watch: {
      clearScreen: false,
    },
  },
  {
    input: `${source}/hyland-heritage.js`,
    output: {
      sourcemap: true,
      format: 'iife',
      name: 'app',
      file: output_hyland_heritage_js,
    },
    plugins: [
      svelte({
        // enable run-time checks when not in production
        preprocess,
        compilerOptions: {
          generate: 'dom',
          dev: !production,
          customElement: true,
        },
      }),

      // If you have external dependencies installed from
      // npm, you'll most likely need these plugins. In
      // some cases you'll need additional configuration —
      // consult the documentation for details:
      // https://github.com/rollup/rollup-plugin-commonjs
      resolve({
        browser: true,
        dedupe: (importee) => importee === 'svelte' || importee.startsWith('svelte/'),
      }),
      commonjs(),

      // If we're building for production (npm run build
      // instead of npm run dev), minify
      production && terser(),
    ],
    watch: {
      clearScreen: false,
    },
  },
  {
    input: `${source}/hy-blockquote.js`,
    output: {
      sourcemap: true,
      format: 'iife',
      name: 'app',
      file: output_hy_blockquote_js,
    },
    plugins: [
      svelte({
        // enable run-time checks when not in production
        preprocess,
        compilerOptions: {
          generate: 'dom',
          dev: !production,
          customElement: true,
        },
      }),

      // If you have external dependencies installed from
      // npm, you'll most likely need these plugins. In
      // some cases you'll need additional configuration —
      // consult the documentation for details:
      // https://github.com/rollup/rollup-plugin-commonjs
      resolve({
        browser: true,
        dedupe: (importee) => importee === 'svelte' || importee.startsWith('svelte/'),
      }),
      commonjs(),

      // If we're building for production (npm run build
      // instead of npm run dev), minify
      production && terser(),
    ],
    watch: {
      clearScreen: false,
    },
  },
  {
    input: `${source}/hy-footer.js`,
    output: {
      sourcemap: true,
      format: 'iife',
      name: 'app',
      file: output_hy_footer_js,
    },
    plugins: [
      svelte({
        // enable run-time checks when not in production
        preprocess,
        compilerOptions: {
          generate: 'dom',
          dev: !production,
          customElement: true,
        },
      }),

      // If you have external dependencies installed from
      // npm, you'll most likely need these plugins. In
      // some cases you'll need additional configuration —
      // consult the documentation for details:
      // https://github.com/rollup/rollup-plugin-commonjs
      resolve({
        browser: true,
        dedupe: (importee) => importee === 'svelte' || importee.startsWith('svelte/'),
      }),
      commonjs(),

      // If we're building for production (npm run build
      // instead of npm run dev), minify
      production && terser(),
    ],
    watch: {
      clearScreen: false,
    },
  },
];
