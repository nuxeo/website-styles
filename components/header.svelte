<svelte:options tag="nx-header"/>

<script>
  export let name = '';
  export let homelabel = 'Home';
  let burger_class = '';
  let menu_main_class = '';

  const burgerToggle = function() {
    burger_class = !burger_class ? 'open' : '';
    menu_main_class = !menu_main_class ? 'drop-menu__items--open' : '';
    document.documentElement.classList.toggle('no-scroll');
  };
</script>

<style lang="scss">
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
    font-size: 22px;
    max-width: 120px;
    vertical-align: middle;
    vertical-align: baseline-middle;
  }

  .menu-item {
    color: $c-white;
    display: inline-block;
    font-weight: $weight-medium;
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

    .container {
      display: flex;
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
    $spacing: 20px;
    $font-size-small: 14px;
    $font-size-sub: 20px;
    $font-size-primary: 30px;

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
          z-index: 1;

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
    $spacing: 2.6vh;
    $font-size-sub: 6.2vw;
    $font-size-primary: 9vw;

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
      transition: opacity 0.2s ease, z-index 0s ease 0.2s, left 0s ease 0.2s;
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

<header>
  <div class="container">
    <div class="top-menu--left">
      <div class="menu-item menu-item--first">
        <a href="https://www.nuxeo.com/">
          <span class="main-menu--logo svg"><svg viewBox="0 0 128 24" xmlns="http://www.w3.org/2000/svg"><path fill="#fff" d="M0,0 18,0 24,6 24,24 18,24 18,6 6,6 6,24 0,24M26,0 32,0 32,18 44,18 44,0 50,0 50,24 32,24 26,18M78,0 102,0 102,6 84,6 84,9 102,9 102,15 84,15 84,18 102,18 102,24 78,24M104,0 122,0 128,6 128,24 110,24 104,18 104,0 110,6 110,18 122,18 122,6 110,6z"/><path fill="#73d2cf" d="M52,0 57,0 76,19 76,24 71,24 52,5M52,24 52,19 71,0 76,0 76,5 57,24z"/></svg></span>
        </a>
      </div>
      <div class="menu-item drop-menu">
        <span class="drop-menu__parent for-desktop">{name} <span class="svg svg--arrow-space"><svg stroke="#fff" stroke-width="3" stroke-linejoin="round" stroke-linecap="round" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 16"><path d="M1 1L16 15L31 1L16 15z"></path></svg>
        </span></span>
        <div class="drop-menu__items drop-menu__items--main {menu_main_class}">
          <div class="nav-container">
            <ul>
              <nx-header--menu-item href="/" classes="end-of-section">{homelabel}</nx-header--menu-item>
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
