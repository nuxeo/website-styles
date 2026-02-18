<svelte:options tag="nx-header" />

<script>
  export let name = '';
  export let homelabel = 'Home';
  let burger_class = '';
  let menu_main_class = '';

  const burgerToggle = function () {
    burger_class = !burger_class ? 'open' : '';
    menu_main_class = !menu_main_class ? 'drop-menu__items--open' : '';
    document.documentElement.classList.toggle('no-scroll');
  };
</script>

<header>
  <div class="container">
    <div class="top-menu--left">
      <div class="menu-item menu-item--first">
        <a href="https://www.nuxeo.com/">
          <span class="main-menu--logo svg"
            ><img
              height="24"
              src="https://particle.hyland.com/assets/logos/horizontal-brand-dark.svg"
              alt="Hyland"
            /></span
          >
        </a>
      </div>
      <div class="menu-item drop-menu">
        <span class="drop-menu__parent for-desktop"
          >{name}
          <span class="svg svg--arrow-space"
            ><svg
              stroke="#fff"
              stroke-width="3"
              stroke-linejoin="round"
              stroke-linecap="round"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 32 16"><path d="M1 1L16 15L31 1L16 15z"></path></svg
            >
          </span></span
        >
        <div class="drop-menu__items drop-menu__items--main {menu_main_class}">
          <div class="nav-container">
            <ul>
              <nx-header--menu-item href="/" classes="end-of-section"
                >{homelabel}</nx-header--menu-item
              >
              <slot></slot>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="top-menu--right">
      <slot name="rightnav"></slot>
      <div class="hamburger {burger_class}" on:click={burgerToggle}>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
</header>

<style lang="scss">
  @import '../scss/settings';
  @import './style/settings';
  @import './style/hamburger';

  .svg {
    &--arrow-space {
      font-size: 8px;
      margin-left: 0.5rem;
      margin-right: 3rem;
    }

    svg {
      height: 1em;
      width: auto;
    }
  }

  .main-menu--logo {
    display: inline-flex;
    font-size: 50px;
    margin-top: -5px;
    vertical-align: middle;
    vertical-align: baseline-middle;
  }

  .menu-item {
    color: $c-white;
    display: inline-block;
    font-weight: $weight-bold;
    line-height: $header-height;
    padding: 0 1.5em;
    position: relative;

    &--first {
      padding-left: 0;
    }
  }

  header {
    background: $c-black;
    box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.15);
    font-family: $font-primary;
    height: $header-height;
    padding: 0 20px;

    @supports (font-variation-settings: normal) {
      font-family: $font-primary-var;
    }

    .container {
      display: flex;
      font-size: 16px;
      justify-content: space-between;
      margin: 0 auto;
      max-width: $max-width;
    }

    a {
      border: 0;
      line-height: 1.5;
      text-decoration: none;
    }

    .title-bar {
      a {
        box-sizing: border-box;
        display: inline-block;
        height: $header-height;
        line-height: $header-height;
      }
    }
  }

  .drop-menu {
    ul {
      list-style: none;
      margin: 0;
      padding: 0;

      ul {
        // For IE
        list-style: none;
      }
    }
  }

  .drop-menu__items {
    display: none;
  }

  // Navigation Large
  @media all and (min-width: $menu-breakpoint) {
    .hamburger {
      display: none;
    }

    .for-mobile {
      display: none;
    }

    .top-menu--right {
      display: flex;
    }

    header .drop-menu {
      cursor: pointer;
      height: $header-height;
      position: relative;
      transition: background 0.2s ease;

      &:hover,
      &.open {
        background: $c-grey-3;
        transition: background 0s ease;

        .drop-menu__items {
          background: $c-white;
          box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.15);
          display: block;
          flex-direction: column;
          flex-wrap: nowrap;
          left: 0;
          position: absolute;
          top: 50px;
          width: 100%;
          z-index: 2;

          ul {
            margin: 0;
          }
        }
      }
    }
  }

  // Navigation Small
  @media all and (max-width: $menu-breakpoint) {
    $container-padding: 40px;

    // .hamburger.open {
    //   margin-right: 7px;
    // }

    .for-desktop {
      display: none;
    }

    .drop-menu__items--main {
      background-color: $c-white;
      display: block;
      height: 100%;
      left: 100%;
      opacity: 0;
      position: fixed;
      top: $header-height;
      transition:
        opacity 0.2s ease,
        z-index 0s ease 0.2s,
        left 0s ease 0.2s;
      width: 100%;
      z-index: -9999;

      .nav-container > ul {
        flex-direction: column;
        justify-content: flex-start;
      }
    }

    .drop-menu__items--open {
      display: block;
      left: 0;
      opacity: 1;
      transition: opacity 0.2s ease;
      z-index: 9999;

      .nav-container {
        box-sizing: border-box;
        height: calc(100vh - #{$header-height});
        left: 0;
        -webkit-overflow-scrolling: touch;
        overflow-y: auto;
        padding: $container-padding 20px;
        position: absolute;
        top: 0;
        width: 100vw;
      }
    }
  }

  // Medium
  @media (min-width: 40em) {
  }

  // Large
  @media (min-width: 64em) {
  }
</style>
