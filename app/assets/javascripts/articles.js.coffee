window.setActiveArticle = (active_id) ->
  $('.article.active').removeClass('active')
  $("#article_#{active_id}").addClass('active')

Article = Backbone.Model.extend
  urlRoot: '/articles'

ArticlesCollection = Backbone.Collection.extend
  model: Article
  url: '/articles'

ArticlesShowView = Backbone.View.extend
  render: ->
    article_json = @model.toJSON()
    $('#article_content').html(ich.article_content_template({article: article_json}))
    false

ArticlesRouter = Backbone.Router.extend
  routes:
    "articles/:id" : "show"

  initialize: (articles) => # must be bound function
    @articles_collection = new ArticlesCollection
    @articles_collection.reset(articles)

  show: (id) =>
    article = @articles_collection.get(id)
    view = new ArticlesShowView(model: article)
    view.render()
    setActiveArticle(id)
    $('title').text('Article: ' + article.attributes.title)

$ ->
  router = new ArticlesRouter(gon.articles)
  $(document).on 'click', 'a', (e) ->
    e.preventDefault()
    href = $(this).attr('href')
    router.navigate(href, true)
  Backbone.history.start({pushState: true})