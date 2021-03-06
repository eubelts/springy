require 'json'
require 'logger'
require 'forwardable'
require 'elasticsearch'

require "springy/version"
require 'springy/api'
require 'springy/utils'
require 'springy/and_collector'
require 'springy/factory'
require 'springy/node'
require 'springy/results'
require 'springy/scopes'
require 'springy/errors'

module Springy

  module_function

  def client
    @client ||= Elasticsearch::Client.new
  end

  def client=(client)
    @client = client
  end

  def search(options = {})
    client.search(options)
  rescue Elasticsearch::Transport::Transport::Errors::BadRequest => bre
    msg = bre.message[-150..-1]
    msg << "\n\n"
    msg << JSON.pretty_generate(options)
    raise msg
  end

  def index_exists?(name)
    client.indices.exists? index: name
  end

  def delete_index(name)
    client.indices.delete(index: name) if index_exists? name
  end

  def create_index(name, params = {})
    client.indices.create({index: name}.merge(params)) unless index_exists? name
  end

  def refresh_index(name, params = {})
    client.indices.refresh({index: name}.merge(params)) if index_exists? name
  end

  def count_index(name, params = {})
    client.count({index: name}.merge(params))['count']
  end

  def index_document(params = {})
    Utils.require_params!(:index_document, params, :index, :type, :body)

    raise IndexDoesNotExistError.new(
      "index #{params[:index]} does not exist"
    ) unless index_exists? params[:index]

    client.index(params)
  end

  def query(options = {})
    API.new(root: options)
  end
end
