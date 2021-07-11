module ApplicationHelper
  def translate_name(role)
    case role
    when 'owner'
      '主人'
    when 'admin'
      '管理員'
    else
      '使用者'
    end
  end
end
