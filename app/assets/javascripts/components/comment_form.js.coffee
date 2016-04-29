@CommentForm = React.createClass
  getInitialState: ->
    author: ''
    text: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.author && @state.text
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/comments', { comment: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'      
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Author'
          name: 'author'
          value: @state.author
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Text'
          name: 'text'
          value: @state.text
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create comment'