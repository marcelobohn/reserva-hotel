module BookingsHelper

  def get_month_occupation
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @count_days = Date.civil(@year,@month,-1).strftime("%d").to_i

    r = I18n.localize(@shown_month, :format => "%B %Y")
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
    		r << "<td></td>"
    	end
    	r << "</tr>"
    end

    r << %(</table>)
    # r << Room.count.to_s
  end
end
