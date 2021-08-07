module RigsHelper

    def company_rigs
        if @company 
            content_tag(:h1, "#{@company.name}'s Rigs:")
        else
            content_tag(:h2, "All Rigs")
        end  
    end
end
