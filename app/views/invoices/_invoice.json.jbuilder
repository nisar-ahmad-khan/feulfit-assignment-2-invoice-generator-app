json.extract! invoice, :id, :invoice_number, :issue_date, :due_date, :status, :client_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
