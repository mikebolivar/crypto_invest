// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import jquery from "jquery"
window.jQuery = jquery
window.$ = jquery



$( "#now" ).html('holiiiii')
window.setInterval(function () {
  console.log('data', new Date())
}, 2000);