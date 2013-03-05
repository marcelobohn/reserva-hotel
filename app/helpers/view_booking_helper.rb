module ViewBookingHelper
	def ocu
		data_ini = params[:data_ini].to_i.zero? ? Time.now().strftime('%d-%m-%Y') : params[:data_ini]
		data_fim = params[:data_fim].to_i.zero? ? Time.now().strftime('%d-%m-%Y') : params[:data_fim]

		r = ""
		Building.all(:order => :name).each do |building|
			building.floors.order("name").each do |floor|
				r << "<div class='divQuebra'></div>"
				floor.rooms.order("name").each do |room|
					booking = Booking.where("room_id = #{room.id}")
					booking = booking.where("'#{data_ini}' between cast(entry as date) and cast(exit as date) 
						or '#{data_fim}' between cast(entry as date) and cast(exit as date)
            			or cast(entry as date) between '#{data_ini}' and '#{data_fim}'
            			or cast(exit as date) between '#{data_ini}' and '#{data_fim}'
						")
					if booking.count.zero?
						r << "<div class=\"room_box_free\" onMouseover=\"hidetip()\">"
						r << link_to(room.name, new_booking_path(:room_id => room.id, :entry => data_ini, :exit => data_fim))
						r << "</div>"						
					else
						r << "<div class=\"room_box_ocupped\""
						if booking.count > 1
							lista = ""
							booking.each do |boo| 
								lista << "<a href=bookings/#{boo.id}/edit>#{boo.client}</a><br />"
							end
							r << "onMouseover=\"showhint('Reservas:<br />#{lista}', this, event, '200px')\"" 
						else
							r << "onMouseover=\"hidetip()\""
						end
						r << ">"
						r << link_to(room.name, edit_booking_path(room)) if booking.count == 1
						r << link_to(room.name + " - " + booking.count.to_s, bookings_path) unless booking.count == 1
						r << "</div>"
					end
				end
			end
		end
		r
	end
end
