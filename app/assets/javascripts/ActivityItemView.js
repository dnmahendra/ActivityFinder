var ActivityItemView = Backbone.View.extend({

  className: "activity",
  render: function() {
    var template = $('#activity-template').html();

    var html = Mustache.render(template, this.model.toJSON());
      this.$el.html(html);
      return this;
    }

});