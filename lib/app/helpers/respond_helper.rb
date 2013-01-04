module RespondHelper

  def respond_include_tags
    tags = [javascript_include_tag(:respond)]

    unless ActionController::Base.asset_host.nil?
      tags << tag('link', {href: asset_path('respond-proxy.html'), id: 'respond-proxy', rel: 'respond-proxy'})
      tags << tag('link', {href: image_path('respond.proxy.gif'), id: 'respond-redirect', rel: 'respond-redirect'})
      tags << javascript_include_tag(javascript_path('respond.proxy.js'))
    end

    tags.join("\n").html_safe
  end

end
