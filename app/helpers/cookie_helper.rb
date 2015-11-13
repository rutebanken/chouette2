module CookieHelper
  def cookie_info
    "<div class=\"alert alert-info fade in\" role=\"alert\"><button class=\"close\" data-dismiss=\"alert\">×</button>
      #{I18n.t('cookie_info.message')}<br>
      #{link_to I18n.t('cookie_info.help'), help_path + '/cookie'}
    </div>".html_safe
  end
end
