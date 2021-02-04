<svelte:options tag="nx-header--menu-item"/>

<script>
  export let href = '';
  export let classes = '';
</script>

<style lang="scss">
  @import './style/settings';

  li {
    font-size: 14px;
  }

  a {
    border: 0;
    color: $c-black;
    display: block;
    font-family: $font-primary;
    font-weight: $weight-roman;
    line-height: 1.5;
    padding: 0.7em 1em;
    text-decoration: none;
    transition: all 0.2s ease;

    @supports (font-variation-settings: normal) {
      font-family: $font-primary-var;
    }

    &.end-of-section {
      border-bottom: 1px solid $c-grey-1;
    }

    &:hover {
      background: $c-grey;
    }

    &.is-grey {
      color: $c-grey-1;

      &:hover {
        color: $c-black;
      }
    }

    &.is-red {
      color: $c-red;

      &:hover {
        color: $c-black;
      }
    }
  }

  // Navigation Small
  @media all and (max-width: $menu-breakpoint) {
    $spacing: 2.6vh;
    $font-size-sub: 6.2vw;

    li {
      font-size: $font-size-sub;
      font-weight: $weight-roman;
    }

    a {
      font-weight: inherit;

      &.end-of-section {
        border-bottom: 2px solid $c-grey-1;
      }

      &:hover {
        background: unset;
      }

      &.is-grey {
        color: $c-black;
      }
    }
  }

  // Strange dimensions allowances
  @media all and (min-width: 600px) and (max-width: $menu-breakpoint) {
    $spacing: 2vh;
    $font-size-primary: 38px;

    li {
      font-size: $font-size-primary;
      padding: 0 0 ($spacing * 1.5);
    }
  }
</style>

<li><a href={href} class={classes}><slot></slot></a></li>
