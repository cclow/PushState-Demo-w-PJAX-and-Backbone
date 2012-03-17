window.App = {}

App.setActiveArticle = (active_id) ->
  $('.article.active').removeClass('active')
  $(active_id).addClass('active')

$ ->
  $('.article_link').pjax('#article_content')
