module Api
  module V1
    class CompaniesController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_company, only: [:show, :edit, :update, :destroy]

      # GET /companies
      # GET /companies.json
      def index
        @companies = Company.all
        respond_to do |format|
          format.json { render :json => @companies }
        end
      end

      # GET /companies/1
      # GET /companies/1.json
      def show
        respond_to do |format|
          format.json { render :json => { company: @company} }
        end
      end

      # GET /companies/1/edit
      def edit
        respond_to do |format|
          format.json { render :json => { company: @company} }
        end
      end

      # POST /companies
      # POST /companies.json
      def create
        @company = Company.new(company_params)

        respond_to do |format|
          if @company.save
            format.json { render :json => {company: @company}, status: 201 }
          else
            format.json { render json: {errors: @company.errors}, status: 400 }
          end
        end
      end

      # PATCH/PUT /companies/1
      # PATCH/PUT /companies/1.json
      def update
        respond_to do |format|
          if @company.update(company_params)
            format.json { render :json => {company: @company}, status: 200 }
          else
            format.json { render json: {errors: @company.errors}, status: 400 }
          end
        end
      end

      # DELETE /companies/1
      # DELETE /companies/1.json
      def destroy
        @company.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_company
          @company = Company.find_by_id(params[:id])
          return @company if @company.present?

          respond_to do |format|
            format.json { head :no_content }
          end
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def company_params
          begin
          params.require(:company).permit(:name, :description, :total_employee, :address, :country)
          rescue
          {}
          end
        end
    end
  end
end
