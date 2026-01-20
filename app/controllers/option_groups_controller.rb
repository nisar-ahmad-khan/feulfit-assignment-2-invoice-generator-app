class OptionGroupsController < ApplicationController
  before_action :set_option_group, only: %i[ show edit update destroy ]

  # GET /option_groups or /option_groups.json
  def index
    @option_groups = OptionGroup.all
  end

  # GET /option_groups/1 or /option_groups/1.json
  def show
  end

  # GET /option_groups/new
  def new
    @option_group = OptionGroup.new
  end

  # GET /option_groups/1/edit
  def edit
  end

  # POST /option_groups or /option_groups.json
  def create
    @option_group = OptionGroup.new(option_group_params)

    respond_to do |format|
      if @option_group.save
        format.html { redirect_to @option_group, notice: "Option group was successfully created." }
        format.json { render :show, status: :created, location: @option_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @option_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /option_groups/1 or /option_groups/1.json
  def update
    respond_to do |format|
      if @option_group.update(option_group_params)
        format.html { redirect_to @option_group, notice: "Option group was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @option_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @option_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /option_groups/1 or /option_groups/1.json
  def destroy
    @option_group.destroy!

    respond_to do |format|
      format.html { redirect_to option_groups_path, notice: "Option group was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_group
      @option_group = OptionGroup.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def option_group_params
      params.expect(option_group: [ :menu_item_id, :name, :required, :min_selection, :max_selection ])
    end
end
