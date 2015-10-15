(function() {
  var InfoBoxBuilder, handler,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  InfoBoxBuilder = (function(superClass) {
    extend(InfoBoxBuilder, superClass);

    function InfoBoxBuilder() {
      return InfoBoxBuilder.__super__.constructor.apply(this, arguments);
    }

    InfoBoxBuilder.prototype.create_infowindow = function() {
      var boxText;
      if (!_.isString(this.args.infowindow)) {
        return null;
      }
      boxText = document.createElement("div");
      boxText.setAttribute('class', 'marker_container');
      boxText.innerHTML = this.args.infowindow;
      return this.infowindow = new InfoBox(this.infobox(boxText));
    };

    InfoBoxBuilder.prototype.infobox = function(boxText) {
      return {
        content: boxText,
        pixelOffset: new google.maps.Size(-140, 0),
        boxStyle: {
          width: "280px"
        }
      };
    };

    return InfoBoxBuilder;

  })(Gmaps.Google.Builders.Marker);

  handler = Gmaps.build('Google', {
    builders: {
      Marker: InfoBoxBuilder
    }
  });

}).call(this);
