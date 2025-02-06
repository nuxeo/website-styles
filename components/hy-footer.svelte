<svelte:options tag="hy-footer" />

<script>
  export let year = new Date().getFullYear();
  export let maxwidth = null;
  export let padding_size = null;
  let max_width_style = maxwidth !== null ? '--container-max: ' + maxwidth + 'px;' : '';

  const name = 'hy-footer';
</script>

<div class={name}>
  <div
    class="{name}__container"
    style="{max_width_style} {padding_size ? `--padding-size: ${padding_size};` : ''}"
  >
    <p class="{name}__copyright-text">
      &copy;{year} Hyland Software, Inc. and its affiliates. All rights reserved.
    </p>
    <ul class="{name}__legal-links">
      <li>
        <a href="https://www.hyland.com/en/legal/privacy-policies"> Privacy </a>
      </li>
      <li>
        <a href="https://www.hyland.com/en/legal/privacy-policies/cookie-policy">
          Cookie Policy
        </a>
      </li>
      <li>
        <a href="https://www.hyland.com/en/legal/do-not-sell-share-personal-info">
          Do Not Sell or Share My Personal Information
        </a>
      </li>
      <li>
        <a href="https://www.hyland.com/en/legal/terms-of-use"> Terms of Use</a>
      </li>
      <li>
        <a href="https://www.hyland.com/en/legal/hyland-trust-center">
          Security and Compliance</a
        >
      </li>
      <li>
        <a href="https://www.hyland.com/en/legal"> Legal and Compliance </a>
      </li>
    </ul>
  </div>
</div>

<style lang="scss">
  @import '../scss/settings';
  @import './style/settings';

  $name: '.hy-footer';

  :global(*) {
    font: inherit;
  }

  #{$name} {
    background: $c-footer-bk;
    color: $c-white;
    font-family: $font-primary;
    line-height: 1.8;
    font-size: 0.875rem;

    @supports (font-variation-settings: normal) {
      font-family: $font-primary-var;
    }

    &__container {
      width: min(100% - var(--padding-size, 8rem), var(--container-max, 1600px));
      padding-block: 3rem 2rem;
      margin-inline: auto;
    }

    &__copyright-text {
      text-align: center;
      opacity: 0.7;
      font-weight: 400;
    }

    &__legal-links {
      list-style-type: none;
      padding: 0;
      margin-inline: 0;
      margin-block: 20px;

      @media (min-width: 992px) {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;

        li:not(:last-of-type):after {
          content: '';
          margin-inline: 0.5rem;
          vertical-align: middle;
          border-inline-end: 1.5px solid rgba(255, 255, 255, 0.7);
        }
      }

      @media (max-width: 768px) {
        li + li {
          margin-block-start: 1rem;
        }
      }
    }

    a {
      color: $c-white;
      text-decoration: none;
      font-weight: 600;

      &:hover {
        text-decoration: underline;
        text-underline-offset: 2px;
      }
      &:focus-visible {
        outline: 1.5px solid currentColor;
        outline-offset: 0.25rem;
        border-radius: 1px;
      }
    }
  }
</style>
