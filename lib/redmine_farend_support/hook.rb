module RemdineFarendSupport
  class Hooks < Redmine::Hook::ViewListener

    render_on :view_account_login_bottom,
      :partial => 'redmine_farend_support/hooks/view_account_login_bottom'

    def view_layouts_base_body_bottom(context = {})
      partial_path = 
        File.join('redmine_farend_support',
                  'hooks/view_layouts_base_body_bottom',
                  "#{context[:controller].controller_name}",
                  "#{context[:controller].action_name}")

      begin
        context[:controller].send(:render_to_string, {
             :partial => partial_path,
             :locals => context
          })
      rescue ActionView::MissingTemplate
        ; # ignore exception
      end
    end
  end
end