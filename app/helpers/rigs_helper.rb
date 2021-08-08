module RigsHelper

    def company_rigs
        if @company 
            content_tag(:h1, "#{@company.name}'s Rigs:")
        else
            content_tag(:h2, "All Rigs")
        end  
    end

    def display_posts
        if @user.posts.empty?
          tag.h2(link_to('No posts yet - write a post here', new_post_path))
        else
          user = @user == current_user ? 'Your' : "#{@user.username}'s"
          content_tag(:h2, "#{user} #{pluralize(@user.posts.count, 'Post')}:")
    
        end
      end
end
