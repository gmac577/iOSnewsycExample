require 'calabash-cucumber/ibase'

class FeedDetailsPage < Calabash::IBase

    include FormHelper
    include PagePopulator  

    def title
        "label {text LIKE '*Hacker News*'}"
    end
	
  def await(opts={})
		wait_for_elements_exist([title], :timeout => 10)
        self
    end

    @@feedtable = "tableViewCell'"
    @@storycell = "SubmissionTableCell"
    @@compose = "navigationButton index:0"
    @@story = "tableViewCell index:1"
    @@new = "label {text LIKE '*New Submissions*'}"
    @@searchbar = "fieldEditor index:0"
    @@searchtext = "Microsoft"
    @@reclabel = "label {text LIKE '*Recent*'}"
    @@share = "label {text LIKE '*Share*'}"
    @@submiturl = "label {text LIKE '*Submit URL*'}"
    @@submittext = "label {text LIKE '*Submit Text*'}"
    @@cancel = "label {text LIKE '*Cancel*'}"
    @@send = "label {text LIKE '*Send*'}"
    @@title = "textField index:0"
    @@url = "PlaceholderTextView index:0"
    @@bodytext = "PlaceholderTextView index:0"
    @@discard = "label {text LIKE '*Discard*'}"


#-----------------------------------------------
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

   
    def verify_feed_elements
        wait_for_elements_exist([@@feedtable], :timeout => 10)
        wait_for_elements_exist([@@storycell], :timeout => 10)
        wait_for_elements_exist([@@compose], :timeout => 10)
    end

    def touch_row
         sleeper(16)
         touch(@@story)
    end

    def touch_rec
        sleeper(16)
        touch(@@reclabel)
    end

    def touch_body_text
        sleeper(16)
        touch(@@bodytext)
    end

    def see_new
        wait_for_elements_exist(@@new, :timeout => 10)
        self
    end

    def view_search(searchtext)
        section=0
        sleeper(10)
        each_cell(:animate => false, :post_scroll => 0.2) do |row, sec|
            if query("tableViewCell indexPath:#{row},#{sec} label", :searchtext).first==searchtext
                break # if text found break from loop
            end
        section=section+1
       end
    end

    def touch_share
      touch(@@share)
    end

    def touch_choice(choice)
      case choice
            when "Submit Text" then 
                  sleeper(25)
                  touch([@@submittext])
            when "Submit URL" then 
                  sleeper(25)
                  touch([@@submiturl])
      end
    end
end
