class Stores::RegistrationsController < Devise::RegistrationsController

  layout :admin_layout

  private

    def admin_layout
      current_store.present? ? 'ad' : 'auth'
    end


  protected

  def after_update_path_for(resource)
    ad_root_path
  end

end
