module BookingsHelper

  def month_link_rel(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  def get_month_occupation
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @count_days = Date.civil(@year,@month,-1).strftime("%d").to_i

    r = "<< " + month_link_rel(@shown_month.prev_month) + " | "
    r << I18n.localize(@shown_month, :format => "%B %Y") + " | "
    r << month_link_rel(@shown_month.next_month) + " >> "
    r << "<table border>"

    r << "<tr><td></td>"
    for i  in 1..@count_days 
        r << "<td>#{i}</td>"
    end
    r << "</tr>"

    Room.all.each do |room|
        r << "<tr>"
        r << "<td>#{room.name}</td>"
        for i  in 1..@count_days 
            r << "<td>"
            data = Date.civil(@year, @month, i).to_s
            b = Booking.where("room_id = #{room.id}").where("'#{data}' between entry and exit").first
            r << link_to("#{b.id.to_s}", booking_path(b)) if b
            r << "</td>"
    	end
    	r << "</tr>"
    end

    r << %(</table>)
    # r << Room.count.to_s
  end
end
