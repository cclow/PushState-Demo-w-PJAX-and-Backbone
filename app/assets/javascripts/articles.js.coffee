window.App = {}

App.setActiveArticle = (active_id) ->
  $('.article.active').removeClass('active')
  $("#article_#{active_id}").addClass('active')

App.setTitle = (title) ->
  $('title').text(title)

App.Article = Backbone.Model.extend
  urlRoot: '/articles'

App.ArticlesCollection = Backbone.Collection.extend
  model: App.Article
  url: '/articles'

App.ArticlesIndexView = Backbone.View.extend
  render: ->
    $('#article_content').html(null)
    App.setActiveArticle(0)
    App.setTitle("Articles")
    return this

App.ArticlesShowView = Backbone.View.extend
  render: (id) ->
    $('#article_content').html(ich.article_content_template({article: @model.toJSON()}))
    App.setActiveArticle(id)
    App.setTitle("Article: #{@model.get('title')}")
    return this

App.ArticlesRouter = Backbone.Router.extend
  routes:
    "articles"     : "index"
    "articles/:id" : "show"

  initialize: (articles) => # must be bound function
    @articlesCollection = new App.ArticlesCollection
    @articlesCollection.reset(articles)

  index: =>
    view = new App.ArticlesIndexView(collection: @articlesCollection)
    view.render()

  show: (id) =>
    article = @articlesCollection.get(id)
    view = new App.ArticlesShowView(model: article)
    view.render(id)

$ ->
  router = new App.ArticlesRouter(gon.articles)
  $(document).on 'click', 'a', (e) ->
    e.preventDefault()
    href = $(this).attr('href')
    router.navigate(href, true)
  Backbone.history.start({pushState: true, silent: true})