# frozen_string_literal: true

class ToolsController < OpenReadController
  before_action :set_tool, only: %i[show update destroy]

  # GET /examples
  # GET /examples.json
  def index
    @tools = Tool.all

    render json: @tools
  end

  # GET /examples/1
  # GET /examples/1.json
  def show
    render json: @tool
  end

  # POST /examples
  # POST /examples.json
  def create
    @tool = Tool.build(tool_params)

    if @tool.save
      render json: @tool, status: :created
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end


  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :quantity, :available)
  end

  private :set_tool, :tool_params
end
