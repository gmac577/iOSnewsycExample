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

#######################################
####    Master Methods start here     #
####                                  #
####                                  #
####                                  #
#######################################

#-----------------------------------------------
#this is the method script for successful URL submit

def post_success(post)
      page(FeedDetailsPage).await
      page(FooterTabBarPage).select_tab("Profile")
      page(LoginPage).await
      page(LoginPage).login("valid")
      page(FeedDetailsPage).await
      page(FeedDetailsPage).touch_share
  case post
    when "an URL" then
      page(FeedDetailsPage).touch_choice("Submit URL")
      page(SubmissionPage).create_post("URL title")
      page(FeedDetailsPage).touch_choice("Contents")
      page(SubmissionPage).create_post("URL post")
      page(SubmissionPage).touch_discard
    when "a Text" then
      page(FeedDetailsPage).touch_choice("Submit Text")
      page(SubmissionPage).create_post("text title")
      page(FeedDetailsPage).touch_choice("Contents")
      page(SubmissionPage).create_post("text post")
      page(SubmissionPage).touch_discard
  end
end
#-----------------------------------------------


#######################################
####    Helper Methods start here     #
####                                  #
####                                  #
####                                  #
#######################################
#--------------------------------------------
    def verify_feed_elements
        wait_for_elements_exist([@@feedtable], :timeout => 10)
        wait_for_elements_exist([@@storycell], :timeout => 10)
        wait_for_elements_exist([@@compose], :timeout => 10)
    end
#----------------------------------------------
    def touch_row
         sleeper(16)
         touch(@@story)
    end
#----------------------------------------------
    def touch_rec
        sleeper(16)
        touch(@@reclabel)
    end

#----------------------------------------------
    def touch_body_text
        sleeper(16)
        touch(@@bodytext)
    end
    
#----------------------------------------------
    def touch_choice(choice)
      case choice
            when "Submit Text" then 
                  sleeper(25)
                  touch([@@submittext])
            when "Submit URL" then 
                  sleeper(25)
                  touch([@@submiturl])
            when "Contents" then 
                  sleeper(25)
                  touch([@@bodytext])
      end
    end
#----------------------------------------------

    def touch_share
      touch(@@compose)
    end
#----------------------------------------------
end
