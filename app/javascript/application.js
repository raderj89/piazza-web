// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
// import "@hotwired/strada"
import "./controllers"

import Bridge from "./bridge/bridge";

window.webBridge = new Bridge();
