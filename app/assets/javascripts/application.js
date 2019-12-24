// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require_tree .

$(document).on('turbolinks:load', function() {
  mapboxgl.accessToken = gon.map;
  var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [+gon.points[0][0], +gon.points[0][1]],
    zoom: 10
  });

  let imagable = [];
  let area = [];
  for (let i=0; i < gon.points.length; ++i){
    imagable.push(
      {
        'type': 'Feature',
        'geometry': {
          'type': 'Point',
          'coordinates': [+gon.points[i][0], +gon.points[i][1]]
        }
      }
    )
    area.push([+gon.points[i][0], +gon.points[i][1]])
  }

  map.on('load', function() {
    map.loadImage(
      'https://image.flaticon.com/icons/png/512/1275/1275502.png',
      function(error, image) {
        if (error) throw error;
        map.addImage('cat', image);
        map.addLayer({
        'id': 'points',
        'type': 'symbol',
        'source': {
          'type': 'geojson',
          'data': {
            'type': 'FeatureCollection',
            'features': imagable
          }
        },
        'layout': {
        'icon-image': 'cat',
        'icon-size': 0.09,
        }
        });
      }
    );
    map.addLayer({
      'id': 'maine',
      'type': 'fill',
      'source': {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'geometry': {
            'type': 'Polygon',
            'coordinates': 
            [
              area
            ]
          }
        }
      },
      'layout': {},
      'paint': {
      'fill-color': '#088',
      'fill-opacity': 0.4
      }
      });
  });
});
