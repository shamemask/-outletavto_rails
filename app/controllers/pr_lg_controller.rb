class PrLgController < ApplicationController
  require 'rubygems'
  require 'rest-client'
  require 'json'

  API_SECRET_KEY = 'LRwcBJHfEWlsCekJGPievDGwhjuxbpDl'
  BASE_API_URL = 'https://api.pr-lg.ru/'

  def search_warehouses
    response = RestClient.get(BASE_API_URL + 'search/warehouses', { params: { secret: API_SECRET_KEY, action: "list" } })
    @resource_name = 'Склады'
    @fields = ['name', 'city', 'capacity', 'used_space']
    @results = JSON.parse(response.body)
    render 'search/index'
  end

  def search_products
    article_number = params[:article_number]
    response = RestClient.get(BASE_API_URL + 'search/products', { params: { secret: API_SECRET_KEY, article: article_number } })
    @resource_name = "Товары"
    @fields = ['article', 'name', 'whname', 'count', 'price']
    @results = JSON.parse(response.body)
    render 'search/index'
  end

  def search_customers
    name = params[:name]
    response = RestClient.get(BASE_API_URL + 'search/customers', { params: { secret: API_SECRET_KEY, name: name } })
    @resource_name = "Клиенты"
    @fields = ['name', 'email', 'phone']
    @results = JSON.parse(response.body)
    render 'search/index'
  end

  def search_items
    article_number = params[:article_number]
    amount = params[:amount]
    response = RestClient.get(BASE_API_URL + 'search/items', { params: { secret: API_SECRET_KEY, article: article_number, amount: amount } })
    render json: JSON.parse(response.body)
  end

  def add_to_cart
    article_number = params[:article_number]
    warehouse_id = params[:warehouse_id]
    count = params[:count]
    response = RestClient.post(BASE_API_URL + 'cart/add', { secret: API_SECRET_KEY, article: article_number, id_warehouse: warehouse_id, count: count })
    render json: JSON.parse(response.body)
  end

end
