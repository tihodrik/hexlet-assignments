// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"

Rails.start()

// @ts-ignore
const images = require.context('../images', true);