Planning.destroy_all
Planning.create(name: 'P1')

workers = YAML.safe_load(
  File.open(Rails.root.join('datas', 'import', 'workers.yml'))
)
Worker.destroy_all
workers.each do |worker|
  Worker.create!(
    first_name: worker['first_name'],
    status: worker['status']
  )
end


shifts = YAML.safe_load(
  File.open(Rails.root.join('datas', 'import', 'shifts.yml'))
)
Shift.destroy_all
shifts.each do |shift|
  Shift.create!(
    start_date: Date.current + Shift.count.days,
    planning: Planning.first,
    worker: Worker.all.sample
  )
end
