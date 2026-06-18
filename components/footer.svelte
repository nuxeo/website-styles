<svelte:options tag="nx-footer" />

<script>
  export let year = new Date().getFullYear();
  export let showlicense = false;
  export let maxwidth = null;
  export let nolinks = false;
  let max_width_style = maxwidth !== null ? 'max-width: ' + maxwidth + 'px;' : '';
</script>

<footer>
  <div class="container" style={max_width_style}>
    <div class="footer-icon footer-icon--hyland">
      <a href="https://www.hyland.com/">
        <img
          width="100"
          src="https://particle.hyland.com/assets/logos/wordmark-dark.svg"
          alt="Hyland"
        />
      </a>
    </div>
    <div class="footer-icon footer-icon--nuxeo">
      <a
        href="https://www.hyland.com/en/solutions/products/nuxeo-platform"
        aria-label="Nuxeo Platform"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          viewBox="1061 176.2 557.6 81.4"
          fill="#fff"
          ><path
            d="M1008.7 177.4h-26.2l-45.2 79.1h26.2zm135.6 78.9H1128l-49.3-55.5v55.5H1061v-79h18.6l46.8 53v-53h17.8zm36.4-36.3v-42.6h18.3v41.1c0 14 6.5 23 22.8 23s22.7-9 22.7-23v-41.1h18.3v42.5c0 23-13.6 37.7-41 37.7s-41.1-14.8-41.1-37.7m158-16.8 23-25.7h22.5L1350 215l37.4 41.2h-23.1l-25.8-29-26 29H1290l37.2-41.1-34.2-37.8h23zm156.1-25.7V193h-58.5v15.2h52.3v15.5h-52.3v16.8h58.5v15.7h-76.5v-79zm123.8 39.5c0 23.5-19.7 40.6-46.9 40.6s-47-17.1-47-40.6 19.7-40.7 47-40.7 46.9 17.1 46.9 40.7m-75.2 0c0 15 11.8 24.7 28.3 24.7s28.2-9.8 28.2-24.7-11.8-24.8-28.2-24.8-28.3 9.8-28.3 24.8M295.7 177v78.6h-18.3v-32.4h-47.6v32.4h-18.3V177h18.3v30.7h47.5V177zm94.5 0h21.5l-39 46v32.6h-18.4V223l-39.2-46h22l26.6 31.1zm41 0h18.3v63h53v15.6h-71.3zm150.9 0 39 78.6h-19.8l-8.3-16.8h-43l-8.4 16.8H522l39.4-78.6zm-24.8 46.7h28.4L571.5 195zm166.2 32h-16l-49.1-55.4v55.3h-17.8V177h18.5l46.7 52.7V177h17.7zm31-78.7h41c28.1 0 45.7 15.4 45.7 39.5s-17.6 39.6-45.7 39.6h-41zm40.6 63.3c17 0 27-9.4 27-23.8s-10-23.7-27.1-23.7h-22.7v47.5zm77-59.7v14.7h-4.3v-14.7h-8V177H880v3.6zm22.1 14.7-6.2-14v14h-4.2V177h6.5l5.7 13 5.7-13h6.3v18.3h-4.1v-14l-6.3 14z"
          /></svg
        >
      </a>
    </div>
    {#if nolinks === false}
      <div class="row small-up-2 medium-up-3 large-up-6 main-section">
        <div class="column">
          <div class="has-top-bar has-top-bar--for-small">
            <a href="https://www.hyland.com/en/company/about" class="strong">About</a>
          </div>
        </div>
        <div class="column">
          <div class="has-top-bar has-top-bar--for-small">
            <a href="https://www.hyland.com/en/solutions/products" class="strong"
              >Products</a
            >
          </div>
        </div>
        <div class="column">
          <div class="has-top-bar has-top-bar--for-small">
            <a class="strong" href="https://www.hyland.com/en/customers">Customers</a>
          </div>
        </div>
        <div class="column">
          <div class="has-top-bar has-top-bar--for-small">
            <a href="https://www.hyland.com/en/solutions/services" class="strong"
              >Services</a
            >
          </div>
        </div>
        <div class="column">
          <div class="has-top-bar has-top-bar--for-small">
            <a href="https://university.hyland.com/" class="strong">Learn</a>
          </div>
        </div>
        <div class="column">
          <div class="has-top-bar has-top-bar--for-small">
            <a href="https://www.hyland.com/en/contact-us" class="strong">Contact Us</a>
          </div>
        </div>
      </div>
    {/if}

    <div class="social-container">
      {#if showlicense !== false}
        <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"
          ><img
            alt="Creative Commons Licence"
            style="border-width:0;vertical-align: sub;"
            src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png"
          /></a
        >
      {/if}
      <a target="_blank" rel="noopener" href="https://github.com/nuxeo/">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 22.43">
          <path
            d="M11.5,0A11.5,11.5,0,0,0,7.86,22.41c.58.11.76-.23.76-.54s0-1,0-2c-3.2.69-3.86-1.52-3.86-1.52a3,3,0,0,0-1.28-1.68c-1-.72.08-.7.08-.7a2.42,2.42,0,0,1,1.76,1.18,2.46,2.46,0,0,0,3.35,1,2.5,2.5,0,0,1,.73-1.54c-2.55-.29-5.24-1.27-5.24-5.68A4.44,4.44,0,0,1,5.35,7.81a4.09,4.09,0,0,1,.11-3s1-.31,3.16,1.18a10.83,10.83,0,0,1,5.76,0c2.2-1.49,3.16-1.18,3.16-1.18a4.09,4.09,0,0,1,.11,3,4.44,4.44,0,0,1,1.19,3.09c0,4.42-2.69,5.39-5.25,5.67a2.74,2.74,0,0,1,.78,2.12v3.19c0,.3.19.64.77.53A11.5,11.5,0,0,0,11.5,0Z"
          ></path>
        </svg>
      </a>
      <a target="_blank" rel="noopener" href="https://www.linkedin.com/groups/43314/">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
          <path
            d="M12,0A12,12,0,1,0,24,12,12,12,0,0,0,12,0ZM9.52,17.77H6.34V9.52H9.52ZM7.92,8.24h0A1.55,1.55,0,0,1,6.33,6.67,1.53,1.53,0,0,1,7.94,5.14a1.55,1.55,0,1,1,0,3.1Zm11.75,9.53H16.5V13.32a1.27,1.27,0,0,0-2.54,0v4.45H10.79s0-7.62,0-8.26H14v1a3.91,3.91,0,0,1,2.5-.92c1.88,0,3.21,1.36,3.21,4Z"
          ></path>
        </svg>
      </a>
    </div>

    <slot></slot>
  </div>
</footer>

<style lang="scss">
  @import '../scss/settings';
  @import './style/settings';
  @import './style/layout';
  @import './style/social';

  @mixin has-top-bar {
    border-top: 1px solid $c-footer-bk;
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
    background: $c-footer-bk;
    color: $c-white;
    padding: 50px 20px 0;

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

        .nsvglogo-x {
          fill: $c-green;
        }

        .nsvglogo {
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
        font-size: 13px;
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
