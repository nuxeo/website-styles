<svelte:options tag="nx-footer"/>

<script>
  export let year = new Date().getFullYear();
  export let showlicense = false;
  export let maxwidth = null;
  export let nolinks = false;
  let last_classes = () => nolinks === false ? 'row--last' : '';
  let max_width_style = maxwidth !== null ? 'max-width: ' + maxwidth + 'px;' : '';
</script>

<style lang="scss">
  @import '../scss/settings';
  @import './style/settings';
  @import './style/layout';
  @import './style/social';

  @mixin has-top-bar {
    border-top: 1px solid $c-black;
    padding-top: 13px;
  }

  // Defaults
  :host {
    --motion-speed: 0.2s;
    --motion-speed-slow: 0.4s;
    --motion-speed-notice: 0.8s;

    @media (prefers-reduced-motion) {
      --motion-speed: 0s;
      --motion-speed-slow: 0s;
      --motion-speed-notice: 0s;
    }
  }

  strong {
    font-weight: 600;
  }

  // span,
  a {
    color: $c-white;
    display: block;
    font-size: 14px;
    line-height: 1.6;
  }

  a {
    text-decoration: none;
    transition: color var(--motion-speed) ease;

    &:hover {
      color: $c-green;
    }
  }

  .strong {
    font-size: 16px;
    font-weight: $weight-bold;
  }

  svg {
    fill: currentColor;
    height: 1em;
    width: auto;
  }

  footer {
    background: $c-black;
    color: $c-white;
    padding: 50px 20px;

    &,
    * {
      font-family: $font-primary;

      @supports (font-variation-settings: normal) {
        font-family: $font-primary-var;
      }
    }
  }

  .sub-section,
  .has-top-bar {
    padding-top: 1rem;
  }

  .has-top-bar {
    padding-bottom: 1rem;

    &.has-top-bar--for-small {
      @include has-top-bar;
    }
  }

  .container {
    margin: 0 auto;
    max-width: $max-width;
  }

  .footer-icon {
    display: block;

    a {
      display: inline-block;
    }

    svg {
      line-height: 1;
      width: auto;
    }

    &.footer-icon--hyland {
      a:hover {
        color: $c-green-hyland;
      }

      svg {
        margin-left: -5px;
        font-size: 28px;
      }
    }

    &.footer-icon--nuxeo {
      a {
        path {
          transition: fill var(--motion-speed) ease;
        }

        .nsvglogo-x{
          fill: $c-green;
        }

        .nsvglogo{
          fill: $c-white;
        }

        &:hover {
          .nsvglogo-x {
            fill: $c-green;
          }

          .nsvglogo {
            fill: $c-green;
          }
        }
      }

      svg {
        font-size: 14px;
      }

    }
  }

  .text-justify {
    text-align: justify;
  }

  .legal-container {
    font-size: 11px;

    a {
      display: inline-block;
      font-size: 11px;
      margin-right: 2em;
    }
  }

  .row.row--last {
    margin-top: 2rem;
  }

  // Medium
  @media (min-width: 40em) {
    .has-top-bar {
      @include has-top-bar;
    }
  }

  // Large
  @media (min-width: 64em) {
  }
</style>

