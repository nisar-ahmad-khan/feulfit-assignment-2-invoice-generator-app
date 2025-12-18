class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = current_user.invoices.includes(:client)
  end

  def new
    @invoice = current_user.invoices.new
    @invoice.line_items.build
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path, notice: "Invoice created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  @invoice = Invoice.find(params[:id])
  respond_to do |format|
    format.html
    format.pdf do
      render pdf: "feulfit_invoice_#{@invoice.id}",
             template: "invoices/show",
             formats: [:html],
             layout: 'pdf'
    end
  end
end


  def edit
    @invoice.line_items.build if @invoice.line_items.empty?
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to invoices_path, notice: "Invoice updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_path, notice: "Invoice deleted"
  end

  private

  def set_invoice
    @invoice = current_user.invoices.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(
      :client_id, :issue_date, :due_date, :status, :tax, :discount,
      line_items_attributes: [:id, :product_id, :quantity, :unit_price, :_destroy]
    )
  end
end
