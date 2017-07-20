module ApplicationHelper
  def yield_with_default(holder, default)
    if content_for?(holder)
      content_for(holder).squish
    else
      default
    end
  end

  def should_it_show
    ( params[:action] == "home") || (( params[:action] == "new") && (params[:controller] == "devise/sessions" )) || (( params[:action] == "new") && (params[:controller] == "devise/registrations" ))
  end
end
