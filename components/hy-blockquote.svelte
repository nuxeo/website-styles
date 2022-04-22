<svelte:options tag="hy-blockquote"/>

<script>
  export let author;
  export let cite = '';
  export let citeURL = '';

  function intersection(node) {
    const quoteClass = 'fancy-quote__container';
    const hideClass = 'fancy-quote__container--hide';
    const triggerClass = 'fancy-quote__trigger';

    const quote = node.querySelector(`.${quoteClass}`);
    const trigger = node.querySelector(`.${triggerClass}`);
    quote.classList.remove(hideClass);

		if (typeof IntersectionObserver !== 'undefined') {
      let scrollPos = window.pageYOffset;
      quote.classList.add(hideClass);

      const options = {
        threshold: [0.5]
      };

      const callback = (entries, observer) => {
        // console.log('Observed', new Date(), entries);
        entries.forEach(entry => {
          if (entry.target.classList.contains(triggerClass)) {
            if (window.pageYOffset > scrollPos && entry.isIntersecting) {
              quote.classList.add(hideClass);
            }
          }

          if (entry.target.classList.contains(quoteClass) && entry.isIntersecting) {
            quote.classList.remove(hideClass);
          }
          // console.log('Entry', entry.target.classList.value, entry.intersectionRatio, entry.isIntersecting, entry.time);

        });
        scrollPos = window.pageYOffset;
      };

      const observer = new IntersectionObserver(callback, options);

      observer.observe(quote);
      observer.observe(trigger);

      return {
        destroy () {
          observer.unobserve(quote);
          observer.unobserve(trigger);
        }
      }
    }
  };

</script>

<div use:intersection class="fancy-quote">
  <div class="fancy-quote__trigger"></div>
  <div class="fancy-quote__container fancy-quote__container--hide">
    <svg aria-hidden="true" class="fancy-quote__openquotes" viewBox="0 0 93 74" xmlns="http://www.w3.org/2000/svg"><g transform="rotate(180,46,37)"><path id="fancy_quote_path" d="M3.56 39.807V0h39.17v39.807c-1.018 8.165-3.052 17.862-9.665 23.986C26.452 69.917 14.243 74 2.543 74L0 58.69c3.052-.17 10.072-1.225 13.735-4.083 3.662-2.858 5.256-11.057 5.595-14.8H3.56zm50.271 0V0H93v39.807c-1.017 8.165-3.052 17.862-9.665 23.986C76.722 69.917 64.513 74 52.814 74L50.27 58.69c3.052-.17 10.072-1.225 13.735-4.083 3.662-2.858 5.256-11.057 5.595-14.8H53.831z" fill="url('#fancy-quote__gradient')"/></g><defs><linearGradient id="fancy-quote__gradient" gradientTransform="rotate(45)"><stop offset="10%" stop-color="hsl(325deg 56% 61%)"/><stop offset="60%" stop-color="hsl(246deg 28% 70%)"/><stop offset="100%" stop-color="hsl(193deg 75% 62%)"/></linearGradient></defs></svg>
    <figure class="fancy-quote__figure">
      <blockquote cite="{citeURL}">
        <p><slot></slot></p>
      </blockquote>
      <figcaption>
        <span>{author}</span>
        {#if cite}
          <cite>{@html cite}</cite>
        {/if}
        <slot name="cite"></slot>
      </figcaption>
    </figure>
    <svg aria-hidden="true" class="fancy-quote__closequotes" viewBox="0 0 93 74" xmlns="http://www.w3.org/2000/svg"><use href="#fancy_quote_path" fill="url('#fancy-quote__gradient')"/></svg>
  </div>
</div>

<style lang="scss">
@import './style/settings';

.fancy-quote__figure svg {
  height: 1em;
  display: block; // Fixes magic spacing issue

  path {
    fill: currentColor;
  }
}

.fancy-quote {
  --motion-speed: 0.2s;
  --motion-speed-slow: 0.4s;
  --motion-speed-notice: 1s;
  --scroll-snap: mandatory;

  @media (prefers-reduced-motion) {
    --motion-speed: 0s;
    --motion-speed-slow: 0s;
    --motion-speed-notice: 0s;
    --scroll-snap: none;
  }

  position: relative;
}

.fancy-quote__container {
  padding: 2rem;
  position: relative;
  overflow: hidden;

   blockquote {
    transition: all var(--motion-speed-notice) ease var(--motion-speed-slow);
  }

  figcaption {
    transition: all var(--motion-speed-notice) ease var(--motion-speed-notice);
  }

  .fancy-quote__openquotes,
  .fancy-quote__closequotes {
    transition: all var(--motion-speed-notice) ease;
  }

  &.fancy-quote__container--hide {
    blockquote,
    figcaption,
    .fancy-quote__openquotes,
    .fancy-quote__closequotes {
      transition: all 0s ease 0s;
    }


    blockquote {
      opacity: 0;
      transform: translate(0, 2rem);
    }

    figcaption {
      opacity: 0;
    }

    .fancy-quote__openquotes {
      opacity: 0.4;
      transform: translate(0, -1rem);
    }
    .fancy-quote__closequotes {
      opacity: 0.4;
      transform: translate(0, 1rem);
    }
  }
}

.fancy-quote__figure {
  margin: 0;
  padding-block: 2rem;
  padding-inline: 2rem 7.75rem;
  background-color: #F4F4F4;

  @media screen and (max-width: 750px) {
    padding: 2rem;
  }

  /*
  &::before,
  &::after {
    background-image: linear-gradient(
      135deg,
      hsl(325deg 56% 61%) 0%,
      hsl(246deg 28% 70%) 50%,
      hsl(193deg 75% 62%) 100%
    );
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    position: absolute;
    letter-spacing: -.1em;
    line-height: 1;
    width: 0.3em;
  }

  &::before {
    top: -0.19em;
    left: -0.06em;
    font-size: 46rem;
    font-weight: 500;
    content: '‘‘';
  }

  &::after {
    bottom: -0.4em;
    right: 0.1em;
    font-size: 20rem;

    content: '’’';
  }
  */

  blockquote {
    color: #333;
    margin: 0;
    margin-block-start: 6.3rem;
    line-height: 1.5;
    font-size: 1.5rem;
  }

  figcaption {
    color: #333;
    text-transform: uppercase;
    font-weight: 800;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    column-gap: 4rem;
    row-gap: 2rem;
    flex-wrap: wrap;

    cite {
      font-style: normal;
    }
  }

  &.hide {
    blockquote,
    figcaption {
      opacity: 0;
      transition: all 0s ease 0s;
    }
  }
}

.fancy-quote__openquotes {
  position: absolute;
  top: -2rem;
  left: 0;
  height: 11.5rem;
}
.fancy-quote__closequotes {
  position: absolute;
  bottom: 4rem;
  right: 2rem;
  height: 4.5rem;

  @media screen and (max-width: 750px) {
    display: none;
  }
}

.fancy-quote__trigger {
  position: absolute;
  top: -64px;
  left: 1px;
  width: 1px;
  height: 32px;
  z-index: 999;
}
</style>
