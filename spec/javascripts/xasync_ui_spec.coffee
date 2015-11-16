
    # body...
xdescribe 'Async UI test', ->
  no1 = null
  LOADING_TIMEOUT = 4000
  TEST_TIMEOUT = 5000

  beforeAll ->
    jasmine.getFixtures().fixturesPath = '.'
    jasmine.getFixtures().preload 'spec/javascripts/fixtures/html/player-1.html'
    jasmine.getStyleFixtures().fixturesPath = '.'
    jasmine.getStyleFixtures().preload 'dist/foundation-player.css', 'lib/css/foundation.css'

  afterAll ->
    jasmine.getFixtures().clearCache()

  beforeEach (done) ->
    jasmine.getFixtures().load 'spec/javascripts/fixtures/html/player-1.html'
    jasmine.getStyleFixtures().load 'dist/foundation-player.css', 'lib/css/foundation.css'
    $('.no-1').foundationPlayer()
    no1 = $('.no-1').data 'FoundationPlayer'
    no1.audio.muted = true # Mute audio
    no1.audio.play() # Start playing
    done()

  afterEach (done) ->
    no1 = null
    $.removeData document.body, 'FoundationPlayers'
    done()

  it 'Buffered width less than ProgressBar', (done) ->
    setTimeout ->
      no1.seekPercent 100
      a = no1.$progress.width()
      b = $('.meter.buffered').outerWidth()
      k = (a - b >= 0)
      expect(k).toBe true
      done()
    , LOADING_TIMEOUT
  , TEST_TIMEOUT
