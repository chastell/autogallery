require 'clarifai_ruby'

module ClarifaiRuby
  class MyTagRequest < TagRequest
    def get(image_url_or_path, opts = {})
      if image_url_or_path =~ URI::regexp
        super
      else
        body = {
          encoded_data: File.new(image_url_or_path),
          model: opts[:model]
        }
        build_request!(body, opts)
        @raw_response = @client.post(TAG_PATH, body).parsed_response
        raise RequestError.new @raw_response["status_msg"] if @raw_response["status_code"] != "OK"
        TagResponse.new(raw_response)
      end
    end
  end
end

ExternalTag = Struct.new(:name, :prob)

class TaggingService
  CUTOFF = 0.6

  def initialize
    ClarifaiRuby.configure do |config|
      config.client_id = Rails.application.secrets.clarifai_id
      config.client_secret = Rails.application.secrets.clarifai_secret
    end
  end

  def get_tags(image_path)
    response = ClarifaiRuby::MyTagRequest.new.get(image_path)
    response.tag_images.first.tags.map { |x| ExternalTag.new(x.word, x.prob) }
  end

  def tag(photo)
    get_tags(photo.image.path).select { |x| x.prob > CUTOFF }.each do |external_tag|
      tag = Tag.find_or_create_by(name: external_tag.name)
      tagged_photo = TaggedPhoto.create(photo: photo, tag: tag)
    end
  end
end
