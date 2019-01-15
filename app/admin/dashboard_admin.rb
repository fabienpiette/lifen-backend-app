# frozen_string_literal: true

Trestle.admin(:dashboard) do
  menu do
    item :dashboard, icon: 'fas fa-tachometer-alt', priority: 0
  end

  controller do
    def index
      @interim_shifts = Shift.joins(:worker)
                             .where('workers.status = ?', :interim)
                             .count
      @pdg_fee = @interim_shifts * 80 + Worker.all.sum(&:commission)
    end
  end
end
