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
    #@@doflag = "label index:6"
    #@@noprogress = "label index:9"
    @@progress = "label {text LIKE '*Continue*'}"
    @@noprogress = "label {text LIKE '*Cancel*'}"
    

#######################################
####    Master Methods start here     #
####                                  #
####                                  #
####                                  #
#######################################
#-----------------------------------------------
#login method
    def more_login
        page(FooterTabBarPage).select_tab("Profile")
        page(LoginPage).await
        page(LoginPage).login("valid")
    end
#-----------------------------------------------
#this is the method script for navigating to more screen

def more_navigate
    page(FeedDetailsPage).await
    page(FooterTabBarPage).select_tab("More")
    page(MorePage).seemenu
end
#-----------------------------------------------
#this is the method script for reading the best subs

def read_success(novel)
    case novel
        when "Best Submissions" then
            page(MorePage).select_more_actions("Best Submissions")
            page(MorePage).page_handler("Best Submissions")
            page(FeedDetailsPage).touch_row
            page(MorePage).page_handler("Submission")
            page(MorePage).backpage
            page(MorePage).backpage
        when "Active Discussions" then
            page(MorePage).select_more_actions("Active Discussions")
            page(MorePage).page_handler("Active Discussions")
            page(FeedDetailsPage).touch_row
            page(MorePage).page_handler("Active")
            page(MorePage).story_time
            page(MorePage).backpage
            page(MorePage).backpage
            page(MorePage).page_handler("Active Discussions")
            page(MorePage).backpage
        when "archived submissions" then
            page(MorePage).select_more_actions("Classic View")
            page(MorePage).page_handler("Classic View")
            page(FeedDetailsPage).touch_row
            page(MorePage).page_handler("Submission")
            page(MorePage).table_view
            page(MorePage).find_item
            page(MorePage).backpage
            page(MorePage).page_handler("Classic View")
            page(MorePage).backpage
        end
end
#-----------------------------------------------
#this is the method script for posting a question 
    
    def ask_post
        page(MorePage).select_more_actions("Ask HN")
        page(MorePage).page_handler("Ask HN")
        page(FeedDetailsPage).touch_row
        page(NavTabBarPage).select_storytab("Reply")
        page(SubmissionPage).create_post("reply post")
        page(NavTabBarPage).flag_handler("Cancel")
        page(SubmissionPage).touch_discard
        page(SubmissionPage).await
        page(MorePage).backpage
        page(MorePage).page_handler("Ask HN")
        page(MorePage).backpage
    end  
#-----------------------------------------------
#this is the method script for flagging a comment
    def flag_comment
        page(MorePage).select_more_actions("Best Comments")
        page(MorePage).page_handler("Best Comments")
        page(MorePage).table_view
        page(MorePage).find_item
        page(MorePage).touch_subflag
        page(NavTabBarPage).flag_handler("Cancel")
        page(MorePage).backpage
        page(MorePage).select_more_actions("New Comments")
        page(MorePage).page_handler("New Comments")
        page(MorePage).backpage
end 
#-----------------------------------------------
#this is the method script for second toolbar options
    def tab_options
        page(MorePage).faq_bar("Action")
        page(MorePage).faq_bar("Refresh")
        page(MorePage).faq_bar("R")
        page(MorePage).backpage
    end
#######################################
####    Helper Methods start here     #
####                                  #
####                                  #
####                                  #
#######################################
#--------------------------------------------
    def pause
      	sleeper(25)
    end
#----------------------------------------------
	def touch_subflag
        touch(@@subflag)
    end
#----------------------------------------------
    def touch_goback
	  sleeper(20)
      touch(@@goback)
    end
#----------------------------------------------
    def backpage
      touch(nil, :offset => {:x => 8, :y => 26})
      sleeper(20)
    end
#----------------------------------------------
    def touch_discard
      touch(@@discard)
    end
#----------------------------------------------
    def search_value
		enter_text(@@textview,@@search_value)
	end
#----------------------------------------------
    def verify_page_elements
		sleep(20)
        if
          wait_for_elements_exist([@@karma], :timeout => 10)
          wait_for_elements_exist([@@average], :timeout => 10)
        end
        if
          wait_for_elements_exist([@@retry], :timeout => 10)
          touch(@@submission)
        end
    end
