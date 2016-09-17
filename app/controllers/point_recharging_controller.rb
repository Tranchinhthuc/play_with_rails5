class PointRechargingController < ApplicationController
  before_action :authenticate_user!

  require 'net/http'
  require 'net/https'

  def new
  end

  def create
    uri = URI.parse("https://www.nganluong.vn/mobile_card.api.post.v2.php")
    sent_params = { merchant_id: SysConst::MERCHANT_ID,
                    merchant_account: SysConst::MERCHANT_ACCOUNT,
                    merchant_password: SysConst::MERCHANT_PASSWORD,
                    pin_card: params[:point_recharging][:pin_card],
                    card_serial: params[:point_recharging][:card_serial],
                    type_card: params[:point_recharging][:type_card],
                    ref_code: rand.to_s[2..12],
                    client_fullname: current_user.full_name.present? ? current_user.full_name : "Tran Anh",
                    client_email: current_user.email.present? ? current_user.email : SysConst::MERCHANT_ACCOUNT,
                    client_mobile: SysConst::MERCHANT_MOBILE
                  }
    uri.query = URI.encode_www_form(sent_params)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.request_uri)
    respond_data = http.request(request).body
    result = RespondDataHanding.new.inspect_data respond_data
    if result[:error_code] == "00"
      flash[:notice] = "Giao dịch thành công"
      current_user.update_attributes(point: current_user.point + result[:card_amount]*1000)
      redirect_to root_path
    else
      flash[:danger] = RespondDataHanding.new.error_raising(result[:error_code])
      render "new"
    end
  end

  private
  def point_recharging_params
    params.require(:point_recharging).permit(
      :pin_card, :card_serial, :type_card
    )
  end
end
