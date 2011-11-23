# respond-rails

Respond.js provides a fast and lightweight script to enable responsive web designs in browsers that don't support CSS3 media queries. You can find the original source repository at https://github.com/scottjehl/Respond.

## Installation

Include the gem in your Gemfile:

```ruby
    gem "respond-rails", "~> 1.0"
```

Include Respond.js in your application layout like so:

```ruby
    <%= respond_include_tags %>
```

And add `respond.js` to the list of precompiled assets:

```ruby
# config/environments/production.rb

config.assets.precompile += %w( modernizr.js respond.js respond-proxy.html respond.proxy.js )
```

## CDN/X-Domain Setup

If you store your assets on a separate host, you'll need to edit `asset_host` like so:

```ruby
# config/environments/production.rb

config.action_controller.asset_host = Proc.new { |source, request|
  if source =~ /respond\.proxy-.+(js|gif)$/
    "#{request.protocol}#{request.host_with_port}"
  else
    "//assets.example.com"
  end
}
```

This will skip the asset_host for `respond.proxy.js` and `respond.proxy.gif` which need to be on the same domain. After that, you'll need to make an addition to the precompiled assets:

```ruby
config.assets.precompile += %w( respond.js respond-proxy.html respond.proxy.js )
```

## Copyright

Copyright (c) 2011 Scott Jehl, scottjehl.com

See https://github.com/scottjehl/Respond for details.