var Router = Backbone.Router.extend({
  routes: {
    "": "showActivities",
    "activity/:id": "showActivity"
    },


  showActivities: function() {

    var activities = new Activities();
    activities.fetch().done(function() {
    var indexview = new IndexView({ collection: activities });
    $('main').html(indexview.render().el); 
    });

  },

  showActivity: function(id) {

  }

});
