require 'rubygems'
require 'pry'
require 'nokogiri'
#require 'rest-client'
require 'open-uri'

    
    def adresse
        #page = ""
        page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all"))
        puts "Ce programme va scrapper les données (sigles et valeurs) des cryptomonnaies"
        return page
    end

    def scrap_symbol_crypto(page)
        all_cryptos_symbols = Array.new
        all_cryptos_symbols = page.css('td.cmc-tablecell--sort-bysymbol').map{|cryptos| scryptos.text}
        #puts all_cryptos_symbols
        return all_cryptos_symbols
    end

    def scrap_prices(page)
        all_cryptos_prices = page.xpath('///*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/div/a') #extrait le price de chaque tr
        #puts "#{all_cryptos_prices}"
        return all_cryptos_prices
    end
    

    def hash_final(all_cryptos_symbols, all_cryptos_prices)
        puts all_cryptos_symbols
        puts all_cryptos_prices
    end

    def perform
        page = adresse
        all_cryptos_symbols = scrap_symbol_crypto(page)
        all_cryptos_prices = scrap_prices(page)
        hash_final(all_cryptos_symbols, all_cryptos_prices)
    end
          
    perform

    