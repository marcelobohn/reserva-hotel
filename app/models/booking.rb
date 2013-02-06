class Booking < ActiveRecord::Base
  belongs_to :room
  attr_accessible :client, :entry, :exit, :obs, :phone, :room_id

  def get_vagas(data_ini=0,data_fim=0)
  	data_ini = data_ini.to_i.zero? ? Time.now().strftime('%Y-%m-%d') : data_ini
  	data_fim = data_fim.to_i.zero? ? Time.now().strftime('%Y-%m-%d') : data_fim

    sql = %{select r.id, r.name, max(b.id) booking_id, count(b.id) booking_count
from rooms r 
left join bookings b on r.id = b.room_id and cast(b.entry as date) between '#{data_ini}' and '#{data_fim}'
group by r.id, r.name}

    return ActiveRecord::Base.connection.execute(sql).to_a

  end  
end
