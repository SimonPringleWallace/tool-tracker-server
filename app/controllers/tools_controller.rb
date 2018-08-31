# frozen_string_literal: true

class ToolsController < ProtectedController
  before_action :set_tool, only: %i[show update destroy]

  # GET /examples
  # GET /examples.json
  def index
    @tools = current_user.tools.all

    render json: @tools
  end

  # GET /tools/1
  # GET /tools/1.json
  def show
    render json: @tool
  end

# DELETE /Tools/1
  def destroy
    @tool.destroy

    head :no_content
  end

#update a tool
  def update
    if @tool.update(tool_params)
      render json: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  # POST /tools
  # POST /tools.json
  def create
    @tool = current_user.tools.new(tool_params)

    if @tool.save
      render json: @tool, status: :created
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end


  def set_tool
    @tool = current_user.tools.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :quantity, :available)
  end

  private :set_tool, :tool_params
end
