require 'tiramisu/home/index/view'

describe 'Tiramisu.Home.Index.View', ->
  attrs = model = view = undefined

  beforeEach ->
    attrs =
      deployLink: 'http://www.google.com/'
      health: 'down'
    model = new Backbone.Model(attrs)
    view = new Tiramisu.Home.Index.View(model)
    spyOn(view.deployer, 'deploy')

  describe '#supply', ->
    it 'renders and returns the composed template', ->
      expected = (require 'tiramisu/home/index/template')({app: attrs})
      el = view.supply()
      expect(expected).toEqual(el.html())

  describe '#events', ->
    it 'click [data-id="deployButton"] executes deployer#deploy', ->
      view.render()
      view.$el.find('.deployButton').click()
      expect(view.deployer.deploy).toHaveBeenCalled()
