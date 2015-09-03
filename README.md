# twitter-api-beiber
Rails app builds up a user managed dictionary to filter the last X:tweets

RESTFULL API

  new_article GET    /articles/new(.:format)      articles#new
  
 edit_article GET    /articles/:id/edit(.:format) articles#edit

       Prefix Verb   URI Pattern                  Controller#Action
      
     articles GET    /articles(.:format)          articles#index
    
              POST   /articles(.:format)          articles#create

      article GET    /articles/:id(.:format)      articles#show
     
              PATCH  /articles/:id(.:format)      articles#update
             
              PUT    /articles/:id(.:format)      articles#update
             
              DELETE /articles/:id(.:format)      articles#destroy
             
         root GET    /                            welcome#index
        
