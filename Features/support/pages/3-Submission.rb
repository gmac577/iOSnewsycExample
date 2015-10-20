require 'calabash-cucumber/ibase'

class SubmissionPage < Calabash::IBase

    include FormHelper
    include PagePopulator  

    def title
        "label {text LIKE '*Submission*'}"
    end

    def await(opts={})
		wait_for_elements_exist([title], :timeout => 10)
        self
    end

    @@back = "label {text LIKE 'Hacker News'}"
   	@@goback = "navigationBarBackIndicatorView"
   	@@cancel = "label {text LIKE 'Cancel'}"
   	@@title = "label {text LIKE '*Submission*'}"
   	@@reply = "label {text LIKE '*Reply*'}"
    @@textview = "view index:6"
    @@text_value = "This is a news submission. It says Gleeben-globben-glowben. That is all."
    @@discard = "label {text LIKE '*Discard*'}"
    @@karma = "tableViewCell {text LIKE '*karma*'}"
    @@average = "tableViewCell {text LIKE '*average*'}"
    @@submissions = "tableViewCell {text LIKE '*Submissions*'}"
    @@submission = "label {text LIKE '*Submission*'}"
    @@comments = "tableViewCell {text LIKE '*Comments*'}"
    @@prof = "label {text LIKE '*Profile*'}"
    @@share = "label {text LIKE '*Share*'}"
	  @@mail = "label {text LIKE '*Mail*'}"
    @@reminder = "label {text LIKE '*Reminders*'}"
    @@more = "label {text LIKE '*More*'} index:0"
    @@moremore = "label {text LIKE '*More*'} index:1"
    @@add = "label {text LIKE '*Add to Reading List*'}"
    @@copy = "label {text LIKE '*Copy*'}"
    @@readlater = "label {text LIKE '*Read Later*'}"
    @@open = "label {text LIKE '*Open in Safari*'}"
    @@searchbar = "fieldEditor index:0"
    @@searchtext = "Microsoft"
    @@getsearch = "searchBarTextFieldLabel {text LIKE '*Search*'}"
    @@progress = "label {text LIKE '*Continue*'}"
    @@retry = "label index:1"
    @@headhome = "label index:0"
    @@alltitle = "This is the title of the text"
    @@textbody = "This is text that will go in the body of the submit text form. Carpe Diem!"
    @@urlbody = "http://www.riis.com"
    
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

    def pause
      	sleeper(25)
    end
	
	def touch_back
	  sleep 5
      touch(@@back)
    end

    def touch_discard
      touch(@@discard)
    end

    def search_value
		enter_text(@@textview,@@search_value)
	end

	def verify_page_elements
		sleep 4
        if
          wait_for_elements_exist([@@karma], :timeout => 10)
          wait_for_elements_exist([@@average], :timeout => 10)
        end
        if
          wait_for_elements_exist([@@retry], :timeout => 10)
          touch(@@submission)
        end
    end

     def select_action(choice)
        case choice
            when "Submissions" then 
            		touch(@@submissions)
                    puts @@submissions
            		sleeper(20)
            		touch(@@prof)
            when "Comments" then
            	    touch(@@comments)
            	    sleeper(20)
            		touch(@@prof)
        end
    end

     def select_share_action(choice)
        case choice
            when "Mail" then 
            		touch(@@Mail)
            		sleeper(16)
            		touch(@@prof)
            when "Reminders" then 
            		touch(@@reminder)
            		sleeper(16)
            		touch(@@prof)
            when "More" then
            	    touch(@@more)
            	    sleeper(16)
            		touch(@@prof)
            when "Add" then 
            		touch(@@add)
            		sleeper(16)
            		touch(@@prof)
            when "Copy" then 
            		touch(@@copy)
            		sleeper(16)
            		touch(@@prof)
            when "Read" then
            	    touch(@@readlater)
            	    sleeper(16)
            		touch(@@prof)
            when "Open" then 
            		slide_over
            		touch(@@open)
            		sleeper(16)
            		touch(@@prof)
             when "More2" then 
             		slide_over
             		slide_over
            		touch(@@moremore)
            		sleeper(16)
            		touch(@@prof)
        end
    end

    def

    def slide_over
    	swipe "left", {:query => "collectionView"}
    end

    def touch_sub
    	sleeper(16)
    	touch(@@submission)
    end

	def create_post(action)
        sleeper(16)
        case action
            when "reply post" then 
            		set_text(@@textview, @@text_value)
            when "search query" then 
            		touch(@@getsearch)
            		sleeper(16)
            		set_text("fieldEditor index:0", @@searchtext)
            		sleeper(25)
            		keyboard_enter_char "Return"
            when "text title" then
                set_text(@@title, @@alltitle)
            when "text post" then
                touch(@@bodytext)
                sleeper(16)
                set_text(@@bodytext, @@textbody)
                sleeper(25)
                keyboard_enter_char "Return"
            when "URL title" then
                set_text(@@title, @@alltitle)
            when "URL post" then
                touch(@@url)
                sleeper(16)
                set_text(@@url, @@urlbody)
                sleeper(25)
                keyboard_enter_char "Return"
         end
    end

end