<footer>
  <div class="container" style="{max_width_style}">
    <div class="footer-icon footer-icon--hyland">
      <a href="https://www.hyland.com/" aria-label="Hyland">
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 297.47 97.97" xml:space="preserve" fill="#6abf4b"><path d="M10.38 69.13l7.28-1.29V10.9l-7.11-.77V5.91h22.52v4.22l-7.02.73v26.87h33.03V10.86l-7.11-.73V5.91h22.39v4.22l-6.93.73v56.98l7.41 1.29v3.66H51.69v-3.66l7.41-1.25V42.81H26.06v25.02l7.41 1.29v3.66H10.38v-3.65z"/><path d="M78.25 87.39c.49.14 1.05.26 1.7.34.64.09 1.23.13 1.74.13 1.03 0 2.15-.19 3.36-.56 1.21-.37 2.43-1.1 3.66-2.17 1.23-1.08 2.43-2.61 3.59-4.59 1.16-1.98 2.22-4.56 3.17-7.75h-1.85L76.36 29.94l-4.48-.78V24.6h19.94v4.57l-6.2.86 10.12 28.9 2.89 8.79 2.5-8.79 8.74-29.03-6.72-.73V24.6h18.6v4.57l-4.82.69c-1.92 5.57-3.61 10.47-5.06 14.69-1.45 4.22-2.71 7.88-3.79 10.98-1.08 3.1-2 5.73-2.76 7.88-.76 2.15-1.4 3.95-1.92 5.38-.52 1.44-.93 2.59-1.25 3.47-.32.88-.59 1.6-.82 2.17-1.12 2.87-2.25 5.45-3.38 7.75s-2.33 4.29-3.6 5.96c-1.26 1.68-2.62 3.06-4.07 4.13a13.266 13.266 0 01-4.84 2.26c-1.15.29-2.41.43-3.79.43-.29 0-.6-.02-.95-.04-.34-.03-.68-.07-1.01-.13-.33-.06-.62-.13-.88-.22s-.45-.17-.56-.26v-6.92z"/><path d="M119.36 69.13l7.32-.9V9.91l-6.89-1.55V4.61l13.48-1.81 1.72.99v64.43l7.67.9v3.66h-23.3v-3.65zM142.89 58.92c.2-2.01.84-3.77 1.94-5.28a16.01 16.01 0 014.05-3.9c1.61-1.09 3.4-2 5.36-2.71 1.96-.72 3.94-1.29 5.92-1.72 1.98-.43 3.89-.73 5.73-.9 1.84-.17 3.43-.26 4.78-.26V40.4c0-2.27-.3-4.11-.9-5.53-.6-1.42-1.44-2.53-2.5-3.34-1.06-.8-2.31-1.35-3.75-1.64-1.44-.29-2.99-.43-4.65-.43-.83 0-1.76.08-2.8.24-1.03.16-2.1.38-3.21.67-1.11.29-2.22.63-3.34 1.03-1.12.4-2.18.85-3.19 1.34l-1.59-3.88c1.06-.86 2.36-1.61 3.9-2.26 1.54-.65 3.12-1.18 4.74-1.62 1.62-.43 3.2-.75 4.74-.95 1.54-.2 2.85-.3 3.94-.3 2.27 0 4.43.24 6.48.71 2.05.47 3.85 1.31 5.4 2.5 1.55 1.19 2.78 2.8 3.68 4.82.91 2.02 1.36 4.6 1.36 7.73l-.09 29.63h5.51v2.84c-1.01.55-2.25.99-3.73 1.33-1.48.34-2.97.52-4.46.52-.52 0-1.08-.04-1.68-.11-.6-.07-1.16-.25-1.66-.54-.5-.29-.92-.73-1.25-1.33-.33-.6-.5-1.44-.5-2.5v-1.21c-.66.8-1.44 1.55-2.35 2.24-.91.69-1.94 1.29-3.1 1.81-1.16.52-2.48.92-3.96 1.21-1.48.29-3.12.43-4.93.43-2.24 0-4.27-.4-6.09-1.21-1.83-.8-3.35-1.89-4.57-3.25a12.983 12.983 0 01-2.71-4.74c-.57-1.78-.75-3.68-.52-5.69zm8.35.17c0 1.7.23 3.13.69 4.31.46 1.18 1.13 2.13 2 2.86.88.73 1.94 1.26 3.21 1.59 1.26.33 2.68.5 4.26.5.86 0 1.74-.12 2.63-.34.89-.23 1.75-.52 2.56-.86.82-.34 1.58-.74 2.28-1.18.7-.44 1.27-.88 1.7-1.31 0-2.7.01-5.38.02-8.03.01-2.66.04-5.33.06-8.03-1.2 0-2.53.07-3.96.19-1.44.13-2.87.35-4.31.67-1.44.32-2.83.73-4.18 1.25-1.35.52-2.54 1.17-3.57 1.96-1.03.79-1.86 1.71-2.48 2.78-.6 1.04-.91 2.26-.91 3.64zM185.91 69.13l5.86-.86v-35.1l-6.12-3.36v-2.67l11.46-3.4 1.94.86v6.16c.97-.83 2.15-1.66 3.53-2.48 1.38-.82 2.84-1.56 4.39-2.22 1.55-.66 3.14-1.2 4.78-1.62 1.64-.42 3.19-.65 4.65-.71 2.67-.09 4.91.24 6.72.97 1.81.73 3.27 1.92 4.39 3.57 1.12 1.65 1.92 3.77 2.41 6.35.49 2.58.73 5.68.73 9.3v24.33l6.93.86v3.66h-21.71v-3.66l6.5-.9V45.44c0-2.61-.13-4.91-.39-6.89-.26-1.98-.77-3.62-1.53-4.91a6.823 6.823 0 00-3.17-2.84c-1.35-.6-3.12-.86-5.3-.78-1.78.09-3.66.48-5.64 1.18-1.98.7-4.06 1.8-6.24 3.29v33.72l6.42.9v3.66h-20.63v-3.64zM254.39 73.82c-2.41 0-4.75-.48-7.02-1.44-2.27-.96-4.27-2.44-6.01-4.44-1.74-2-3.14-4.52-4.2-7.58-1.06-3.06-1.59-6.68-1.59-10.88 0-3.85.64-7.39 1.94-10.62 1.29-3.23 3.06-6.01 5.3-8.33 2.24-2.33 4.87-4.14 7.9-5.45 3.03-1.31 6.28-1.96 9.76-1.96 1.52 0 3 .1 4.43.3 1.44.2 2.67.47 3.71.82V9.91l-9.17-1.55V4.61l15.5-1.81 1.94.99v65.33h5.82v3.23c-.49.26-1.1.5-1.83.73a25.521 25.521 0 01-4.83.99c-.85.09-1.64.13-2.39.13-.52 0-1.06-.04-1.62-.11a3.69 3.69 0 01-1.53-.54c-.46-.29-.84-.73-1.14-1.34-.3-.6-.45-1.43-.45-2.5v-1.08c-.43.49-1.06 1.03-1.9 1.64-.83.6-1.87 1.16-3.1 1.68-1.24.52-2.65.96-4.24 1.31-1.6.38-3.36.56-5.28.56zm3.32-5.9c.92 0 1.77-.05 2.56-.15.79-.1 1.53-.24 2.22-.41 1.41-.35 2.61-.8 3.62-1.38 1-.57 1.84-1.19 2.5-1.85V31.19c-.32-.37-.7-.76-1.16-1.16-.46-.4-1.06-.78-1.79-1.12-.73-.34-1.61-.62-2.63-.84-1.02-.22-2.22-.32-3.59-.32-1.09 0-2.23.14-3.4.41-1.18.27-2.34.72-3.49 1.36-1.15.63-2.24 1.45-3.27 2.45-1.03 1.01-1.95 2.23-2.76 3.68-.81 1.45-1.45 3.14-1.94 5.08s-.75 4.16-.78 6.65c-.06 3.53.3 6.59 1.08 9.17s1.81 4.72 3.12 6.4c1.31 1.68 2.8 2.93 4.5 3.75 1.69.81 3.43 1.22 5.21 1.22zM284.97 2.9c2.86 0 5.25 2.25 5.25 5.21 0 3.01-2.4 5.27-5.25 5.27-2.87 0-5.28-2.26-5.28-5.27 0-2.96 2.41-5.21 5.28-5.21zm0 9.7c2.42 0 4.3-1.93 4.3-4.5 0-2.51-1.88-4.44-4.3-4.44-2.45 0-4.33 1.93-4.33 4.44 0 2.57 1.88 4.5 4.33 4.5zm-2.04-7.53h2.37c1.46 0 2.14.57 2.14 1.75 0 1.11-.7 1.57-1.61 1.67l1.75 2.7h-1.02l-1.67-2.63h-1.01v2.63h-.95V5.07zm.95 2.71h.99c.84 0 1.61-.04 1.61-1.01 0-.81-.7-.94-1.34-.94h-1.26v1.95z"/></svg>
      </a>
    </div>
    <div class="footer-icon footer-icon--nuxeo">
      <a href="https://www.nuxeo.com/" aria-label="Nuxeo">
        <svg aria-label="Nuxeo Logo" viewBox="0 0 128 24" height="24" xmlns="http://www.w3.org/2000/svg"><path class="nsvglogo" d="M0,0 18,0 24,6 24,24 18,24 18,6 6,6 6,24 0,24M26,0 32,0 32,18 44,18 44,0 50,0 50,24 32,24 26,18M78,0 102,0 102,6 84,6 84,9 102,9 102,15 84,15 84,18 102,18 102,24 78,24M104,0 122,0 128,6 128,24 110,24 104,18 104,0 110,6 110,18 122,18 122,6 110,6z"/><path class="nsvglogo-x" d="M52,0 57,0 76,19 76,24 71,24 52,5M52,24 52,19 71,0 76,0 76,5 57,24z"/></svg>
      </a>
    </div>
    {#if nolinks === false}
    <div class="row small-up-2 medium-up-3 large-up-6 main-section">
      <div class="column">
        <div class="has-top-bar has-top-bar--for-small">
          <a href="https://www.nuxeo.com/about/" class="strong">About</a>
        </div>
      </div>
      <div class="column">
        <div class="has-top-bar has-top-bar--for-small">
          <a href="https://www.nuxeo.com/products/" class="strong">Products</a>
        </div>
      </div>
      <div class="column">
        <div class="has-top-bar has-top-bar--for-small">
          <a class="strong" href="https://www.nuxeo.com/customers/">Customers</a>
        </div>
      </div>
      <div class="column">
        <div class="has-top-bar has-top-bar--for-small">
          <a href="https://www.nuxeo.com/services/" class="strong">Services</a>
        </div>
      </div>
      <div class="column">
        <div class="has-top-bar has-top-bar--for-small">
          <a href="https://www.nuxeo.com/learn/" class="strong">Learn</a>
        </div>
      </div>
      <div class="column">
        <div class="has-top-bar has-top-bar--for-small">
          <a href="https://www.nuxeo.com/contact/" class="strong">Contact Us</a>
        </div>
      </div>
    </div>
    {/if}
    <div class="row {last_classes()}">
      <div class="columns small-12 legal-container">
        <div class="has-top-bar has-top-bar--for-small text-justify">
          <strong>&copy;{year} Hyland Software, Inc. and its affiliates.</strong> All rights reserved. All Hyland product names are registered or unregistered trademarks of Hyland Software, Inc. or its affiliates in the United States and other countries.
        </div>
      </div>
      <div class="columns small-12 medium-8 large-10 legal-container">
          <a href="https://www.nuxeo.com/legal/privacy-policy/">Privacy Policy</a>
          <a href="https://www.nuxeo.com/about/data-privacy/">Data Privacy</a>
          {#if showlicense !== false}
            <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0;vertical-align: sub;" src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png"></a>
          {/if}
        </div>
      <div class="columns small-12 medium-4 large-2">
        <div class="social-container has-top-bar has-top-bar--for-small">
          <a target="_blank" rel="noopener" href="https://github.com/nuxeo/">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 22.43">
              <path
              d="M11.5,0A11.5,11.5,0,0,0,7.86,22.41c.58.11.76-.23.76-.54s0-1,0-2c-3.2.69-3.86-1.52-3.86-1.52a3,3,0,0,0-1.28-1.68c-1-.72.08-.7.08-.7a2.42,2.42,0,0,1,1.76,1.18,2.46,2.46,0,0,0,3.35,1,2.5,2.5,0,0,1,.73-1.54c-2.55-.29-5.24-1.27-5.24-5.68A4.44,4.44,0,0,1,5.35,7.81a4.09,4.09,0,0,1,.11-3s1-.31,3.16,1.18a10.83,10.83,0,0,1,5.76,0c2.2-1.49,3.16-1.18,3.16-1.18a4.09,4.09,0,0,1,.11,3,4.44,4.44,0,0,1,1.19,3.09c0,4.42-2.69,5.39-5.25,5.67a2.74,2.74,0,0,1,.78,2.12v3.19c0,.3.19.64.77.53A11.5,11.5,0,0,0,11.5,0Z"></path>
            </svg>
          </a>
          <a target="_blank" rel="noopener" href="https://www.linkedin.com/groups/43314/">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
              <path
              d="M12,0A12,12,0,1,0,24,12,12,12,0,0,0,12,0ZM9.52,17.77H6.34V9.52H9.52ZM7.92,8.24h0A1.55,1.55,0,0,1,6.33,6.67,1.53,1.53,0,0,1,7.94,5.14a1.55,1.55,0,1,1,0,3.1Zm11.75,9.53H16.5V13.32a1.27,1.27,0,0,0-2.54,0v4.45H10.79s0-7.62,0-8.26H14v1a3.91,3.91,0,0,1,2.5-.92c1.88,0,3.21,1.36,3.21,4Z"></path>
            </svg>
          </a>
        </div>
      </div>
    </div>

  </div>
</footer>
