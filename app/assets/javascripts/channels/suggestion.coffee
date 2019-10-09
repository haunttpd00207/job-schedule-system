App.suggestion = App.cable.subscriptions.create "SuggestionChannel",
  connected: ->
    console.log("con cac")
  disconnected: ->
    console.log("con cet")
  received: (data) ->
    user = $("span#suggestion_status_#{data['user_id']}")
    user.replaceWith("<span class='badge badge-warning status_" + data['user_id'] + "' id='suggestion_status_" + data['user_id'] + "'>" + @renderMessage(data) + "</span>")
  renderMessage: (data) ->
    data.status
