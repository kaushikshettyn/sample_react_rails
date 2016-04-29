@Comments = React.createClass
  getInitialState: ->
    comments: @props.data
  getDefaultProps: ->
    comments: [] 
  addComment: (comment) ->
    comments = @state.comments.slice()
    comments.push comment
    @setState comments: comments   
  render: ->
    React.DOM.div
      className: 'comments'
      React.DOM.h2
        className: 'title'
        'Comments'
      React.createElement CommentForm, handleNewRecord: @addComment  
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Author'
            React.DOM.th null, 'Text'
        React.DOM.tbody null,
          for comment in @state.comments
            console.log("sss")
            React.createElement Comment, key: comment.id, comment: comment

@Comment = React.createClass
  render: ->
    console.log("ddddddddddd")
    React.DOM.tr null,
      React.DOM.td null, @props.comment.author
      React.DOM.td null, @props.comment.text
