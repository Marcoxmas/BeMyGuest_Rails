import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "field", "map", "placeidd" ]

  connect() {
      //console.log("sto in location controller")
    if (typeof(google) != "undefined") {
      this.initMap()
    }
  }

  initMap() {
    //41.5 12.4 sono roma

    let p_id = this.placeiddTarget.value
    //console.log(p_id)

    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng( 41.5, 12.4),
      zoom: (15)
    })

    const request = {
        placeId: p_id,
        fields: ["name", "formatted_address", "place_id", "geometry"],
    }
    
    const infowindow = new google.maps.InfoWindow()
    const service = new google.maps.places.PlacesService(this.map)

    //recupero dettagli da placeId

    service.getDetails(request, (place, status) => {
        if (
            status === google.maps.places.PlacesServiceStatus.OK &&
            place &&
            place.geometry &&
            place.geometry.location
        ) {
            this.marker = new google.maps.Marker({
                map: this.map,
                position: place.geometry.location,
            });
            this.map.setCenter(place.geometry.location);
            this.map.setZoom(17);

            //setto address in field
            this.fieldTarget.value = place.formatted_address

        }

    })

    /* this.marker = new google.maps.Marker({
      map: this.map,
      anchorPoint: new google.maps.Point(0, -29)
    }) */
  }

}
