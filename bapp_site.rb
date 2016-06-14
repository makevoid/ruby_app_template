require_relative 'config/env'
require_relative 'lib/roda_utils'

# bapp website
class Bapp < Roda
  plugin :render, engine: 'haml'
  plugin :assets,
    js: %w(
      vendor/underscore.js
      app.js
    ),
    css:  %w(
      vendor/milligram.css
      style.css
    )
  plugin :not_found

  include RodaUtils

  route { |r|
    r.assets

    r.root {
      view 'index'
    }

    r.on("install") {
      # (r.is).and(r.get) {
      r.is { r.get {
        view 'install'
      } }
    }

    r.on("configure") {
      view 'configure'
    }



  }

  not_found {
    view "not_found"
  }
end
