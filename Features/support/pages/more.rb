require 'calabash-cucumber/ibase'

class MorePage < Calabash::IBase

    include FormHelper
    include PagePopulator  

    def title
        "label {text LIKE '*Hacker News*'}"
    end

    def await(opts={})
		wait_for_elements_exist([title], :timeout => 10)
        self
    end

    @@back = "label {text LIKE 'Hacker News'}"

    @@bestsub = "tableViewCell {text LIKE '*Best Submissions*'}"
    @@active = "tableViewCell {text LIKE '*Active Discussions*'}"
    @@classic = "tableViewCell {text LIKE '*Classic View*'}"
    @@askhn = "tableViewCell {text LIKE '*Ask HN*'}"
    @@bestcom = "tableViewCell {text LIKE '*Best Comments*'}"
    @@newcom = "tableViewCell {text LIKE '*New Comments*'}"
    @@faq = "tableViewCell {text LIKE '*Hacker News FAQ*'}"
    @@home = "tableViewCell {text LIKE '*news:yc homepage*'}"
    @@tweet = "tableViewCell {text LIKE '*@newsyc_*'}"
    @@goback = "label {text LIKE 'Back'}"
    #@@goback = "button index:0"
    @@bestsublabel = "label {text LIKE '*Best Submissions*'}"
    @@subtitle = "label {text LIKE '*Submission*'}"
    @@activelabel = "label {text LIKE '*Active*'}"
    @@asklabel = "label {text LIKE '*Ask HN*'}"
    @@faqlabel = "label {text LIKE '*Hacker News FAQ*'}"
    @@tableviewer = "TableViewCellView"
    @@readability = "button index:2"
    @@refresh = "button index:3"
    @@moreactions = "button index:4"
    @@hnfaqlabel = "label {text LIKE '*Hacker News FAQ — news.ycombinator.com*'}"

   	

    @@cancel = "label {text LIKE 'Cancel'}"
   	
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
        if
          wait_for_elements_exist([@@karma], :timeout => 10)
          wait_for_elements_exist([@@average], :timeout => 10)
        end
        if
          wait_for_elements_exist([@@retry], :timeout => 10)
          touch(@@submission)
        end
    end

     def select_more_actions(choice)
        case choice
            when "Hacker News" then 
                    sleep 3
                    touch([@@back])
            when "Best Submissions" then 
            		sleep 3
            		touch([@@bestsublabel])
            when "Active Discussions" then 
            		sleep 3
            		touch([@@activelabel])
            when "Classic View" then
            	    sleep 3
            		touch([@@classic])
            when "Ask HN" then 
            		sleep 3
            		touch([@@askhn])
            when "Best Comments" then 
            		sleep 3
            		wait_for_elements_exist([@@karma], :timeout => 10)
            when "New Comments" then
            	    sleep 3
            		wait_for_elements_exist([@@karma], :timeout => 10)
            when "Hacker News FAQ" then 
            		sleep 3
            		wait_for_elements_exist([@@karma], :timeout => 10)
             when "news:yc homepage" then 
             		sleep 3
            		wait_for_elements_exist([@@karma], :timeout => 10)
             when "@news:yc Twitter" then 
                    sleep 3
                    wait_for_elements_exist([@@karma], :timeout => 10)
        end
    end

        def page_handler(page)
        case choice
            when "Hacker News" then 
                    sleep 3
                    wait_for_elements_exist([@@back], :timeout => 10)
            when "Best Submissions" then 
                    sleep 3
                    wait_for_elements_exist([@@bestsublabel], :timeout => 10)
            when "Active Discussions" then 
                    sleep 3
                    wait_for_elements_exist([@@activelabel], :timeout => 10)
            when "Classic View" then
                    sleep 3
                    wait_for_elements_exist([@@classic], :timeout => 10)
            when "Ask HN" then 
                    sleep 3
                    wait_for_elements_exist([@@asklabel], :timeout => 10)
            when "Best Comments" then 
                    sleep 3
                    wait_for_elements_exist([@@bestcom], :timeout => 10)
            when "New Comments" then
                    sleep 3
                    wait_for_elements_exist([@@newcom], :timeout => 10)
            when "Hacker News FAQ" then 
                    sleep 3
                    wait_for_elements_exist([@@faqlabel], :timeout => 10)
             when "news:yc homepage" then 
                    sleep 3
                    wait_for_elements_exist([@@home], :timeout => 10)
             when "@news:yc Twitter" then 
                    sleep 3
                    wait_for_elements_exist([@@tweet], :timeout => 10)
        end
    end

    def slide_over
    	swipe "left", {:query => "collectionView"}
    end

    def touch_sub
    	sleep 4
    	touch(@@submission)
    end

    #def create_post
    #    sleep 2
    #    res = query(@@textview)
    #		if res
    #    		set_text(@@textview, @@text_value)
  	#		end
	#end
    

	def create_post(action)
        sleep 2
        case action
            when "reply post" then 
            		set_text(@@textview, @@text_value)
            when "search query" then 
            		touch(@@getsearch)
            		sleep 3
            		set_text("fieldEditor index:0", @@searchtext)
            		sleep 5
            		keyboard_enter_char "Return"
         end
    end

end

