<svelte:options tag="nx-footer"/>

<script>
  export let year = new Date().getFullYear();
  export let showlicense = false;
  export let nolinks = false;
  let last_classes = () => nolinks === false ? 'row--last' : '';
</script>

<style lang="scss">
  @import './style/settings';
  @import './style/layout';
  @import './style/social';

  @mixin has-top-bar {
    border-top: 1px solid $c-black;
    padding-top: 13px;
  }

  strong {
    font-weight: 600;
  }

  span,
  a {
    color: $c-black;
    display: block;
    font-size: 13px;
    line-height: 1.6;
  }

  a {
    text-decoration: none;
    transition: color 0.2s ease;

    &:hover {
      color: $c-blue;
    }
  }

  .strong {
    font-size: 16px;
    font-weight: $weight-medium;
  }

  .is-bg-grey {
    background: #f5f5f5;
  }

  svg {
    fill: currentColor;
    height: 1em;
    width: auto;
  }

  footer {
    padding: 50px 20px;

    &,
    * {
      font-family: $font-primary;
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
    max-width: 1600px;
  }

  .footer-icon {
    display: inline-block;
    margin-bottom: 20px;

    svg {
      font-size: 36px;
      line-height: 1;
      width: auto;
    }
  }

  .legal-container {
    font-size: 11px;
    padding-bottom: 1rem;

    a {
      display: inline-block;
      font-size: 11px;
      margin-left: 2em;
    }
  }

  .row.row--last {
    margin-top: 4rem;
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

<footer class="is-bg-grey">
  <div class="container">
    <div class="footer-icon">
      <a href="https://www.nuxeo.com/" title="Go to Nuxeo.com">
        <svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><rect fill="#73d2cf" class="nsvglogo-bg" width="16" height="16"></rect><path fill="#1f4cbf" class="nsvglogo-x" d="M3,3 5,3 13,11 13,13 11,13 3,5M3,13 3,11 11,3 13,3 13,5 5,13z"></path></svg>
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
    <div class="row {last_classes}">
      <div class="columns small-12 medium-8 large-10 legal-container">
        <div class="has-top-bar has-top-bar--for-small">
          <strong>{year} &copy; Nuxeo</strong>
          <a href="https://www.nuxeo.com/legal/privacy-policy/">Privacy Policy</a>
          <a href="https://www.nuxeo.com/about/gdpr/">GDPR</a>
          {#if showlicense !== false}
            <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0;vertical-align: sub;" src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png"></a>
          {/if}
        </div>
      </div>
      <div class="columns small-12 medium-4 large-2">
        <div class="social-container has-top-bar has-top-bar--for-small">
          <a target="_blank" rel="noopener" href="https://github.com/nuxeo">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 22.43">
              <path
              d="M11.5,0A11.5,11.5,0,0,0,7.86,22.41c.58.11.76-.23.76-.54s0-1,0-2c-3.2.69-3.86-1.52-3.86-1.52a3,3,0,0,0-1.28-1.68c-1-.72.08-.7.08-.7a2.42,2.42,0,0,1,1.76,1.18,2.46,2.46,0,0,0,3.35,1,2.5,2.5,0,0,1,.73-1.54c-2.55-.29-5.24-1.27-5.24-5.68A4.44,4.44,0,0,1,5.35,7.81a4.09,4.09,0,0,1,.11-3s1-.31,3.16,1.18a10.83,10.83,0,0,1,5.76,0c2.2-1.49,3.16-1.18,3.16-1.18a4.09,4.09,0,0,1,.11,3,4.44,4.44,0,0,1,1.19,3.09c0,4.42-2.69,5.39-5.25,5.67a2.74,2.74,0,0,1,.78,2.12v3.19c0,.3.19.64.77.53A11.5,11.5,0,0,0,11.5,0Z"></path>
            </svg>
          </a>
          <a target="_blank" rel="noopener" href="https://www.linkedin.com/groups/Nuxeo-Community-43314?home=&amp;gid=43314&amp;trk=anet_ug_hm">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
              <path
              d="M12,0A12,12,0,1,0,24,12,12,12,0,0,0,12,0ZM9.52,17.77H6.34V9.52H9.52ZM7.92,8.24h0A1.55,1.55,0,0,1,6.33,6.67,1.53,1.53,0,0,1,7.94,5.14a1.55,1.55,0,1,1,0,3.1Zm11.75,9.53H16.5V13.32a1.27,1.27,0,0,0-2.54,0v4.45H10.79s0-7.62,0-8.26H14v1a3.91,3.91,0,0,1,2.5-.92c1.88,0,3.21,1.36,3.21,4Z"></path>
            </svg>
          </a>
          <a target="_blank" rel="noopener" href="https://twitter.com/nuxeo">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 23.5">
              <path
              d="M12,0A11.89,11.89,0,0,0,0,11.75,11.89,11.89,0,0,0,12,23.5,11.89,11.89,0,0,0,24,11.75,11.89,11.89,0,0,0,12,0Zm5.26,9.19c0,.11,0,.22,0,.33a7.35,7.35,0,0,1-7.49,7.33,7.56,7.56,0,0,1-4-1.15,5.41,5.41,0,0,0,3.89-1.07,2.62,2.62,0,0,1-2.45-1.79,2.61,2.61,0,0,0,1.18-.05,2.58,2.58,0,0,1-2.11-2.52v0a2.68,2.68,0,0,0,1.19.33A2.59,2.59,0,0,1,6.28,8.41a2.48,2.48,0,0,1,.36-1.29,7.54,7.54,0,0,0,5.42,2.69A2.88,2.88,0,0,1,12,9.22a2.6,2.6,0,0,1,2.63-2.57,2.65,2.65,0,0,1,1.92.81c.6-.12,1.95-.26,1.95-.26C18.15,7.72,17.78,8.82,17.26,9.19Z"></path>
            </svg>
          </a>
          <a target="_blank" rel="noopener" href="https://www.instagram.com/nuxeo">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
              <defs>
                <style>
                  .cls-1 {
                    fill: none;
                  }
                </style>
              </defs>
              <rect class="cls-1" x="16" y="7" width="1" height="1"></rect>
              <path class="cls-1"
              d="M16.17,5H7.83A2.83,2.83,0,0,0,5,7.83v8.34A2.83,2.83,0,0,0,7.83,19h8.34A2.83,2.83,0,0,0,19,16.17V7.83A2.83,2.83,0,0,0,16.17,5ZM7,9.52H6V7.83A1.82,1.82,0,0,1,7,6.21Zm2-.64a5,5,0,0,0-.46.64H8V6H9Zm3,5.62a3,3,0,1,1,3-3A3,3,0,0,1,12,14.5Zm6-5H15.45A4,4,0,0,0,12,7.5a3.91,3.91,0,0,0-2,.56V6h6.17A1.83,1.83,0,0,1,18,7.83Z"></path>
              <path d="M8,9.52h.54A5,5,0,0,1,9,8.88V6H8Z"></path>
              <circle cx="12" cy="11.5" r="3"></circle>
              <path d="M16.17,6H10V8.06a3.91,3.91,0,0,1,2-.56,4,4,0,0,1,3.45,2H18V7.83A1.83,1.83,0,0,0,16.17,6ZM17,8H16V7h1Z"></path>
              <path d="M12,0A12,12,0,1,0,24,12,12,12,0,0,0,12,0Zm7,16.17A2.83,2.83,0,0,1,16.17,19H7.83A2.83,2.83,0,0,1,5,16.17V7.83A2.83,2.83,0,0,1,7.83,5h8.34A2.83,2.83,0,0,1,19,7.83Z"></path>
              <path d="M6,7.83v1.7H7V6.21A1.82,1.82,0,0,0,6,7.83Z"></path>
            </svg>
          </a>
          <a target="_blank" rel="noopener" href="https://www.facebook.com/Nuxeo">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
              <path d="M12,0A12,12,0,1,0,24,12,12,12,0,0,0,12,0Zm3.59,11.5H13.5v7h-3v-7h-2v-2h2V8.34c0-1.1.35-2.82,2.65-2.82H15.5V7.83H14.09a.57.57,0,0,0-.59.65v1h2.34Z"></path>
            </svg>
          </a>
        </div>
      </div>
    </div>

  </div>
</footer>
