class HomeController < ApplicationController    
    def index
        @ad = { 
            title: "大型廣告",
            des: "這是廣告!!!",
            action_title: "閱讀更多",
         }
    end
end
