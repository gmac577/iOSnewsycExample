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
    @@goback = "label {text LIKE '*Back*'}"
    @@com = "label {text LIKE 'Comments'}"
    #@@goback = "button index:0"
    @@bestsublabel = "label {text LIKE '*Best Submissions*'}"
    @@subtitle = "label {text LIKE '*Submission*'}"
    @@activelabel = "label {text LIKE '*Active*'}"
    @@classiclabel = "label {text LIKE '*Classic*'}"
    @@asklabel = "label {text LIKE '*Ask HN*'}"
    @@faqlabel = "label {text LIKE '*Hacker News FAQ*'}"
    @@detailsheader = "DetailsHeaderView"
    @@tableviewer = "BodyTextRenderView"
    @@readability = "button index:2"
    @@refresh = "button index:3"
    @@moreactions = "button index:4"
    @@hnfaqlabel = "label {text LIKE '*Hacker News FAQ*'}"
    @@newsychome = "label {text LIKE '*Meet news:yc.*'}"
    @@tweethome = "label {text LIKE 'news:yc (@newsyc_) | Twitter'}"
    @@reply = "button index:0"
    @@backbutton = "label {text LIKE 'back7'}"
    @@body = "label {text LIKE '*tableView*'}"
    @@backbtn = "NavigationBarBackIndicatorView"
    @@detailstitle = "label index:1"
    @@subflag = "toolbarButton index:2"
    @@doflag = "label {text LIKE '*Flag*'}" 
    @@progress = "label {text LIKE '*Continue*'}"
    @@noprogress = "label {text LIKE '*Cancel*'}"
  
    def pause
      	sleep 5
    end
	
    def touch_subflag
        wait_for_elements_exist([@@subflag], :timeout => 10)
         #puts "here we go"
          touch(@@subflag)
        sleep 5
        touch(@@doflag)
        sleep 3
        touch(@@progress)   
	end

    def touch_goback
	  sleep 5
      touch(@@goback)
    end

    def backpage
      touch(nil, :offset => {:x => 8, :y => 26})
      sleep 5
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
            		touch([@@bestsub])
            when "Active Discussions" then 
            		sleep 3
            		touch([@@active])
            when "Classic View" then
            	    sleep 3
            		touch([@@classic])
            when "Ask HN" then 
            		sleep 3
            		touch([@@askhn])
            when "Best Comments" then 
            		sleep 3
            		touch([@@bestcom])
            when "New Comments" then
            	    sleep 3
            		touch([@@newcom])
            when "Hacker News FAQ" then 
                    scroll_to_row "tableView", 4
                    sleep 5
                    sleep 3
            		touch([@@faq])
             when "news:yc homepage" then 
                    scroll_to_row "tableView", 4
             		sleep 5
            		touch([@@home])
                    sleep 5
             when "@news:yc Twitter" then 
                    scroll_to_row "tableView", 4
                    sleep 5
                    sleep 3
                    touch([@@tweet])
        end
    end

        def page_handler(page)
        case page
            when "Hacker News" then 
                    sleep 3
                    wait_for_elements_exist([@@back], :timeout => 10)
            when "Best Submissions" then 
                    sleep 3
                    wait_for_elements_exist([@@bestsublabel], :timeout => 10)
            when "Submission" then 
                    sleep 3
                    wait_for_elements_exist([@@subtitle], :timeout => 10)
                    #touch_goback
            when "Active Discussions" then 
                    sleep 3
                    wait_for_elements_exist([@@activelabel], :timeout => 10)
            when "Classic View" then
                    sleep 3
                    wait_for_elements_exist([@@classiclabel], :timeout => 10)
            when "Ask HN" then 
                    sleep 3
                    wait_for_elements_exist([@@asklabel], :timeout => 10)
            when "Best Comments" then 
                    sleep 3
                    wait_for_elements_exist([@@com], :timeout => 10)
            when "New Comments" then
                    sleep 3
                    wait_for_elements_exist([@@com], :timeout => 10)
            when "Hacker News FAQ" then 
                    sleep 3
                    wait_for_elements_exist([@@faqlabel], :timeout => 10)
             when "news:yc homepage" then 
                    sleep 3
                    wait_for_elements_exist([@@newsychome], :timeout => 10)
             when "@news:yc Twitter" then 
                    sleep 3
                    wait_for_elements_exist([@@tweethome], :timeout => 10)
        end
    end

    def table_view
        touch(@@tableviewer) 
        sleep 3
    end

    def find_item
        item = @@reply
      if element_does_not_exist(item) then
            wait_poll(:until_exists => item, :timeout => 40, :timeout_message => "Could not locate '#{item}'") do 
                 #scroll("tableView index:0",:down)
                 scroll_to_cell
                 sleep 2
             end
        else
          sleep 2
          #touch(@@activelabel)
          #touch(@@back)
        end
     end
        # Do one more scroll after you locate the post so that entire post is visible
       # scroll(@@feedtable,:down)
 
    def story_time
        touch(@@detailsheader)
        sleep 5
        puts @@detailstitle
        sleep 5
    end

    def get_title
      sleep 2
       page_title = eval("query(title,:text)[0]")
            wait_for(:timeout => 10,:timeout_message => "Title not found.  It says '#{page_title}'") do
           page_title == "Notifications"
        end
  end

    def faq_bar(choice)
        sleep 2
         case choice
            when "R" then 
                    touch(@@readability)
                    sleep 5
            when "Refresh" then 
                    touch(@@refresh)
                    sleep 3
            when "Action" then
                    touch(@@moreactions)
                    sleep 3
                    touch(@@noprogress)                 
         end
    end

    def slide_over
    	swipe "left", {:query => "collectionView"}
    end

    def touch_sub
    	sleep 4
    	touch(@@submission)
    end

    def seemenu
        wait_for_elements_exist([@@back], :timeout => 10)
    end
  
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

