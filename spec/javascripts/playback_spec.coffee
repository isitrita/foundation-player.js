describe 'Playback API tests', ->
  player = null

  beforeEach ->
    jasmine.getFixtures().fixturesPath = '.'
    loadFixtures 'spec/javascripts/fixtures/html/player-1.html'
    $('.no-1').foundationPlayer()
    player = $('.no-1').data('FoundationPlayer')

  afterEach ->
    player = null
    $.removeData document.body, 'FoundationPlayers'

  it 'playPause() return values', ->
    expect(player.playPause()).toBe player

  it 'playPause() calls play not pause', ->
    spyOn player, 'play'
    spyOn player, 'pause'
    player.audio.paused = true
    player.playPause()
    expect(player.play).toHaveBeenCalledWith()
    expect(player.pause).not.toHaveBeenCalledWith()

  it 'pause() and play() return values', -> # Lets check this in chain mode
    expect(player.playPause().pause()).toBe player
    expect(player.playPause().play()).toBe player

  it 'play() calls', ->
    spyOn player.audio, 'play'
    spyOn player.audio, 'pause'
    spyOn player, 'updateButtonPlay'
    player.play()
    expect(player.updateButtonPlay).toHaveBeenCalledWith()
    expect(player.audio.play).toHaveBeenCalledWith()
    expect(player.audio.pause).not.toHaveBeenCalledWith()

  it 'pause() calls', ->
    spyOn player.audio, 'play'
    spyOn player.audio, 'pause'
    spyOn player, 'updateButtonPlay'
    player.pause()
    expect(player.updateButtonPlay).toHaveBeenCalledWith()
    expect(player.audio.pause).toHaveBeenCalledWith()
    expect(player.audio.play).not.toHaveBeenCalledWith()

  it 'seekToTime() calls and return', ->
    spyOn player, 'updatePlayedProgress'
    spyOn player, 'updateTimeStatuses'
    player.seekToTime('00:01').seekToTime '00:01'
    expect(player.updatePlayedProgress).not.toHaveBeenCalledWith()
    expect(player.updateTimeStatuses).not.toHaveBeenCalledWith()
    player.canPlayCurrent = true
    player.seekToTime('00:01').seekToTime '00:01'
    expect(player.updatePlayedProgress).toHaveBeenCalledWith()
    expect(player.updateTimeStatuses).toHaveBeenCalledWith()
    # Return value doesn't depend on canPlayCurrent
    expect(player.seekToTime('00:01').seekToTime '00:02').toBe player

  it 'seekPercent() calls and return', ->
    spyOn player, 'updatePlayedProgress'
    spyOn player, 'updateTimeStatuses'
    player.seekPercent 0.1
    player.seekPercent 20
    expect(player.updatePlayedProgress).toHaveBeenCalledWith()
    expect(player.updateTimeStatuses).toHaveBeenCalledWith()
    # Lets check this in chain mode
    expect(player.seekPercent(0.1).seekPercent 20).toBe player
