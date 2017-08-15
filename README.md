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

### Polymer elements
#### Copy elements
Copy elements into some assets location in your project
e.g. npm scripts
```
"postcopy_assets": "cp node_modules/nuxeo-website-styles/bower_components/webcomponentsjs/webcomponents-lite.min.js ./site/assets/js/ && cp node_modules/nuxeo-website-styles/elements/*.min.js ./site/assets/ && cp node_modules/nuxeo-website-styles/elements/*.build.min.html ./site/assets/"
```

#### Include elements
In the header include the elements
e.g.
```
<script src="/assets/js/webcomponents-lite.min.js"></script>
<link rel="import" href="/assets/elements.build.min.html" />
```

#### Usage without Node
In the header directly include the elements from Nuxeo website (your website URL must comply with the CORS policy):
```
<script src="https://www.nuxeo.com/assets/js/webcomponents-lite.min.js"></script>
<link rel="import" href="https://www.nuxeo.com/assets/elements.build.min.html" />
```

## Available mixins

Mixin name | Description
-----------|------------
nuxeo-base | Base styles required
nuxeo-typography | Standard typography styles
nuxeo-codeblock | Codeblock with HighlightJS styling and copy button

## Available elements
Element | Description | Parameters | Sub elements | Sub element parameters
-----------|------------|------------|------------|------------
`<nuxeo-header></nuxeo-header>` | Nuxeo standard header | `show-nuxeo-menu`: if set to true show corporate website menu | `<nuxeo-banner></nuxeo-banner>`<br />_____<br />`<nuxeo-menu></nuxeo-menu>` | `background-id`: the background image id to use (currently only "1")<br />`title`: the title to display (h1)<br />_____<br />`site-name`: the site name<br />`site-url`: the homepage URL<br />`menu-items`: menu items to display on the left<br />`menu-items-right`: menu items to display on the right (not visible on mobile version)
`<nuxeo-footer></nuxeo-footer>` | Nuxeo standard footer | `year`: the year to display<br />`show-license`: if set to true show CC Licence logo | `<nuxeo-footer-column></nuxeo-footer-column>` | `column-items`: column items to display

# Development (Local)
## Requirements
- [git](https://git-scm.com/) &mdash; make sure your Privacy & Security settings allow to download applications from anywhere
- [Node.js](https://github.com/creationix/nvm#install-script) &mdash; Stable: See [Release schedule](https://github.com/nodejs/LTS#lts_schedule)(version >= v6.9)
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
- run ```brew update```
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
