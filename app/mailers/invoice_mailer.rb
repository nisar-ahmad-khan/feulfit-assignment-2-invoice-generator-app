class InvoiceMailer < ApplicationMailer
  def invoice_email(invoice)
    @invoice = invoice

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(
        template: "invoices/show",
        layout: "pdf"
      )
    )

    attachments["fuelfit-#{invoice.id}.pdf"] = pdf

    mail(
      to: @invoice.client.email,
      subject: "Your Invoice ##{@invoice.id}"
    )
  end
end
