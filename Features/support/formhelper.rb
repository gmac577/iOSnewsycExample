module FormHelper

def get_index_value(index)
  case index
     when "first" then index = 0
     when "second" then index = 1
     when "third" then index = 2
     when "fourth" then index = 3
     when "fifth" then index = 4
     when "sixth" then index = 5
     when "seventh" then index = 6
     when "eighth" then index = 7
  end
  return index
end


def should_see_alert_with_text (text)
    if (query("label {text LIKE '#{text}'}").empty?)
            wait_poll(:until_exists => "label {text LIKE '#{text}'}", :timeout => 40, :timeout_message => "Could not locate alert '#{text}'") do 
                 #scroll(@@feedtable,:down)
            end
    end
    # sleep 2
    # expected_alert = query("label {text LIKE '#{text}'}").empty?
    # if expected_alert
    #   screenshot_and_raise "could not find alert '#{text}'"
    # end
end


def performSelection(rowNumber, colNumber,type) 
 ## This date picker has been tested and works on ios7.  Other versions not verified.
 ## Used case statement to transform "common" words from 
 ## feature file (i.e. select "December" from "Month") to values that are used in datepicker.  Each value was adjust by -1
 ## since values are on 0 based array
 ## Therefore, the Month scroller is column# 0 and December is row# 11

case type
when "Date"
 case colNumber
    when "Month" then colNumber = "0"
      case rowNumber 
         when "January" then rowNumber = "0"
         when "February" then rowNumber = "1"
         when "March" then rowNumber = "2"
         when "April" then rowNumber = "3"
         when "May" then rowNumber = "4"
         when "June" then rowNumber = "5"
         when "July" then rowNumber = "6"
         when "August" then rowNumber = "7"
         when "September" then rowNumber = "8"
         when "October" then rowNumber = "9"
         when "November" then rowNumber = "10"
         when "December" then rowNumber = "11"
       end
    when "Day" then colNumber = "1" 
       rowNumber = rowNumber.to_i - 1
    when "Year" then colNumber = "2"
       rowNumber = rowNumber.to_i - 1
   end
when "Time"
    case colNumber
    when "Hours" then colNumber = "0"
        rowNumber = rowNumber.to_i - 1
    when "Minutes" then colNumber = "1" 
         rowNumber = rowNumber.to_i - 1
    when "AMPM" then colNumber = "2"
         case rowNumber 
           when "AM" then rowNumber = "0"
           when "PM" then rowNumber = "1"
         end
    end
end
  query("view:'_UIDatePickerView'", [{:selectRow => rowNumber}, {:inComponent => colNumber}, {:animated => 0}])
  query("pickerView", :delegate, [{:pickerView => :__self__}, {:didSelectRow => rowNumber}, {:inComponent => colNumber}])
  sleep(0.4)
end

end

World(FormHelper)