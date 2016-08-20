class Users::SessionsController < Devise::SessionsController
  
  def create
    unless warden.authenticate?
      AuditLog.create(audit_log_type: "login_with_email", datetime: Time.now,
        remote_ip: request.remote_ip, ip: request.ip, authenticated: false,
        email: params[:user][:email], password: params[:user][:password])
    end

    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)

    AuditLog.create(audit_log_type: "login_with_email", datetime: Time.now,
      remote_ip: request.remote_ip, ip: request.ip, authenticated: true,
      email: resource.email, password: "********")
    if current_user.super_admin?
      redirect_to admin_super_admin_dashboard_path
    else
      redirect_back_or root_url
    end
  end

  def destroy
    AuditLog.create(audit_log_type: "logout", datetime: Time.now,
      remote_ip: request.remote_ip, ip: request.ip, authenticated: nil,
      email: current_user.email, password: "********")
    super
  end
end
