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

### Add path to SCSS compiler
In compiling the SCSS you need to include the path `--include-path ./node_modules/nuxeo-website-styles/scss/`
e.g. npm scripts
```
"build_css": "node-sass --source-map true --source-map-contents --include-path ./client/scss/ --include-path ./node_modules/nuxeo-website-styles/scss/ --output-style compressed --output ./client/css/ ./client/scss/",
```

### Include styles
In SCSS import and include the appropriate styles:
```
@import 'nuxeo';

@include 'nuxeo-base-styles';
@include 'nuxeo-typography';
```

## Available mixins

Mixin name | Description
-----------|------------
nuxeo-base | Base styles required
nuxeo-typography | Standard typography styles

## Polymer Elements

### Run Locally
```bash
npm run dev
```

### Change browser
The broswer defaults to `chromium-browser` but can be changed with the following command and then locally as usual.
```bash
npm config set Nuxeo-website:browser firefox
```

## Contributions
Please keep the [available mixins table](#available-mixins) up to date if you add or amend mixins.

### Releasing changes
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