#----------------------------------------------
    def select_more_actions(choice)
        case choice
            when "Hacker News" then 
                    sleeper(25)
                    touch([@@back])
            when "Best Submissions" then 
            		sleeper(25)
            		touch([@@bestsub])
            when "Active Discussions" then 
            		sleeper(25)
            		touch([@@active])
            when "Classic View" then
            	    sleeper(25)
            		touch([@@classic])
            when "Ask HN" then 
            		sleeper(25)
            		touch([@@askhn])
            when "Best Comments" then 
            		sleeper(25)
            		touch([@@bestcom])
            when "New Comments" then
            	    sleeper(25)
            		touch([@@newcom])
            when "Hacker News FAQ" then 
                    scroll_to_row "tableView", 4
                    sleeper(25)
            		touch([@@faq])
             when "news:yc homepage" then 
                    scroll_to_row "tableView", 4
             		sleeper(25)
            		touch([@@home])
                    sleep(15)
             when "@news:yc Twitter" then 
                    scroll_to_row "tableView", 4
                    sleeper(25)
                    touch([@@tweet])
        end
    end
#----------------------------------------------
    def page_handler(page)
        case page
            when "Hacker News" then 
                    sleeper(16)
                    wait_for_elements_exist([@@back], :timeout => 10)
            when "Best Submissions" then 
                    sleeper(16)
                    wait_for_elements_exist([@@bestsublabel], :timeout => 10)
            when "Submission" then 
                    sleeper(16)
                    wait_for_elements_exist([@@subtitle], :timeout => 10)
                    #touch_goback
            when "Active Discussions" then 
                    sleeper(16)
                    wait_for_elements_exist([@@activelabel], :timeout => 10)
            when "Classic View" then
                    sleeper(16)
                    wait_for_elements_exist([@@classiclabel], :timeout => 10)
            when "Ask HN" then 
                    sleeper(16)
                    wait_for_elements_exist([@@asklabel], :timeout => 10)
            when "Best Comments" then 
                    sleeper(16)
                    wait_for_elements_exist([@@com], :timeout => 10)
            when "New Comments" then
                    sleeper(16)
                    wait_for_elements_exist([@@com], :timeout => 10)
            when "Hacker News FAQ" then 
                    sleeper(16)
                    wait_for_elements_exist([@@faqlabel], :timeout => 10)
             when "news:yc homepage" then 
                    sleeper(16)
                    wait_for_elements_exist([@@newsychome], :timeout => 10)
             when "@news:yc Twitter" then 
                    sleeper(16)
                    wait_for_elements_exist([@@tweethome], :timeout => 10)
        end
    end
#----------------------------------------------
    def table_view
        touch(@@tableviewer) 
        sleep 3
    end
#----------------------------------------------
    def find_item
        item = @@reply
      if element_does_not_exist(item) then
            wait_poll(:until_exists => item, :timeout => 40, :timeout_message => "Could not locate '#{item}'") do 
                 #scroll("tableView index:0",:down)
                 scroll_to_cell
                 sleeper(16)
             end
        else
          sleeper(16)
          #touch(@@activelabel)
          #touch(@@back)
        end
     end
        # Do one more scroll after you locate the post so that entire post is visible
       # scroll(@@feedtable,:down)
 #----------------------------------------------
    def story_time
        touch(@@detailsheader)
        sleeper(30)
    end
#----------------------------------------------
    def get_title
      sleeper(16)
       page_title = eval("query(title,:text)[0]")
            wait_for(:timeout => 10,:timeout_message => "Title not found.  It says '#{page_title}'") do
           page_title == "Notifications"
        end
  end
#----------------------------------------------
    def faq_bar(choice)
        sleeper(16)
         case choice
            when "R" then 
                    touch(@@readability)
                    sleeper(25)
            when "Refresh" then 
                    touch(@@refresh)
                    sleeper(25)
            when "Action" then
                    touch(@@moreactions)
                    sleeper(25)
                    touch(@@noprogress)                 
         end
    end
#----------------------------------------------
    def slide_over
    	swipe "left", {:query => "collectionView"}
    end
#----------------------------------------------
    def touch_sub
    	sleeper(20)
    	touch(@@submission)
    end
#----------------------------------------------
    def seemenu
        wait_for_elements_exist([@@back], :timeout => 10)
    end
 #----------------------------------------------
    def create_post(action)
        sleeper(20)
        case action
            when "reply post" then 
            		set_text(@@textview, @@text_value)
            when "search query" then 
            		touch(@@getsearch)
            		sleeper(16)
            		set_text("fieldEditor index:0", @@searchtext)
            		sleeper(25)
            		keyboard_enter_char "Return"
         end
    end
#----------------------------------------------

end

