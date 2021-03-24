class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def button_display
		if self.id.blank?
			'登録'
		else
			'更新'
		end
	end
end
