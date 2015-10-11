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



	def pause
      	sleep 5
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
        wait_for_elements_exist([@@karma], :timeout => 10)
        wait_for_elements_exist([@@average], :timeout => 10)
    end

     def select_action(choice)
        case choice
            when "Submissions" then 
            		touch(@@submissions)
            		sleep 3
            		touch(@@prof)
            when "Comments" then
            	    touch(@@comments)
            	    sleep 3
            		touch(@@prof)
        end
    end

     def select_share_action(choice)
        case choice
            when "Mail" then 
            		touch(@@Mail)
            		sleep 3
            		touch(@@prof)
            when "Reminders" then 
            		touch(@@reminder)
            		sleep 3
            		touch(@@prof)
            when "More" then
            	    touch(@@more)
            	    sleep 3
            		touch(@@prof)
            when "Add" then 
            		touch(@@add)
            		sleep 3
            		touch(@@prof)
            when "Copy" then 
            		touch(@@copy)
            		sleep 3
            		touch(@@prof)
            when "Read" then
            	    touch(@@readlater)
            	    sleep 3
            		touch(@@prof)
            when "Open" then 
            		slide_over
            		touch(@@open)
            		sleep 3
            		touch(@@prof)
             when "More2" then 
             		slide_over
             		slide_over
            		touch(@@moremore)
            		sleep 3
            		touch(@@prof)
        end
    end

    def slide_over
    	swipe "left", {:query => "collectionView"}
    end

    def touch_sub
    	sleep 4
    	touch(@@submission)
    end

    def create_post
        sleep 2
        res = query(@@textview)
  			if res
        		set_text(@@textview, @@text_value)
  			end
	end
    
end

