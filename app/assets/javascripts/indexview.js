var IndexView = Backbone.View.extend({

  render: function() {
    var template = $('#index-template').html();

    var html = Mustache.render(template, {});
    this.$el.html(html);

    this.collection.each(function(activity) {
      var view = new ActivityItemView({ model: activity });
      this.$el.find('.card-container').append(view.render().el);
    }, this);

    var $map = this.$el.find('.map')[0];

    var map = new google.maps.Map(
      $map, {
      zoom: 14,
      center: { lat: -37.813155, lng: 144.964078}
      });

    var latLngList = [];
    this.collection.each(function(activity) {
      activity = activity.toJSON();
        if (activity.latitude != null) {
          console.log(activity);
          latLngList.push(new google.maps.LatLng(activity.latitude, activity.longitude));
          var marker = new google.maps.Marker({
          position: { lat: activity.latitude, lng: activity.longitude },
          map: map,
          title: activity.title
          });
        }
    });
    //  Create a new viewpoint bound
    var bounds = new google.maps.LatLngBounds ();
    //  Go through each...
    for (var i = 0, LtLgLen = latLngList.length; i < LtLgLen; i++) {
    //  And increase the bounds to take this point
      bounds.extend (latLngList[i]);
    }
    //  Fit these bounds to the map
    map.fitBounds (bounds);

    return this;
  }

});
