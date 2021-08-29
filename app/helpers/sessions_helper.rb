module SessionsHelper
  def session_buttons
    if logged_in?
      link_to(t(:logout), logout_path, method: :delete, class: 'btn btn-danger d-none d-sm-inline-block')
    else
      [].tap do |buttons|
        buttons << tag.span(class: 'd-none d-sm-inline') { link_to(t(:login), login_path, class: 'btn btn-white') }
        buttons << link_to(t(:signup), new_user_path, class: 'btn btn-primary d-none d-sm-inline-block')
      end.join
    end
  end
end
