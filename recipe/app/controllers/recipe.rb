RecipeApp::App.controllers :recipe do
  
  get :index do
    @recipes = Recipe.all
    @categories = Category.all 	
    render "recipe/index"

  end

 	get :show, :map => 'recipe/ingredients/:name' do
	 	@recipe = Recipe.where("name = ?", params[:name]).first
	 	@ingredients = @recipe.ingredients
		render 'recipe/show'		
  end

  post :show do

	 	if Recipe.where("name = ?", params[:name]).first != nil

		 	@recipe = Recipe.where("name = ?", params[:name]).first
		 	@ingredients = @recipe.ingredients
	  	render 'recipe/show'
	  
	  else

	  	flash[:notice] = "Sorry recipe not found"
	  	redirect(url(:recipe, :index))
	  
	  end
	end

	get :list, :map => 'recipe/categories/:id' do
		@recipes = Recipe.where("category_id = ?", params[:id])

		render 'recipe/show'
	end




end
