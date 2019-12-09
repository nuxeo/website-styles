# Nuxeo Website Components

Please use [EditorConfig plugin for your code editor/IDE](http://editorconfig.org/#download).

## Using the package

### Include with npm

Add the following in your `package.json`:

```
"dependencies": {
    "nuxeo-website-styles": "nuxeo/website-styles#v1.0.1",
    ...
}
```

### SCSS components

#### Add path to SCSS compiler

In compiling the SCSS you need to include the path `--include-path ./node_modules/nuxeo-website-styles/scss/`
e.g. npm scripts

```
"build_css": "node-sass --source-map true --source-map-contents --include-path ./client/scss/ --include-path ./node_modules/nuxeo-website-styles/scss/ --output-style compressed --output ./client/css/ ./client/scss/"
```

#### Include styles

In SCSS import and include the appropriate styles:

```
@import 'nuxeo_styles';

@include 'nuxeo-base-styles';
@include 'nuxeo-typography';
```

### Fonts

```
<link rel="stylesheet" href="https://static.nuxeo.com/fonts/nhg-min.css" />
```

or for all weights

```
<link rel="stylesheet" href="https://static.nuxeo.com/fonts/nhg.css" />
```

## Available mixins

| Mixin name       | Description                                        |
| ---------------- | -------------------------------------------------- |
| nuxeo-base       | Base styles required                               |
| nuxeo-typography | Standard typography styles                         |
| nuxeo-codeblock  | Codeblock with HighlightJS styling and copy button |

### Svelte Web Components

In the header of your page:

```
<link rel="stylesheet" href="https://static.nuxeo.com/components/v1/global.css" />
<script defer src="https://static.nuxeo.com/components/v1/bundle.min.js"></script>
```

#### Header

`<nx-header name="Roadmap" homelabel="Roadmap Home"></nx-header>` Inserts the standard header.

insert `<nx-header--menu-item href="/URL">Link Text</nx-header--menu-item>` within `<nx-header>` to include extra links.

#### Footer

`<nx-footer></nx-footer>` will insert the standard Nuxeo footer

Properties:

- `year`: Manually set the year
- `showlicense`: Adds a creative commons license and link
- `nolinks`: Removes the main links section

# Development (Local)

## Requirements

- [git](https://git-scm.com/) &mdash; make sure your Privacy & Security settings allow to download applications from anywhere
- [Node.js](https://github.com/creationix/nvm#install-script) &mdash; Stable: See [Release schedule](https://github.com/nodejs/LTS#lts_schedule)(version >= v12.13.0)
  - `nvm install lts/*` will get the [latest Long Term Support](https://github.com/nodejs/LTS#lts-schedule1) version
  - Test with `node --version`
  - _Remember:_ Run `nvm use` at the start of your session.
- [libsass](http://sass-lang.com/libsass) &mdash; Might not be necessary.
- A decent code editor (https://atom.io/ or https://www.sublimetext.com/ for example) with ideally the following:
  - [EditorConfig plugin](http://editorconfig.org/#download).
  - [ESLint](https://atom.io/packages/linter-eslint)
  - [Sass-Lint](https://atom.io/packages/linter-sass-lint)

**To install on mac:**

- install homebrew (http://brew.sh/)
- run `brew update`
- use brew to install (or use upgrade if you have already some installed):

```bash
brew install git nodejs libsass
```

## Installation

Clone the repository to your local machine, using your favourite Git client or the command line:

```bash
git clone https://github.com/nuxeo/website-styles
cd website-styles
```

## Run Locally

```bash
npm run dev
```

### Change browser

The broswer defaults to `chromium-browser` but can be changed with the following command and then locally as usual.

```bash
npm config set Nuxeo-website:browser firefox
```

## Contributing

Please keep the [available mixins table](#available-mixins) and [available elements table](#available-elements) up to date if you add or amend mixins and/or elements.

## Releasing changes

This module is used via [npm](https://www.npmjs.com/), please bump the version when changes are made.

Node packages follow Semantic Versioning ([SemVer](http://semver.org/)), versions a described by a `MAJOR.MINOR.PATCH` version.

After you've committed your code, run **one** of the following:

```bash
npm version major # incompatible API changes
npm version minor # add functionality in a backwards-compatible manner
npm version patch # backwards-compatible bug fixes
```

Then push the version commit and the tags:

```bash
git push && git push --tags
```
