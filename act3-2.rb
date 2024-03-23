def parse_invoices(invoice_data)
  reg = /(\d{4}-\d{2}-\d{2}) - ([\w\d]+) - ([\w\s]+) - \$(\d+)/
  invoice_data.each_line do |entry|
    entry_match = entry.match(reg)

    if entry_match
      date = entry_match[1]
      inv_num = entry_match[2]
      client_name = entry_match[3]
      amount = entry_match[4]

      puts "Date: #{date}, Invoice Number: #{inv_num}, Client: #{client_name}, Amount: $#{amount}"
    end
  end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)
