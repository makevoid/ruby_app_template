require_relative 'config/env'
require_relative 'lib/roda_utils'
require_relative 'lib/view_helpers'

class App < Roda
  plugin :render, engine: 'haml'
  plugin :assets,
    js: %w(
      vendor/underscore.js
      app.js
    ),
    css:  %w(
      vendor/bulma.css
      style.css
    )
  plugin :not_found
  plugin :multi_route
  plugin :partials
  plugin :all_verbs
  plugin :error_handler
  # plugin :basic_auth, authenticator: proc {|_, pass| pass == PASSWORD }, realm: 'Please enter ANY username and the password'
  # plugin :static, ['/uploads'] if APP_ENV == "development"

  include RodaUtils
  include ViewHelpers

  route do |r|
    r.assets

    r.root {
      view 'index'
    }

    r.on("foo") {
      r.is {
        r.get {
          view 'foo'
        }
      }
    }
  end

  not_found do
    view "not_found"
  end

  error do |err|
    case err
    when nil
      # catch a proper error...
    #
    # when CustomError
    #   "ERR" # like so
    else
      raise err
    end
  end
end
