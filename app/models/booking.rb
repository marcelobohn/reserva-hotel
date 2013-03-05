class Booking < ActiveRecord::Base
  has_event_calendar
  belongs_to :room
  attr_accessible :client, :entry, :exit, :obs, :phone, :room_id, :value_entry
  validates_presence_of :client, :phone

  def get_vagas(data_ini=0,data_fim=0)
    data_ini = data_ini.to_i.zero? ? Time.now().strftime('%Y-%m-%d') : Date.parse(data_ini).strftime("%Y-%m-%d")
    data_fim = data_fim.to_i.zero? ? Time.now().strftime('%Y-%m-%d') : Date.parse(data_fim).strftime("%Y-%m-%d")
    sql = %{select r.id, r.name, max(b.id) booking_id, count(b.id) booking_count, r.floor_id, f.building_id
            from rooms r 
            left join floors f on f.id = r.floor_id
            left join bookings b on r.id = b.room_id and 
            ('#{data_ini}' between cast(b.entry as date) and cast(b.exit as date) 
            or '#{data_fim}' between cast(b.entry as date) and cast(b.exit as date)
            or cast(b.entry as date) between '#{data_ini}' and '#{data_fim}'
            or cast(b.exit as date) between '#{data_ini}' and '#{data_fim}')
            group by r.id, r.name, r.floor_id, f.building_id
            order by building_id, floor_id, id}
    return ActiveRecord::Base.connection.execute(sql).to_a
  end  

  def name
    client
  end
  before_save :update_dates

  def update_dates
    self.start_at = self.entry
    self.end_at = self.exit
  end

# Booking.where("entry >= '2013-02-01' and exit <= '2013-02-28'")
# Booking.where(:entry => '2013-02-01'..'2013-02-28')

end
