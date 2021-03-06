class Api::V1::TodosController < Api::V1::ApiController

  def index
    scope  = :by_incomplete
    scope  = params[:sort].to_sym unless params[:sort].blank?
    @todos = current_user.todos.send scope
  end

  def show
    @todo = current_user.todos.find params[:id]
  end

  def create
    @todo = current_user.todos.build params[:todo]
    if @todo.save
      @todo.reload
      render :show, status: :created
    else
      render_api_errors t('api.error_title'), @todo.errors
    end
  end

  def update
    @todo = current_user.todos.find params[:id]
    if @todo.update_attributes params[:todo]
      render :show
    else
      render_api_errors t('api.error_title'), @todo.errors
    end
  end

  def destroy
    @todo = current_user.todos.find params[:id]
    if @todo.destroy
      render_api_message t(:object_destroyed, model: "move")
    else
      render_api_errors t('api.error_title'), [t(:object_destroyed_errors, model: "todo")]
    end
  end
end