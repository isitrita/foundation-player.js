# Foundation-player.js

Dead simple player plugin for [Foundation](http://foundation.zurb.com/) framework. Watch the [demo](http://qatsi.github.io/foundation-player.js/).

`Foundation-player.js` featuring:
- `Play`/`Pause` buttons!
- Dimmed volume while scrubbing
- All you looking from a player… will be added soon

## Using plugin on your page

Make sure assets listed below are added **after** `foundation.js`  and `foundation.css`:

```
<script type='text/javascript' src='../src/foundation-player.min.js'></script>
<link href='../src/foundation-player.css' rel='stylesheet' type='text/css'>
```

Add player markup and initiate the plugin:

```
<script>
$(document).ready(function($) {
  // This is standard stuff
  $(document).foundation();
  // Call player after .foundation()
  $('.foundation-player.no-1').foundationPlayer();
</script>
```

## Development

- Exec `bundle install`...
- Start Foreman `bundle exec foreman start`

Foreman will start following:

- Web server with Jasmine spec runner [page](http://localhost:8888)
- Web server with demo [page](http://localhost:8889), it same as [demo](http://qatsi.github.io/foundation-player.js/) on GitHub.
- It also starts `guard`.

Please note, these files generated by `guard` automatically, so don't edit them:
- **Foundation Player JavaScript** `src/foundation-player.js` and `src/foundation-player.min.js`, edit `src/foundation-player.coffee` instead
- **Jasmine specs JavaScript** `spec/javascripts/*.js`, edit `spec/javascripts/*.coffee` instead
- **CSS** `src/foundation-player.css` is also will be overwritten, so take a look in SCSS source `src/foundation-player.scss`
- **HTML5** index file `index.html`, to make changes edit `index.haml`

## Tests

[Jasmine](http://jasmine.github.io/) framework [gem](https://github.com/jasmine/jasmine-gem) is used for tests.
- Main config: `spec/javascripts/support/jasmine.yml`
- Specs: `spec/javascripts/*_spec.js`
- Test specific HTML-fixtures: `spec/javascripts/fixtures/*.html`

### Testing conventions

- File name should be in lower case with `_spec` suffix e.g. `foo_bar_spec.coffee`
- One suite i.e. one `describe ... ->` block per \*.coffee file
- Empty line between `it` statements

### Checklist
- Default fixture path: `jasmine.getFixtures().fixturesPath = '.'``
- Full path to fixtures e.g. `loadFixtures 'spec/javascripts/fixtures/player.html'`
- Remove player instances data e.g. `$.removeData document.body, 'FoundationPlayers'` in `afterEach`
- Use `afterEach`/`beforeEach` instead of `afterAll`/`beforeAll` when possible
- Remove all `console.log ...` statements

## Tips and known issues

- Add `preload: 'none'` to every `<audio>` to prevent preloading. Player automatically starts preloading when initialized.
- Add `.noselect` class to whole player

## Some conventions:
- Buttons has selector `.player-button.play em`, where: `.player-button.play` is li element and `em` is event target
- Status elements has selector `.player-status.time .elapsed`, where: `.player-status.time` is li element and `.elapsed` is target to update

## Todo
- Playlists
- `Next`/`Prev` buttons
