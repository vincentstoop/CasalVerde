module ApplicationHelper
  def money(number)
    number_to_currency(number, unit: "€ ", separator: ",", delimiter: ".")
  end
end
