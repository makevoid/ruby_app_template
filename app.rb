require_relative 'config/env'
require_relative 'lib/roda_utils'

class App < Roda
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

  route do |r|
    r.assets

    r.root do
      view 'index'
    end
  end

  not_found do
    view "not_found"
  end
end
