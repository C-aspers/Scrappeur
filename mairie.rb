require 'nokogiri'
require 'open-uri'

def adresse
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  #puts page.class 
  return page
end

def email_links(page)
  one_emails_links = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  puts one_emails_links
end 

def get_townhall_urls(page)
all_email = page.css('td.cmc-tablecell--sort-byemail').map{|email| email.text}
  return all_email
end

def hash_final(all_cryptos_symbols, all_cryptos_prices)
  puts all_cryptos_symbols
  puts all_cryptos_prices
end

def perform
  page = adresse
  one_emails_links = email_links(page)
  all_email = get_townhall_urls(page)
end 

perform

