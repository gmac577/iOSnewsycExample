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
    @@saved = "tableViewCell {text LIKE '*Saved*'}"
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
    @@title = "textField index:0"
    @@url = "PlaceholderTextView index:0"
    @@bodytext = "PlaceholderTextView index:0"
    @@discard = "label {text LIKE '*Discard*'}"


#######################################
####     Master Methods start here    #
####                                  #
####                                  #
####                                  #
#######################################
#--------------------------------------------
#navigating to the submission screen
    def sub_navigate
        page(FeedDetailsPage).touch_row
        page(MorePage).page_handler("Submission")
    end

#--------------------------------------------
#posting a reply method
    def sub_post
        page(NavTabBarPage).select_storytab("Reply")
        page(SubmissionPage).create_post("reply post")
        page(NavTabBarPage).flag_handler("Cancel")
        page(SubmissionPage).touch_discard
    end

#--------------------------------------------
#flagging a story method
    def sub_flag
        page(MorePage).touch_subflag
        page(NavTabBarPage).flag_handler("Cancel")
        page(MorePage).touch_subflag
        page(NavTabBarPage).flag_handler("Flag")
        sleeper(25)
        page(MorePage).backpage
        sleeper(16)
     end

#--------------------------------------------
#viewing a users profile method
    def sub_view
        page(NavTabBarPage).select_storytab("Action")
        page(NavTabBarPage).flag_handler("Cancel")
        page(NavTabBarPage).select_storytab("Action")
        page(NavTabBarPage).sub_handler
        page(SubmissionPage).verify_page_elements
        page(SubmissionPage).select_action("Submissions")
        page(SubmissionPage).select_action("Comments")
        page(MorePage).backpage
    end
    
#######################################
####    Helper Methods start here     #
####                                  #
####                                  #
####                                  #
#######################################


#-----------------------------------------------
     def pause
      	sleeper(25)
    end
#----------------------------------------------
	def touch_back
	  sleeper(16)
      touch(@@back)
    end
#----------------------------------------------
    def touch_discard
      sleeper(16)
      touch(@@discard)
    end
#----------------------------------------------
    def search_value
		enter_text(@@textview,@@search_value)
	end
#----------------------------------------------
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
#----------------------------------------------
     def select_action(choice)
        case choice
            when "Submissions" then 
            		touch(@@submissions)
                    sleeper(20)
            		page(MorePage).backpage
            when "Comments" then
            	    touch(@@comments)
            	    sleeper(20)
            		page(MorePage).backpage
            when "Saved"
                    touch(@@saved)
                    sleeper(20)
                    page(MorePage).backpage
            end
    end
#----------------------------------------------
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
#----------------------------------------------
   def slide_over
    	swipe "left", {:query => "collectionView"}
   end
#----------------------------------------------
    def touch_sub
    	sleeper(16)
    	touch(@@submission)
    end
#----------------------------------------------
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
                sleeper(16)
                touch(@@cancel)
            when "URL title" then
                set_text(@@title, @@alltitle)
            when "URL post" then
                touch(@@url)
                sleeper(16)
                set_text(@@url, @@urlbody)
                sleeper(25)
                keyboard_enter_char "Return"
                sleeper(16)
                touch(@@cancel)
         end
    end
#----------------------------------------------
end

