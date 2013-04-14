RecipeApp::App.controllers :recipe do
  
  get :index do
    @recipes = Recipe.all	

    render "recipe/index"

  end

 get :show, :map => 'recipe/ingredients/:name' do
 	#this first gets it out of the array.	
 	@recipe = Recipe.where("name = ?", params[:name]).first
 	@ingredients = @recipe.ingredients

  render 'recipe/show'
 end




end
