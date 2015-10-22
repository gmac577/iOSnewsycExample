module PagePopulator
    include DataMagic

	def populate_page_with(data_file)
        data = data_for data_file
    	data.each do |key, value|
            tap_mark(key)
            wait_for_keyboard
            keyboard_enter_text(value)
    	end
    end
    
    def retrieve_values(data_file)
        data = data_for data_file
        data.each do |key, value|
            return value
        end
    end
  
    def verify_alert_message(message)
        message = retrieve_values(message) 
        @@alert_message = "label {text LIKE '*#{message}*'"
        puts @@alert_message
        wait_for_elements_exist([@@alert_message], :timeout => 10, :timeout_message => "Could not locate message '#{message}'")
        sleep 4
    end

    def pick_option(picker_options)
        picker_options.each do |key, value|
            option = "label text:'#{value}'"
            scroll_picker_until_exists(option)
            touch(option)
        end
    end
#these two functions take the place of the sleep function
#to inc/dec time, adjust the amount of microseconds when you call the "sleeper" function

def sleeper(clock)
  n = 0
  tm = clock
  every(0.1) do
    n += 1
    break if n == tm
  end
end

 def every(period)
    base = last = Time.now.to_f
    count = 0

    loop do
      now = Time.now.to_f
      actual_secs = now - base
      expected_secs = period * count
      correction = expected_secs - actual_secs
      correction = -period if correction < -period
      select(nil, nil, nil, period + correction)
      now = Time.now
      last = now.to_f
      count += 1
      yield(now)
    end
  end
#--------------------------------------------

end