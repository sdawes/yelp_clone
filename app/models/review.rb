class Review < ApplicationRecord
  validates :rating, inclusion: (1..5)
end

# Prefix                 Verb   URI Pattern                                            Controller  #Action
#     restaurant_reviews GET    /restaurants/:restaurant_id/reviews(.:format)          reviews     #index
#                        POST   /restaurants/:restaurant_id/reviews(.:format)          reviews     #create
#  new_restaurant_review GET    /restaurants/:restaurant_id/reviews/new(.:format)      reviews     #new
# edit_restaurant_review GET    /restaurants/:restaurant_id/reviews/:id/edit(.:format) reviews     #edit
#      restaurant_review GET    /restaurants/:restaurant_id/reviews/:id(.:format)      reviews     #show
#                        PATCH  /restaurants/:restaurant_id/reviews/:id(.:format)      reviews     #update
#                        PUT    /restaurants/:restaurant_id/reviews/:id(.:format)      reviews     #update
#                        DELETE /restaurants/:restaurant_id/reviews/:id(.:format)      reviews     #destroy
