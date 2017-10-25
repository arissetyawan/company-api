class CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    respond_to do |format|
      format.html { render :index }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    respond_to do |format|
      format.html { render :show }
    end
  end

  # GET /companies/new
  def new
    @company = Company.new
    respond_to do |format|
      format.html { render :show }
    end
  end

  # GET /companies/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
    end
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :description, :total_employee, :address, :country)
    end
end
