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
end