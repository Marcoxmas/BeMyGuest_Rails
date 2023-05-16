import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "field", "map", "latitude", "longitude", "placeidd" ]

  connect() {
    console.log("sto in maps controller")
    if (typeof(google) != "undefined") {
      this.initMap()
    }
  }

  initMap() {
    //39.5 -98.35 sono usa per centrare la mappa se non ci sono altre coordinate
    //41.5 12.4 sono roma
    /*
      this.data.get("latitude") ||
      this.data.get("longitude") ||
    */
    let p_id = this.data.get("placeidd")
    console.log(p_id)
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng( 41.5, 12.4),
      zoom: (this.data.get("latitude") == null ? 6 : 15)
    })


    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
    this.autocomplete.bindTo('bounds', this.map)
    this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name', "formatted_address", "place_id"])
    this.autocomplete.setTypes(['address'])
    this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))
    
    this.marker = new google.maps.Marker({
      map: this.map,
      anchorPoint: new google.maps.Point(0, -29)
    })
  }

  placeChanged() {
    let place = this.autocomplete.getPlace()
    console.log(place)

    if (!place.geometry) {
      window.alert(`No details available for input: ${place.name}`)
      return
    }

    if (place.geometry.viewport) {
      this.map.fitBounds(place.geometry.viewport)
    } else {
      this.map.setCenter(place.geometry.location)
      this.map.setZoom(17)
    }

    this.marker.setPosition(place.geometry.location)
    this.marker.setVisible(true)

    //-------- test --------
    let country = null
    let city = null
    let lenn = place.address_components.length
    let via = null, street = null
    for (let i = 0; i < lenn; i++){
      let comp = place.address_components[i]
      if(comp.types[0] == 'locality'){
        city = comp.long_name
      }
      if(comp.types[0] == 'country'){
        country = comp.long_name
      }
      if(comp.types[0] == 'postal_town'){
        city = comp.long_name
      }
      if(comp.types[0] == 'administrative_area_level_3'){
        city = comp.long_name
      }
      if(comp.types[0] == 'route'){
        via = comp.long_name
      }
      if(comp.types[0] == 'street_number'){
        street = comp.long_name
      }

    }
    if (!via || !street){
      window.alert(`Selezionare un indirizzo valido (via o numero civico assenti)`)
      return
    }
    
    this.latitudeTarget.value = city
    this.longitudeTarget.value =  country
    this.placeiddTarget.value = place.place_id
    //console.log("City: " + city + ", Country: " + country);
    //console.log("lenn: " + lenn)

    /* if(1 < lenn && lenn < 2){
      this.latitudeTarget.value = place.address_components[0]['long_name']
      this.longitudeTarget.value = null
    } else {
      //this.latitudeTarget.value = place.geometry.location.lat()
      this.latitudeTarget.value = place.address_components[0]['long_name']

      //this.longitudeTarget.value = place.geometry.location.lng()
      //place.place_id
      this.longitudeTarget.value = place.address_components[lenn -1]['long_name']

    }  */
    
  }

  keydown(event) {
    if (event.key == "Enter") {
      event.preventDefault()
    }
  }
}
