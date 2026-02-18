<svelte:options tag="hyland-logo-heritage" />

<script>
  export let name;
  export let hylandlang = 'en';
  export let homepath = '/';
</script>

<div class="title-bar title-bar--logos">
  <a href="https://www.hyland.com/{hylandlang}/" aria-label="Hyland">
    <span class="main-menu--hyland-logo">
      <img
        height="24"
        src="https://particle.hyland.com/assets/logos/horizontal-brand.svg"
        alt="Hyland"
      /></span
    >
  </a><a href={homepath} aria-label={name}>
    <span class="main-menu--logo"><slot></slot></span>
  </a>
</div>

<style lang="scss">
  @import './style/settings';

  svg {
    height: 1em;
    width: auto;
  }

  .title-bar--logos {
    display: flex;

    a {
      // display: inline;
      line-height: 1;
      // padding: 11px 0 7px;
      padding: 0;
      height: auto;
    }
  }

  .main-menu--logo {
    display: inline-block;
    font-size: rem-calc(19);
    padding: 22px 0 12px 12px;
  }

  .main-menu--hyland-logo {
    display: inline-block;
    padding: 21px 12px 0 18px;
    position: relative;

    &::after {
      position: absolute;
      top: 3px;
      height: 50px;
      content: '';
      border-left: 1px solid #e1e1e1;
      right: 1px;
    }
  }
</style>
