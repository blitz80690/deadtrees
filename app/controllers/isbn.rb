
require 'sinatra'

class App < Sinatra::Base
  enable :sessions

	get '/isbn' do

		awsAccessKeyID = 'YOUR KEY HERE'
		awsSecretKey = 'YOUR SECRET KEY HERE'
		awsAssociateTag = 'YOUR ASSOCIATE TAG HERE'

		isbn = '978-0735619678'

		host = 'ecs.amazonaws.com'
		path = '/onca/xml'

		args = Hash.new
		args = {}

		args[:awsAccessKeyID] = awsAccessKeyID
		args[:awsSecretKey] = awsSecretKey	
		args[:awsAssociateTag] = awsAssociateTag
		args[:IdType] = 'ISBN'
		args[:ItemId] = isbn
		args[:Operation] = 'ItemLookup'
		args[:ResponseGroup] = 'Medium'
		args[:SearchIndex] = 'Books'
		args[:Service] = 'AWSECommerceService'
		args[:Timestamp] = Time.now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z')
		args[:Version] = '2011-08-01'

		"The array is now #{args.inspect}"


	end
end