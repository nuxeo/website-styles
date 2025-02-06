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
          width="80"
          src="https://particle.hyland.com/assets/logos/hyland-inverse.svg"
          alt="Hyland"
        />
      </a>
    </div>
    <div class="footer-icon footer-icon--nuxeo">
      <a href="https://www.nuxeo.com/" aria-label="Nuxeo">
        <svg viewBox="0 0 128 24" xmlns="http://www.w3.org/2000/svg"
          ><path
            class="nsvglogo"
            d="M0,0 18,0 24,6 24,24 18,24 18,6 6,6 6,24 0,24M26,0 32,0 32,18 44,18 44,0 50,0 50,24 32,24 26,18M78,0 102,0 102,6 84,6 84,9 102,9 102,15 84,15 84,18 102,18 102,24 78,24M104,0 122,0 128,6 128,24 110,24 104,18 104,0 110,6 110,18 122,18 122,6 110,6z"
          /><path
            class="nsvglogo-x"
            d="M52,0 57,0 76,19 76,24 71,24 52,5M52,24 52,19 71,0 76,0 76,5 57,24z"
          /></svg
        >
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
