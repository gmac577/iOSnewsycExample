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

   
    def verify_feed_elements
        wait_for_elements_exist([@@feedtable], :timeout => 10)
        wait_for_elements_exist([@@storycell], :timeout => 10)
        wait_for_elements_exist([@@compose], :timeout => 10)
    end

    def touch_row
         touch(@@story)
    end

    def touch_rec
        touch(@@reclabel)
    end

    def see_new
        wait_for_elements_exist(@@new, :timeout => 10)
        self
    end

    def view_search(searchtext)
        section=0
        #scroll_to_cell(:row => 0, :section => 0)  #scroll to top of table
        sleep 1
#Below code loops through each cell to check if the appropriate text was found
        each_cell(:animate => false, :post_scroll => 0.2) do |row, sec|
            if query("tableViewCell indexPath:#{row},#{sec} label", :searchtext).first==searchtext
                break # if text found break from loop
            end
        section=section+1
       end
    end










end
