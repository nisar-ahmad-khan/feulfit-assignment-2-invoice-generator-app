module ApplicationHelper
  def pdf_rendering?
    defined?(WickedPdf)
  end
end


