require 'calabash-cucumber/ibase'

class NavTabBarPage < Calabash::IBase
    include PagePopulator  
 
    @@tabbar = "toolbarNavigationButton"

    @@reply = "navigationButton index:0"
    @@upvote = "navigationButton index:1"
    @@flag = "navigationButton index:2"
    @@downvote = "navigationButton index:3"
    @@action = "navigationButton index:4"
    @@share = "navigationButton index:5"
    @@back = "label {text LIKE '*Hacker News*'}"
    @@homeimg = "tabBarSwappableImageView index:0"
    @@newimg = "tabBarSwappableImageView index:1"
    @@personimg = "tabBarSwappableImageView index:2"
    @@searchimg = "tabBarSwappableImageView index:3"
    @@moreimg = "tabBarSwappableImageView index:4"
    @@continue = "label {text LIKE '*Continue*'}"
    @@cancel = "label {text LIKE '*Cancel*'}" 
    @@doflag = "label {text LIKE '*Flag*'}" 
    @@submitter = "label {text LIKE '*Submitter*'}" 
    @@subflag = "toolbarButton index:2"
    #@@doflag = "label index:6"
    #@@noprogress = "label index:9"
    


#----------------------------------------------
  def select_storytab(index)
        case index
            when "Reply" then
               touch(@@reply)
               sleeper(30)
            when "Upvote" then
               vote_handler
               sleeper(30)
            when "Flag" then
               touch(@@flag)
               sleeper(30)
            when "Downvote" then
               touch(@@downvote)
               sleeper(30)
            when "Action" then
               touch(@@action)
               sleeper(30)
        end
 end
#----------------------------------------------

 	def vote_handler
 		sleeper(16)
 		touch(@@upvote)
 		if element_exists([@@continue]) then
 			sleeper(16)
 			touch(@@progress)
 			page(MorePage).backpage
 		else
 			sleeper(16)
 			page(MorePage).backpage
  		end
  	end
#----------------------------------------------

  	def flag_handler(action)
  		case action
			when "Flag" then 
  		  	  touch(@@doflag)
  		  	  sleeper(25)
 			      touch(@@continue)
  		when "Cancel" then
  		  	   touch(@@cancel)
      end
	end
#----------------------------------------------

	def sub_handler
			touch(@@submitter)
  end
#----------------------------------------------

end