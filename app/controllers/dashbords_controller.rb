class DashbordsController < ApplicationController
  def home
    # @assigned_tickets = Ticket.where('status = ? and assign_user_id = ?', '未対応', current_user.id)
    # @received_tickets = Ticket.where('status = ? and received_user_id = ?', '未対応', current_user.id)

    # ログインユーザーが担当しているインシデント
    @user = User.find_by(id: current_user.id)
    @assigned_tickets = @user.assigned_tickets.where('status = ?', '未対応')

    # 期日が過ぎているインシデント
    @expired_tickets = Ticket.where('status = ? and limit_date < ?', '未対応', Date.today)

  end
end
