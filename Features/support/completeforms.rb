
module CompleteForms

	@@btn_with_text = "view:'UILabel' text:'"

	def enter_text(field_id,text)
		clear_text(field_id)
	    touch(field_id)
	    wait_for_keyboard
	    keyboard_enter_text text
	    done
	end

	def scroll_screen_until_exists(element)
		if element_does_not_exist(element)
			wait_poll(:until_exists => element, :timeout => 5) do
	            scroll("view:'UIView'", :down)
	        end
	    end
	end

	def scroll_screen_up_until_exists(element)
		if element_does_not_exist(element)
			wait_poll(:until_exists => element, :timeout => 5) do
	            scroll("view:'UIView'", :up)
	        end
	    end
	end

	def scroll_picker_until_exists(element)
		if element_does_not_exist(element)
			wait_poll(:until_exists => element, :timeout => 5) do
	            scroll("tableView", :down)
	        end
	    end
	end

	def close_keyboard(random_label)
		touch(random_label)
		sleep 2
	end

	def tap_btn(text)
		element = @@btn_with_text + "#{text}'"
		wait_for_elements_exist([element], :timeout => 3)
		touch(element)
	end

end